/* Autor: @demon_rip
 * File : command_line_arg 
 */
#pragma once

#include <complex>
#include <iostream>
#include <boost/program_options.hpp>
#include <boost/beast/http/verb.hpp>
#include <string>

namespace po = boost::program_options;

using std::string;
using std::endl;
using std::cerr;
using std::cout;

// clang-format off
//a, b, c, d, e, f, g, h, i, j, k, l, m, n, ñ, o, p, q, r, s, t, u, v, w, x, y, z.
//



// Almacenamiento de argumentos 
class arguments {
  /*
   * Conoser valor en tiempo de
   * compilacion 
   */
  constexpr static auto help_option           = "help,h";
  //constexpr static auto help_module_option  = "help-module-root";
  constexpr static auto version_option        = "version,v";
  constexpr static auto username_option       = "username";
  constexpr static auto files_option_name     = "input-files";
  constexpr static auto files_options_path    = "input-path";
  constexpr static auto port_option           = "port";
  constexpr static auto host_options          = "host"; 
  constexpr static auto files_update_file     = "update-file,U"; 
  constexpr static auto files_output          = "output,o"; 
  constexpr static auto server_php            = "server-php";
  constexpr static auto Interface             = "interface-list";
  constexpr static auto ctf_red_tram          = "dir-red-team";
  constexpr static auto ctf_mkt               = "mkt";
  constexpr static auto About                 = "about";
  constexpr static auto WepStatus             = "wep-status";
  constexpr static auto Request               = "request";
  //constexpr static auto Bypass                = "403bypass";
  po::variables_map variables;
  //   (feiend) Otorga acceso a los mienbros pribados y protegidos
  friend class command_line_argument_parser;
public:
  arguments(po::variables_map variables)
      : variables(variables) {}
  //  (bool)
  bool no_arguments();
  //
  std::string username();
  // --port 
  int port();
  // --request
  string FRequest();
  // --wep-status
  string  WepStatusCode();
  // --mkt
  string  CreateMkt();
  // --
  const std::vector<std::string> filenames();
  // --
  const std::vector<std::string> filepath(); 
  // --    
  bool file_update();
  // -- interface-list 
  bool FInterface();
  // --about
  string FAbout();
}; // end arguments 





class command_line_argument_parser {
  // Opciobes  
  po::options_description desc{"Options"};
  po::options_description red{"Red"};
  po::options_description automatitation{"Automatitation Options"};
  po::options_description server{"Servers"};
  po::options_description ctf{"CTF"};
  po::options_description info{"Info"};
public:
  command_line_argument_parser() {
    desc.add_options()
      (arguments::help_option, "Print this menu and leave")
      //(arguments::help_module_option, po::value<std::string>(),
      //   "produce a help for a given module")
      (arguments::version_option,"print version std::string")
      (arguments::username_option, po::value<std::string>(),
          "username to use")
            (arguments::files_options_path,po::value<std::vector<std::string>>(),
          "input patn")
      (arguments::files_option_name,po::value<std::vector<std::string>>(), 
          "input file")
      ("output,o", po::value<std::string>(), 
          "output path");
      //  Start Config
      //  red 
      red.add_options()
        (arguments::Interface, "List all interface to user");
        

      //  Info 
      info.add_options()
        (arguments::About,po::value<std::string>(),
         "Show informations about tool/framework");
      //  =============
      //  Servers
      //  =============
      server.add_options()
        (arguments::Request, po::value<string>(), "....")
        (arguments::WepStatus, po::value<string>(), "Estatus Code ")
        (arguments::port_option, po::value<int>(),
         "Specified port")
        (arguments::host_options, po::value<int>(),
         "Specified host")
        (arguments::server_php,
            "Create PHP server");
      // --------------------
      //    CTF  
      //---------------------
       ctf.add_options()
         (arguments::ctf_red_tram,po::value<std::string>(),
            "Red team create directories");
       ctf.add_options()
         (arguments::ctf_mkt,po::value<std::string>(),"Create working directories ");
      //  -----------------------
      //  Start automatitation
      //  ----------------------
       automatitation.add_options()
         (arguments::files_update_file,
            "Update matching files here and there");
  }

  arguments parse(int argc, const char *argv[]) {
    po::variables_map variables;
    // -1   todo lo que sobra jj
    po::positional_options_description positionalOptions;
    positionalOptions
        .add(arguments::files_option_name, -1);
  
  
    po::options_description All;
     All.add(desc)
        .add(red)
        .add(server)
        .add(ctf)
        .add(info)
        .add(automatitation);
 

    po::store(po::command_line_parser(argc, argv)
                  .options(All)
                  .positional(positionalOptions)
                  .run(),
              variables);

    po::notify(variables);
   
    if (variables.count("help")) {
      std::cout << All << std::endl;
    }

    return arguments(variables);
  }
};  // end command_line_argument_parser
// clang-format on 



