-- Instituto Superior de Formación Técnica Nro 38
-- Base de datos
-- Ejemplo: Figuras

create database figuras;

\connect figuras

-- El dominio de un componente de color (entero desde 0 a 255)
create domain color_component AS smallint
check(
    value > -1 AND
    value < 256
);

-- Una tabla para almacenar colores con su código html y los valores RGB
create table colores(
    color      text primary key,
    html        text,
    red         color_component,
    green       color_component,
    blue        color_component);

-- La tabla de las figuras de colores
create table figuras(
    figura      text primary key,
    vertices    int,
    color       text references colores);

-- Algunos valores para los colores
insert into colores(color, html, red, green, blue) values
    ('rojo', '#FF0000', 255, 0, 0),
    ('verde', '#00FF00', 0, 255, 0),
    ('azul', '#0000FF', 0, 0, 255),
    ('amarillo', '#FFFF00', 255, 255, 0);

-- Algunos valores para las figuras
insert into figuras(figura, vertices, color) values
    ('triangulo', 3, 'rojo'),
    ('cuadrado', 4, 'azul'),
    ('rectangulo', 4, 'verde'),
    ('pentagono', 5, null);