# Proyecto integrador n° 3 - UNTREF

## Introducción

Proyecto final Desarrollador Back End dictado por UNTREF. Consiste en la creación de un servidor back utilizando JavaScript, Node.js y Express.js para poder comunicarnos con una base de datos creada y diseñada en MySQL.

## Diagrama de entidad-relación
![imagen](/docs/diagrama-entidad-relacion.png "Logo de API")

## El proyecto utiliza entre otros módulos:

- [mysql2](https://www.npmjs.com/package/mysql2) para gertionar la base de datos MySQL.
- [eslint](https://eslint.org/) para analizar potenciales errores y darle un formato mas seguro al código.
- [rsdi](https://www.npmjs.com/package/rsdi) como inyector de dependencias, para implementar el principio de inversión de dependencias.

## Instrucciones de instalación

  #### Requerimientos
  - Node.js v18.18.0
  - MySQL Workbench 8.0.34
  - GIT v2.42.0
  - IDE - Visual Studio Code v1.82.2

#### Preparando el ambiente

- Descargar o clonar el repositorio en su equipo.
- Abrir MySQL y ejecutar el script `trailerflix` que se encuentra en la carpeta `docs` para crear las *tablas*, cargar *entidades* y crear la *view* que usaremos para las consultas.
- Correr `npm install` para instalar las dependencias requeridas.
- Crear un archivo `.env` en la raíz del proyecto usando como guia `.env.dist`.
- Usar el comando `npm start` para iniciar el servidor y usarlo.
- Usar `npm run dev` si se desea modificar el codigo del proyecto, el comando utiliza `Nodemon` para iniciar el servidor y poder ver los cambios en tiempo real.

## Módulo trailerflix, endpoints:

#### Métodos HTTP

| Tipo | URI                                                 | Descripción                                                     |
| ---- | --------------------------------------------------- | --------------------------------------------------------------- |
| GET  | http://127.0.0.1:8080/categorias                    | Obtiene las categorias registradas en la db y su respectivo id  |
| GET  | http://127.0.0.1:8080/catalogo                      | Obtiene todos los registros de series y peliculas de la database |
| GET  | http://127.0.0.1:8080/catalogo/:id                  | Devuelve un registro usando su id                               |
| GET  | http://127.0.0.1:8080/catalogo/nombre/:nombre       | Devuelve los registros por su nombre o parte de su nombre       |
| GET  | http://127.0.0.1:8080/catalogo/genero/:genero       | Filtra series y peliculas por un genero espeficico              |
| GET  | http://127.0.0.1:8080/catalogo/categoria/:categoria | Filtra los registros por categoria                              |

# Explicación y ejemplos de uso:

## Método GET - Categorias:
- Request:
  - URI:
    - http://127.0.0.1:8080/categorias

- Response: 
   - Código HTTP: **200** *Ok*
  ``` json
      [
        {
          "id": 1,
          "tipoCategoria": "serie"
        },
        {
          "id": 2,
          "tipoCategoria": "pelicula"
        },
        {
          "id": 3,
          "tipoCategoria": "documental"
        }
      ]
  ```
  - Código HTTP: **500** *{ msg: error.message }*

---

## Método GET - Catalogo:
- Request:
  - URI:
    - http://127.0.0.1:8080/catalogo

- Response: 
  - Código HTTP: **200** *Ok*
  ``` json
      [
          {
            "id": 1,
            "titulo": "The Mandalorian",
            "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
            "temporadas": 2,
            "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw",
            "poster": "https://www.trailerflix.net/update/posters/3.jpg",
            "categoria": "serie",
            "reparto": "Carl Weathers, Chris Bartlett, Giancarlo Esposito, Misty Rosas, Pedro Pascal, Rio Hackford",
            "genero": "Ciencia Ficción, Fantasía"
          },
          {
            "id": 2,
            "titulo": "The Umbrella Academy",
            "resumen": "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.",
            "temporadas": 1,
            "trailer": null,
            "poster": "https://www.trailerflix.net/update/posters/4.jpg",
            "categoria": "serie",
            "reparto": "Aidan Gallagher, David Castañeda, Elliot Page, Emmy Raver-Lampman, Robert Sheehan, Tom Hopper",
            "genero": "Ciencia Ficción, Fantasía"
          },
      ]
  ```
  - Código HTTP: **500** *{ msg: error.message }*

---

## Método GET - Por id:
- Request:
  - URI:
    - http://127.0.0.1:8080/catalogo/26
  - Parámetro obligatorio de tipo URL:
    - **26** *(tipo: integer. Indica el id del contenido multimedia que se requiere obtener)*

- Response: 
   - Código HTTP: **200** *Ok*
  ``` json
      {
        "id": 26,
        "titulo": "Centígrados",
        "resumen": "Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.",
        "temporadas": null,
        "trailer": null,
        "poster": "https://www.trailerflix.net/update/posters/26.jpg",
        "categoria": "pelicula",
        "reparto": "Benjamin Sokolow, Emily Bayiokos, Génesis Rodríguez, Vincent Piazza",
        "genero": "Aventura, Drama, Intriga"
      }
  ```
  - Código HTTP: **500** *{ msg: error.message }*
  - Código HTTP: **500** *El id debe ser un numero valido*
  - Código HTTP: **500** *No se encontraron registros con el id: ${id}*

---

## Método GET - Por nombre:
- Request:
  - URI:
    - http://127.0.0.1:8080/catalogo/nombre/guason
  - Parámetro obligatorio de tipo URL:
    - **guason** *(tipo: string. Indica el nombre o parte del nombre para buscar los registros coincidentes)*

- Response: 
   - Código HTTP: **200** *Ok*
  ``` json
      [      
          {
            "id": 7,
            "titulo": "Guasón",
            "resumen": "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",
            "temporadas": null,
            "trailer": "https://www.youtube.com/embed/zAGVQLHvwOY",
            "poster": "https://www.trailerflix.net/update/posters/7.jpg",
            "categoria": "pelicula",
            "reparto": "Brett Cullen, Frances Conroy, Joaquin Phoenix, Robert De Niro, Shea Whigham, Zazie Beetz",
            "genero": "Crimen, Drama, Suspenso"
          },
      ]
  ```
  - Código HTTP: **500** *{ msg: error.message }*
  - Código HTTP: **500** *El nombre no esta definido*
  - Código HTTP: **500** *No se encontraron series o peliculas con nombre: ${nombre}*

---

## Método GET - Por genero:
- Request:
  - URI:
    - http://127.0.0.1:8080/catalogo/genero/accion
  - Parámetro obligatorio de tipo URL:
    - **accion** *(tipo: string. Indica el genero de las peliculas y series que se desea filtrar)*

- Response: 
   - Código HTTP: **200** *Ok*
  ``` json
      [
          {
            "id": 8,
            "titulo": "Avengers: End Game",
            "resumen": "Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.",
            "temporadas": null,
            "trailer": null,
            "poster": "https://www.trailerflix.net/update/posters/8.jpg",
            "categoria": "pelicula",
            "reparto": "Chris Evans, Chris Hemsworth, Jeremy Renner, Mark Ruffalo, Robert Downey Jr., Scarlett Johansson",
            "genero": "Acción, Aventura, Sci-Fi"
          },
          {
            "id": 18,
            "titulo": "Ava",
            "resumen": "Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.",
            "temporadas": null,
            "trailer": null,
            "poster": "https://www.trailerflix.net/update/posters/18.jpg",
            "categoria": "pelicula",
            "reparto": "Colin Farrell, Geena Davis, Ioan Gruffudd, Jessica Chastain, John Malkovich",
            "genero": "Acción, Drama, Suspenso"
          },
      ]
  ```
  - Código HTTP: **500** *{ msg: error.message }*
  - Código HTTP: **500** *El genero no puede ser de tipo numero*
  - Código HTTP: **500** *No se encontraron series o peliculas de genero: ${genero}*

---

## Método GET - Por categoria:
- Request:
  - URI:
    - http://127.0.0.1:8080/catalogo/categoria/pelicula
  - Parámetro obligatorio de tipo URL:
    - **pelicula** *(tipo: string. Indica la categoria que se desea obtener: serie, pelicula o documental)*

- Response: 
   - Código HTTP: **200** *Ok*
  ``` json
      [
          {
            "id": 29,
            "titulo": "Viuda Negra",
            "resumen": "Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.",
            "temporadas": null,
            "trailer": "https://www.youtube.com/embed/BIn8iANwEog",
            "poster": "https://www.trailerflix.net/update/posters/29.jpg",
            "categoria": "pelicula",
            "reparto": "David Harbour, Florence Pugh, O.T. Fagbenle, Rachel Weisz, Ray Winstone, Scarlett Johansson, William Hurt",
            "genero": "Acción, Aventura, Drama"
          },
          {
            "id": 30,
            "titulo": "The Martian",
            "resumen": "Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.",
            "temporadas": null,
            "trailer": "https://www.youtube.com/embed/XvB58bCVfng",
            "poster": "https://www.trailerflix.net/update/posters/30.jpg",
            "categoria": "pelicula",
            "reparto": "Jeff Daniels, Jessica Chastain, Kate Mara, Kristen Wiig, Matt Damon, Michael Peña, Sean Bean",
            "genero": "Aventura, Drama, Sci-Fi"
          },
      ]
  ```
  - Código HTTP: **500** *{ msg: error.message }*
  - Código HTTP: **500** *La categoria no puede ser de tipo numero*
  - Código HTTP: **500** *No se encontraron registros con categoria: ${categoria}*