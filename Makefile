# automatizació de tareas

build: #generación del sitio web
	hugo -d u2_tarea0/dist/

clean:
	powershell -Command "Remove-Item -Recurse -Force u2_tarea0/dist"

post:
	hugo new posts/$(POST_NAME).md
	powershell -Command "(Get-Content 'content/posts/$(POST_NAME).md') -replace 'title:.*', 'title: /"$(POST_TITLE)/"' | Set-Content 'content'"

help:
	@echo "Targets disponibles:"
	@powershell -Command "Get-Content '$(MAKEFILE_LIST)' | Select-String -Pattern '^[a-zA-Z_-]+:.?##' | ForEach-Object{ /$$_.Line.Trim() }"

package:
	@echo "Packaging awesome-website..."
	zip -r awesome-website.zip awesome-api dist

