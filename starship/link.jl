link_target_path = "$(@__DIR__)/starship.toml"

if Sys.islinux() || Sys.iswindows()
    config_path = "$(ENV["HOME"])/.config/starship.toml"
else
    println("OS not yet supported")
    exit()
end

if ispath(config_path)
    print("Config already exists, overwrite? [y/N]: ")
    answer = readline()
    if answer == "y" || answer == "Y"
        rm(config_path)
    else
        exit()
    end
end

symlink(link_target_path, config_path)
println("Symlink created")
