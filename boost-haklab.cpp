//-------------------------------------------------
//         Inportaciones 
//-------------------------------------------------
#include "include/below_zero.h"
#include <cstdio>
#include <fmt/color.h>
#include <fstream>


//-------------------------------------------------
//       Nombre de espacio
//-------------------------------------------------
using namespace boost::program_options;
using namespace boost::filesystem;
using namespace boost::iostreams;
using json = nlohmann::ordered_json;

//-------------------------------------------------
//      Declaraciones de algunas funciones 
//-------------------------------------------------
void about(std::string about);


//-------------------------------------------------
//         Funcion principal main
//-------------------------------------------------
int main(int argc, const char *argv[])
{
  try
  {
  //-------------------------------------------------
  //      Variables de algunos parametros  
  //-------------------------------------------------
    string dir;
    
  //-------------------------------------------------
  //-------------------------------------------------
    options_description options{"Options"};
    options.add_options()
      ("help,h", "Print this menu and leave")
      ("help-module", value<string>(),"produce a help for a given module")
      ("version,v","print version string")
      // nombre , typo , decripcion
      ("about", value<std::string>()->notifier(about ),"Show informations about tool/framework");

   //-------------------------------------------------
   //-------------------------------------------------
    options_description config("Configuration");
    config.add_options()
        ("include-path,I",value<vector<string>>(),"include path")
        ("input-file", value<vector<string>>(),"input file")
        ("name-user", value<string>(), "Change username USER=i-Haklab");
     

   //-------------------------------------------------
   //-------------------------------------------------
    options_description dpkg("Create packages\n \
      \tList of options to automate creating deb binary packages");
    dpkg.add_options()
      ("name-pkg", value<string>(&dir), "Create directory tree\n control: Where do the package maintainer scripts go?\n src: Your executable")
      ("what-file", value<string>(), "What does the file do?")
      ("manifies", value<vector<string>>(), "Para crear el archivo de 'manifiesto' se requieren 8 \n argumentos \
      Package | Version | Architerture | Maintainer | Installed-Size | Homepage |  | Description");
            
   //-------------------------------------------------
   //-------------------------------------------------
    options_description automatitation("Automatitation Options");
    automatitation.add_options()
      ("file-manager,m","Open the file manager in the termux directory");
        
   //-------------------------------------------------
   //-------------------------------------------------
    options_description all("All");
    all.add(options).add(config).add(dpkg).add(automatitation);

    
    // Menu extructura 
   //-------------------------------------------------
   //-------------------------------------------------
    options.add(config).add(automatitation);
    
   //-------------------------------------------------
   //-------------------------------------------------
    positional_options_description positionalOptions;
    positionalOptions.add("manifies", 8);

   //-------------------------------------------------
   //-------------------------------------------------
    variables_map vm;
    store(command_line_parser(argc, argv).options(all).positional(positionalOptions).run(), vm);
    notify(vm);

   //-------------------------------------------------
   //-------------------------------------------------
    // Los menu visibles 
    if (vm.count("help")){
      fmt::print("Usage: i-haklab [options]\n");
      std::cout << options;
      return 0;
    }
   //-------------------------------------------------
   //-------------------------------------------------
    // Vercion 
    if (vm.count("version")) {
       fmt::print("Beta\n");
       return 0;        
    }
  
   //-------------------------------------------------
   //               Configuracion
   //-------------------------------------------------
    if (vm.count("name-user")){
      std::string home = string(getenv("HOME")) + "/.zshenv";
      // open file
      std::fstream zshenv;
      zshenv.open(home);
      if (!zshenv.is_open()){
          fmt::print(stderr,"Error al conf");
      }
    }
   //-------------------------------------------------
   //          Automatitation Options
   //------------------------------------------------
    if(vm.count("file-manager")){
      system("am start -a android.intent.action.VIEW -d 'content://com.android.externalstorage.documents/root/primary'");
    }

   //-------------------------------------------------
   //-------------------------------------------------
   // Opciones de creacion de paquetes 
    if (vm.count("name-pkg")){
      current_path();
      create_directories(dir + "/control" );
      create_directories( dir + "/src" );
      fmt::print(R"(
         '{}
          ├── control
          └── src')""\n",dir);
      return 0;
    }
        
   //-------------------------------------------------
   //-------------------------------------------------
    if (vm.count("manifies")){
    const auto &inputValues = vm["manifies"].as<vector<string>>(); 
    if (inputValues.size() != 8) {
        throw validation_error(validation_error::invalid_option_value,
        "input",std::to_string(inputValues.size()));
            }
      
   //-------------------------------------------------
   //-------------------------------------------------
    // Crear un objeto JSON
    json root;  
    root["control"]["Package"]       = inputValues[0];
    root["control"]["Version"]       = inputValues[1];
    root["control"]["Architerture"]  = inputValues[2];
    root["control"]["Maintainer"]    = inputValues[3];
    root["control"]["Installed-Size"]= inputValues[4];
    root["control"]["Homepage"]      = inputValues[5];
    root["control"]["Suggests"]      = inputValues[6];
    root["control"]["Description"]   = {inputValues[7]};

    
    root["control_files_dir"] = "control";
    root["deb_dir"] = "../../";

    root["data_files"]["bin/*"]["source"] = "src/*";

      
    // Crear un archivo de salida y escribir el objeto JSON en él
    std::fstream archivo("manifiest.json" , std::ios_base::out);
    archivo << root.dump(2);

    // Cerrar el archivo
    archivo.close();
    // std::cout << txt ;
    fmt::print("Se ha creado el archivo 'manifiest.json'\n");
    }
    
    // Menu que no se muestran 
    if (vm.count("help-module")){
      const string& s = vm["help-module"].as<string>();
      if (s == "defaul"){
        // std::cout << visible
      } else if (s == "packages"){
        std::cout << dpkg;
      } else {
        fmt::print(fmt::fg(fmt::color::red),"Unknown module {}  in the --help-module options\n", s);
        return 1;
      }
      return 0;
    }
    if (vm.count("num-threads")) {
            std::cout << "The 'num-threads' options was set to "
                 << vm["num-threads"].as<int>() << "\n";            
    }   
  }
  catch (const error &ex){
  fmt::print(stderr,"{}\n", ex.what());
  }
} 
