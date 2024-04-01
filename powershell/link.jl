link_target_path = "$(@__DIR__)/WindowsPowerShell"

if Sys.iswindows()
    config_path = joinpath(homedir(), "Documents", "WindowsPowerShell")
else
    println("OS not yet supported")
    exit()
end

if ispath(config_path)
    print("Config already exists, overwrite? [y/N]: ")
    answer = readline()
    if answer == "y" || answer == "Y"
        rm(config_path, recursive=true)
    else
        exit()
    end
end

symlink(link_target_path, config_path, dir_target=true)
println("Symlink created")
