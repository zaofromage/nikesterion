CREATE TABLE sport (id_Sport INTEGER primary key AUTOINCREMENT,
name TEXT NOT NULL,
image TEXT NOT NULL);

CREATE TABLE categorie (id_cate INTEGER primary key AUTOINCREMENT,
name TEXT NOT NULL)

DROP TABLE souscategorie

CREATE TABLE souscategorie (id_souscate INTEGER primary key AUTOINCREMENT,
name TEXT NOT NULL,
name_parent INTEGER,
foreign key(name_parent) references categorie(id_cate)
)

CREATE TABLE article (id_article INTEGER primary key AUTOINCREMENT,
name TEXT NOT NULL,
prix INTEGER NOT NULL,
image TEXT,
ref_sport INTEGER,
ref_categorie INTEGER,
foreign key(ref_sport) references sport(id_sport),
foreign key(ref_categorie) references souscategorie(id_souscate));

insert into sport(name, image) values
('running', 'images/sport/running.png'),
('football', 'images/sport/football.png'),
('basketball', 'images/sport/basketball.png'),
('training et fitness', 'images/sport/training.png'),
('tennis', 'images/sport/tennis.png'),
('yoga', 'images/sport/yoga.png'),
('skateboard', 'images/sport/skateboard.png'),
('danse', 'images/sport/danse.png');

select * from sport

insert into categorie(name) values
('chaussure'),
('vetement'),
('accesoire')

select * from categorie

insert into souscategorie(name, name_parent) values
('lifestyle', 1),
('jordan', 1),
('sweats', 2),
('survetements', 2),
('vestes', 2),
('pantalongs et leggings', 2),
('hauts et tshirts', 2),
('shorts', 2),
('maillots', 2),
('sacs', 3),
('chausettes', 3),
('accessoires et equipements', 3)

select * from souscategorie

insert into article(name, prix, image, ref_sport, ref_categorie) values 
('nike P-6000', 109, 'images/article/P-6000.png', null, 1),
('nike air force 1', 95, 'images/article/airforce1.png', null, 1),
('air jordan 1 mid', 140, 'images/article/jordan1.png', 3, null),
('nike dunk low retro', 120, 'images/article/dunk.png', 3, null)

select * from article

select categorie.name from souscategorie
JOIN categorie on souscategorie.name_parent = categorie.id_cate
where souscategorie.id_souscate = 1;

SELECT name FROM sport WHERE id_Sport = 1
