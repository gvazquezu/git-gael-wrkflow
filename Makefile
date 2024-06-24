# Define variables
HUGO_VERSION = 0.80.0
SITE_DIR = tarea0_u2
THEME_NAME = ananke
DIST_DIR = ../u2_tarea0/dist

# Phony targets to ensure they are always executed
.PHONY: all setup theme post build clean

all: setup theme post build

setup:
	# Crear el directorio del sitio si no existe
	mkdir -p $(SITE_DIR)
	# Inicializar un nuevo sitio Hugo
	cd $(SITE_DIR) && hugo new site .

theme:
	# Descargar y descomprimir el tema ananke
	mkdir -p $(SITE_DIR)/themes
	cd $(SITE_DIR)/themes && wget https://github.com/theNewDynamic/gohugo-theme-ananke/archive/refs/heads/master.zip
	cd $(SITE_DIR)/themes && unzip master.zip && mv gohugo-theme-ananke-master $(THEME_NAME) && rm master.zip

post:
	# Crear la publicación de bienvenida
	cd $(SITE_DIR) && hugo new posts/welcome.md
	# Editar el archivo config.toml para configurar el sitio
	echo 'baseURL = "http://example.org/"\nlanguageCode = "en-us"\ntitle = "Tec-Net S.A."\ntheme = "$(THEME_NAME)"' > $(SITE_DIR)/config.toml
	# Añadir contenido a la publicación de bienvenida
	echo '---\ntitle: "Bienvenidos a Tec-Net S.A."\ndate: 2024-06-10T12:00:00+00:00\ndraft: false\n---\n\n¡Bienvenidos al nuevo sitio web de Tec-Net S.A.!' > $(SITE_DIR)/content/posts/welcome.md

build:
	# Construir el sitio web en el directorio especificado
	cd $(SITE_DIR) && hugo -d $(DIST_DIR)

clean:
	# Eliminar el directorio de salida
	rm -rf $(DIST_DIR)
