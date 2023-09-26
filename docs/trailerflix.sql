--
-- Crear dabase
--
DROP DATABASE IF EXISTS trailerflix;
CREATE DATABASE trailerflix;
USE trailerflix;



--
-- Crear tabla "categoria"
--
DROP TABLE IF EXISTS `trailerflix.categoria`;
CREATE TABLE `categoria` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`tipo_categoria` varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Crear tabla "genero"
--
DROP TABLE IF EXISTS `trailerflix.genero`;
CREATE TABLE `genero` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`tipo_genero` varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Crear tabla "actor"
--
DROP TABLE IF EXISTS `trailerflix.actor`;
CREATE TABLE `actor` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` varchar(150) NOT NULL,
	`apellido` varchar(150) NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Crear tabla "catalogo"
--
DROP TABLE IF EXISTS `trailerflix.catalogo`;
CREATE TABLE `catalogo` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`titulo` varchar(200) NOT NULL UNIQUE,
	`resumen` varchar(2000),
	`temporadas` INT,
	`trailer` varchar(150) UNIQUE,
	`poster` varchar(100) UNIQUE,
	`categoria_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `catalogo_fk0` FOREIGN KEY (`categoria_id`) REFERENCES `categoria`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Crear tabla de relacion entre las tablas "catalogo" y "actores"
