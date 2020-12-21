function gi -d "curl gitignore file"
	cd (curl -s 'https://www.gitignore.io/api/$*')
end