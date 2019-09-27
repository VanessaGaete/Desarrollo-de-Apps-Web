-- pedido
-- Insertar uno nuevo
INSERT INTO pedido (nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_solicitante, email_solicitante,celular_solicitante, comuna_solicitante) 
VALUES (?,?,?,?,?,?,?,?,?)

-- obtener los 5 primeros pedido
SELECT id, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_solicitante, email_solicitante,celular_solicitante, comuna_solicitante 
FROM pedido ORDER BY id DESC LIMIT 5
-- obtener los siguientes 5
SELECT id, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_solicitante, email_solicitante,celular_solicitante, comuna_solicitante 
FROM pedido ORDER BY id DESC LIMIT 5, 5
-- obtener información de 1 pedido por ID
SELECT id, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_solicitante, email_solicitante,celular_solicitante, comuna_solicitante 
FROM pedido WHERE id=?

-- disfraces
-- Insertar un disfraz 
INSERT INTO disfraz (comuna, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_contacto, email_contacto, celular_contacto) VALUES (?,?,?,?,?,?,?,?,?)
-- obtener información de las primeros 25 disfraces
SELECT id, comuna, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_contacto, email_contacto, celular_contacto FROM disfraz ORDER BY id LIMIT 25
-- informacion de 1 disfraz
SELECT id, comuna, nombre_disfraz, descripcion, categoria, talla, fecha_ingreso, nombre_contacto, email_contacto, celular_contacto FROM disfraz WHERE ID=?

