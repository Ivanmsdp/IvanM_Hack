function i-Haklab
	if test (ls /data/data/com.termux/files/home/.local/libexec/i-Haklab/$argv[1]) &>/dev/null
		bash /data/data/com.termux/files/home/.local/libexec/i-Haklab/$argv[1] $argv[2..-1]
	else
		echo -en "\e[31m(➤_)\e[0m missing argument, type i-Haklab help for helpper\n"
	end
end