--
DROP TABLE IF EXISTS `trailerflix.reparto`;
CREATE TABLE `reparto` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogo_id` INT NOT NULL,
	`actor_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `reparto_fk0` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo`(`id`),
    CONSTRAINT `reparto_fk1` FOREIGN KEY (`actor_id`) REFERENCES `actor`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Crear tabla de relacion entre las tablas "catalogo" y "generos"
--
DROP TABLE IF EXISTS `trailerflix.genero_multimedia`;
CREATE TABLE `genero_multimedia` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogo_id` INT NOT NULL,
	`genero_id` INT NOT NULL,
	PRIMARY KEY (`id`),
    CONSTRAINT `genero_multimedia_fk0` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo`(`id`),
    CONSTRAINT `genero_multimedia_fk1` FOREIGN KEY (`genero_id`) REFERENCES `genero`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Insertar datos en la tabla categoria
--
insert into trailerflix.categoria (tipo_categoria)
values
('serie'),
('pelicula'),
('documental');



--
-- Insertar datos en la tabla genero
--
insert into trailerflix.genero (tipo_genero)
values
('Ciencia Ficción'), ('Fantasía'), ('Drama'), ('Ficción'), ('Sucesos'),
('Misterio'), ('Hechos verídicos'), ('Crimen'), ('Suspenso'), ('Aventura'), ('Sci-Fi'), 
('Acción'), ('Comedia'), ('Familia'), ('Western'), ('Tecnología'), ('Terror'),
('Historia'), ('Intriga');



--
-- Insertar datos en la tabla actor
--
insert into trailerflix.actor (nombre, apellido)
values
('Pedro', 'Pascal'),('Carl', 'Weathers'),('Misty', 'Rosas'),('Chris', 'Bartlett'),('Rio', 'Hackford'),('Giancarlo', 'Esposito'),
('Tom', 'Hopper'),('David', 'Castañeda'),('Emmy', 'Raver-Lampman'),('Robert', 'Sheehan'),('Aidan', 'Gallagher'),('Elliot', 'Page'),
('Anya', 'Taylor-Joy'),('Thomas', 'Brodie-Sangster'),('Harry', 'Melling'),('Moses', 'Ingram'),('Chloe', 'Pirrie'),('Janina', 'Elkin'),
('Lili', 'Reinhart'),('Casey', 'Cott'),('Camila', 'Mendes'),('Marisol', 'Nichols'),('Madelaine', 'Petsch'),('Mädchen', 'Amick'),
("Claire", "Fox"), ("Olivia", "Colman"), ("Matt", "Smith"), ("Tobias", "Menzies"), ("Vanesa", "Kirby"), ("Helena", "Bonham Carter"),
("Millie", "Bobby Brown"), ("Henry", "Cavill"), ("Sam", "Claflin"), ("Louis", "Partridge"), ("Adeel", "Akhtar"),
("Joaquin", "Phoenix"), ("Robert", "De Niro"), ("Zazie", "Beetz"), ("Frances", "Conroy"), ("Brett", "Cullen"), ("Shea", "Whigham"),
("Robert", "Downey Jr."), ("Chris", "Evans"), ("Mark", "Ruffalo"), ("Chris", "Hemsworth"), ("Scarlett", "Johansson"), ("Jeremy", "Renner"),
("Emilia", "Clarke"), ("Lena", "Headey"), ("Sophie", "Turner"), ("Kit", "Harington"), ("Peter", "Dinklage"), ("Nikolaj", "Coster-Waldau"),
("Grant", "Gustin"), ("Carlos", "Valdes"), ("Danielle", "Panabaker"), ("Candice", "Patton"), ("Jesse", "L. Martin"), ("Tom", "Cavanagh"),
("Jim", "Parsons"), ("Johnny", "Galecki"), ("Kaley", "Cuoco"), ("Simon", "Helberg"), ("Kunal", "Nayyar"), ("Melissa", "Rauch"), ("Mayim", "Bialik"),
("Jennifer", "Aniston"), ("Courteney", "Cox"), ("Lisa", "Kudrow"), ("David", "Schwimmer"), ("Matthew", "Perry"), ("Matt", "LeBlanc"),
("Amybeth", "McNulty"), ("Geraldine", "James"), ("R. H.", "Thomson"), ("Corrine", "Koslo"), ("Dalila", "Bela"), ("Lucas", "Jade Zumann"),
("Gillian", "Anderson"), ("David", "Duchovny"), ("Mitch", "Pileggi"), ("Robert", "Patrick"), ("Tom", "Braidwood"), ("Bruce", "Harwood"),
("Jared", "Harris"), ("Stellan", "Skarsgård"), ("Emily", "Watson"), ("Paul", "Ritter"), ("Jessie", "Buckley"), ("Adam", "Nagaitis"),
("Evan Rachel", "Wood"), ("Thandie", "Newton"), ("Jeffrey", "Wright"), ("Tessa", "Thompson"), ("Ed", "Harris"), ("Luke", "Hemsworth"),
("Lee", "Pace"), ("Scoot", "McNairy"), ("Mackenzie", "Davis"), ("Kerry", "Bishé"), ("Toby", "Huss"), ("Alana", "Cavanaugh"),
("Jessica", "Chastain"), ("John", "Malkovich"), ("Colin", "Farrell"), ("Geena", "Davis"), ("Ioan", "Gruffudd"),
("Margot", "Robbie"), ("Ewan", "McGregor"), ("Mary Elizabeth", "Winstead"), ("Jurnee", "Smollett"), ("Rosie", "Perez"), ("Chris", "Messina"),
("Stacy", "Martin"), ("Rhona", "Mitra"), ("Theo", "James"), ("Peter", "Ferdinando"), ("Lia", "Williams"), ("Toby", "Jones"),
("Dwayne", "Johnson"), ("Kevin", "Hart"), ("Jack", "Black"), ("Karen", "Gillan"), ("Nick", "Jonas"),
("Miranda", "Cosgrove"), ("Kate", "Walsh"), ("Omar", "Epps"), ("Angus", "Macfadyen"), ("Jorja", "Fox"), ("Enver", "Gjokaj"),
("Bill", "Skarsgård"), ("Bill", "Hader"), ("James", "McAvoy"), ("Isaiah", "Mustafa"), ("Jay", "Ryan"),
("Chadwick", "Boseman"), ("Michael", "B. Jordan"), ("Lupita", "Nyong'o"), ("Danai", "Gurira"), ("Martin", "Freeman"), ("Daniel", "Kaluuya"),
("Christian", "Bale"), ("Matt", "Damon"), ("Caitriona", "Balfe"), ("Josh", "Lucas"), ("Noah", "Jupe"), ("Jon", "Bernthal"),
("Génesis", "Rodríguez"), ("Vincent", "Piazza"), ("Benjamin", "Sokolow"), ("Emily", "Bayiokos"),
("Amy", "Manson"), ("Luke", "Allen-Gale"), ("Nina", "Bergman"), ("Dominic", "Mafham"), ("James", "Weber Brown"), ("Lorina", "Kamburova"),
("Marion", "Cotillard"), ("Laurence", "Fishburne"), ("Jude", "Law"), ("Kate", "Winslet"), ("Jennifer", "Ehle"), ("Gwyneth", "Paltrow"),
("Scarlett", "Johansson"), ("Florence", "Pugh"), ("David", "Harbour"), ("O.T.", "Fagbenle"), ("Rachel", "Weisz"), ("William", "Hurt"), ("Ray", "Winstone"),
("Kristen", "Wiig"), ("Jeff", "Daniels"), ("Michael", "Peña"), ("Sean", "Bean"), ("Kate", "Mara"),
("Alicia", "Vikander"), ("Domhnall", "Gleeson"), ("Oscar", "Isaac"), ("Sonoya", "Mizuno"), ("Corey", "Johnson"), ("Claire", "Selby"), ("Gana", "Bayarsaikhan"),
("Bryce Dallas", "Howard"), ("Chris", "Pratt"), ("Irrfan", "Khan"), ("Vincent", "D'Onofrio"), ("Omar", "Sy"), ("Nick", "Robinson"), ("Judy", "Greer"),
("Will", "Smith"), ("Alice", "Braga"), ("Charlie", "Tahan"), ("Dash", "Mihok"), ("Salli", "Richardson-Whitfield"), ("Willow", "Smith"), ("Emma", "Thompson"),
("Ryan", "Gosling"), ("Claire", "Foy"), ("Jason", "Clarke"), ("Kyle", "Chandler"), ("Corey", "Stoll"), ("Patrick", "Fugit"),
("John", "Boyega"), ("Scott", "Eastwood"), ("Cailee", "Spaeny"), ("Jing", "Tian"), ("Rinko", "Kikuchi"), ("Burn", "Gorman");



--
-- Insertar datos en la tabla catalogo
--
insert into trailerflix.catalogo (titulo, resumen, temporadas, trailer, poster, categoria_id)
values
('The Mandalorian',
'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.',
2,
'https://www.youtube.com/embed/aOC8E8z_ifw',
'/posters/3.jpg',
1),
('The Umbrella Academy',
'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.',
1,
null,
'/posters/4.jpg',
1),
('Gambito de Dama',
'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.',
1,
null,
'/posters/5.jpg',
1),
('Riverdale',
'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.',
5,
null,
'/posters/2.jpg',
1),
('The Crown',
'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.',
4,
null,
'/posters/1.jpg',
1),
('Enola Holmes',
'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.',
null,
null,
'/posters/6.jpg',
2),
('Guasón',
'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.',
null,
'https://www.youtube.com/embed/zAGVQLHvwOY',
'/posters/7.jpg',
2),
('Avengers: End Game',
'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.',
null,
null,
'/posters/8.jpg',
2),
('Juego de tronos',
'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.',
8,
null,
'/posters/9.jpg',
1),
('The Flash',
'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.',
6,
null,
'/posters/10.jpg',
1),
('The Big Bang Theory',
'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.',
12,
'https://www.youtube.com/embed/WBb3fojgW0Q',
'/posters/11.jpg',
1),
('Friends',
'Friends narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.',
10,
null,
'/posters/12.jpg',
1),
('Anne with an E',
'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.',
2,
null,
'/posters/13.jpg',
1),
('Expedientes Secretos X',
'Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de siniestro',
11,
'https://www.youtube.com/embed/KKziOmsJxzE',
'/posters/14.jpg',
1),
('Chernobyl',
'Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.',
1,
'https://www.youtube.com/embed/s9APLXM9Ei8',
'/posters/15.jpg',
1),
('Westworld',
'Westworld es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.',
3,
'https://www.youtube.com/embed/qLFBcdd6Qw0',
'/posters/16.jpg',
1),
('Halt and Catch Fire',
'Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).',
4,
'https://www.youtube.com/embed/pWrioRji60A',
'/posters/17.jpg',
1),
('Ava',
'Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.',
null,
null,
'/posters/18.jpg',
2),
('Aves de presa y la fantabulosa emancipación de una Harley Quinn',
'Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.',
null,
null,
'/posters/19.jpg',
2),
('Archivo',
'2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.',
null,
'https://www.youtube.com/embed/VHSoCnDioAo',
'/posters/20.jpg',
2),
('Jumanji - The next level',
'Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?',
null,
'https://www.youtube.com/embed/rBxcF-r9Ibs',
'/posters/21.jpg',
2),
('3022',
'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.',
null,
'https://www.youtube.com/embed/AGQ7OkmIx4Q',
'/posters/22.jpg',
2),
('IT - Capítulo 2',
'En este segundo capitulo Han pasado 27 años desde que el Club de los Perdedores, formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.',
null,
'https://www.youtube.com/embed/hZeFeYSmBcg',
'/posters/23.jpg',
2),
('Pantera Negra',
'T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.',
null,
'https://www.youtube.com/embed/BE6inv8Xh4A',
'/posters/24.jpg',
2),
('Contra lo imposible (Ford versus Ferrari)',
'Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.',
null,
'https://www.youtube.com/embed/SOVb0-2g1Q0',
'/posters/25.jpg',
2),
('Centígrados',
'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.',
null,
null,
'/posters/26.jpg',
2),
('DOOM: Aniquilación',
'Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.',
null,
'https://www.youtube.com/embed/nat3u3gAVLE',
'/posters/27.jpg',
2),
('Contagio',
'De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.',
null,
'https://www.youtube.com/embed/4sYSyuuLk5g',
'/posters/28.jpg',
2),
('Viuda Negra',
'Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.',
null,
'https://www.youtube.com/embed/BIn8iANwEog',
'/posters/29.jpg',
2),
('The Martian',
'Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.',
null,
'https://www.youtube.com/embed/XvB58bCVfng',
'/posters/30.jpg',
2),
('Ex-Machina',
'Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.',
null,
'https://www.youtube.com/embed/XRYL5spvEcI',
'/posters/31.jpg',
2),
('Jurassic World',
'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.',
null,
null,
'/posters/32.jpg',
2),
('Soy leyenda',
'Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.',
null,
'https://www.youtube.com/embed/dtKMEAXyPkg',
'/posters/33.jpg',
2),
('El primer hombre en la luna',
'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.',
null,
null,
'/posters/34.jpg',
2),
('Titanes del pacífico - La insurrección',
'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.',
null,
null,
'/posters/35.jpg',
2);



--
-- Insertar datos en la tabla genero_multimedia
--
insert into trailerflix.genero_multimedia (catalogo_id, genero_id)
values
(1, 1),(1, 2),
(2, 1),(2, 2),
(3, 3),(3, 4),(3, 5),
(4, 3),(4, 5),(4, 4),
(5, 3),(5, 7),
(6, 4),(6, 3),(6, 6),
(7, 8),(7, 9),(7, 3),
(8, 10),(8, 11),(8, 12),
(9, 10),(9, 2),(9, 3),
(10, 2),(10, 1),
(11, 13),(11, 2),(11, 4),
(12, 13),(12, 14),(12, 3),
(13, 3),(13, 14),(13, 15),
(14, 3),(14, 1),
(15, 3),(15, 7),
(16, 15),(16, 1),
(17, 4),(17, 3),(17, 16),
(18, 12),(18, 3),(18, 9),
(19, 12),(19, 4),(19, 13),
(20, 12),(20, 11),(20, 9),
(21, 13),(21, 4),(21, 10),
(22, 1),(22, 9),
(23, 17),(23, 9),(23, 2),
(24, 12),(24, 10),(24, 2),
(25, 3),(25, 18),(25, 10),
(26, 3),(26, 10),(26, 19),
(27, 12),(27, 11),(27, 17),
(28, 3),(28, 9),(28, 4),
(29, 3),(29, 12),(29, 10),
(30, 3),(30, 11),(30, 10),
(31, 3),(31, 11),(31, 9),
(32, 9),(32, 10),(32, 4),
(33, 3),(33, 17),(33, 4),
(34, 3),(34, 7),
(35, 12),(35, 2),(35, 11);



--
-- Insertar datos en la tabla reparto
--
insert into trailerflix.reparto (catalogo_id, actor_id)
values
(1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),
(2, 7),(2, 8),(2, 9),(2, 10),(2, 11),(2, 12),
(3, 13),(3, 14),(3, 15),(3, 16),(3, 17),(3, 18),
(4, 19),(4, 20),(4, 21),(4, 22),(4, 23),(4, 24),
(5, 25),(5, 26),(5, 27),(5, 28),(5, 29),(5, 30),
(6, 31),(6, 32),(6, 33),(6, 30),(6, 34),(6, 35),
(7, 36),(7, 37),(7, 38),(7, 39),(7, 40),(7, 41),
(8, 42),(8, 43),(8, 44),(8, 45),(8, 46),(8, 47),
(9, 48),(9, 49),(9, 50),(9, 51),(9, 52),(9, 53),
(10, 54),(10, 55),(10, 56),(10, 57),(10, 58),(10, 59),
(11, 60),(11, 61),(11, 62),(11, 63),(11, 64),(11, 65),(11, 66),
(12, 67),(12, 68),(12, 69),(12, 70),(12, 71),(12, 72),
(13, 73),(13, 74),(13, 75),(13, 76),(13, 77),(13, 78),
(14, 79),(14, 80),(14, 81),(14, 82),(14, 83),(14, 84),
(15, 85),(15, 86),(15, 87),(15, 88),(15, 89),(15, 90),
(16, 91),(16, 92),(16, 93),(16, 94),(16, 95),(16, 96),
(17, 97),(17, 98),(17, 99),(17, 100),(17, 101),(17, 102),
(18, 103),(18, 104),(18, 105),(18, 106),(18, 107),
(19, 108),(19, 109),(19, 110),(19, 111),(19, 112),(19, 113),
(20, 114),(20, 115),(20, 116),(20, 117),(20, 118),(20, 119),
(21, 120),(21, 121),(21, 122),(21, 123),(21, 124),
(22, 125),(22, 126),(22, 127),(22, 128),(22, 129),(22, 130),
(23, 131),(23, 103),(23, 132),(23, 133),(23, 134),(23, 135),
(24, 136),(24, 137),(24, 138),(24, 139),(24, 140),(24, 141),
(25, 142),(25, 143),(25, 144),(25, 145),(25, 146),(25, 147),
(26, 148),(26, 149),(26, 150),(26, 151),
(27, 152),(27, 153),(27, 154),(27, 155),(28, 156),(27, 157),
(28, 158),(28, 143),(28, 159),(28, 160),(28, 161),(28, 162),(28, 163),
(29, 164),(29, 165),(29, 166),(29, 167),(29, 168),(29, 169),(29, 170),
(30, 143),(30, 103),(30, 171),(30, 172),(30, 173),(30, 174),(30, 175),
(31, 176),(31, 177),(31, 178),(31, 179),(31, 180),(31, 181),(31, 182),
(32, 183),(32, 184),(32, 185),(32, 186),(32, 187),(32, 188),(32, 189),
(33, 190),(33, 191),(33, 192),(33, 193),(33, 194),(33, 195),(33, 196),
(34, 197),(34, 198),(34, 199),(34, 200),(34, 201),(34, 202),
(35, 203),(35, 204),(35, 205),(35, 206),(35, 207),(35, 208);



--
-- Crear la view que usaremos para el proyecto
--
create view vistaCatalogo as
select
A.id,
A.titulo,
A.resumen,
A.temporadas,
A.trailer,
A.poster,
B.tipo_categoria as categoria,
(
	select
    group_concat(concat(nombre, ' ', apellido) separator ', ')
	from trailerflix.actor C
	inner join trailerflix.reparto D on D.actor_id = C.id
    where D.catalogo_id = A.id
) as reparto,
(
	select
    group_concat(tipo_genero separator ', ')
    from trailerflix.genero E
    inner join trailerflix.genero_multimedia F on F.genero_id = E.id
    where F.catalogo_id = A.id
) as genero
from trailerflix.catalogo A
inner join trailerflix.categoria B on B.id = A.categoria_id
group by A.id;

