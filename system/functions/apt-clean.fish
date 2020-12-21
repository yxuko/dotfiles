function apt-clean -d "clean install files and no longer used packages"
    sudo apt clean
    sudo apt autoclean
    sudo apt autoremove
end