CREATE TABLE Estudiantes( 
id_estudiante SERIAL PRIMARY KEY, 
Nombre VARCHAR(100)NOT NULL, 
Apellido VARCHAR(100)NOT NULL, 
FechaNac DATE, 
Direccion VARCHAR(250), 
Ciudad VARCHAR(100), 
Email VARCHAR(250)UNIQUE 
); 
CREATE TABLE Departamentos( 
id_departamento SERIAL PRIMARY KEY, 
NombreDepartamento VARCHAR(100)NOT NULL, 
Edificio VARCHAR(50)NOT NULL 
); 
CREATE TABLE Aulas( 
id_aula SERIAL PRIMARY KEY, 
NombreAula VARCHAR(100)NOT NULL, 
Capacidad INT NOT NULL CHECK (Capacidad>0), 
Ubicacion VARCHAR(100) 
); 
CREATE TABLE Cursos( 
id_curso SERIAL PRIMARY KEY, 
NombreCurso VARCHAR(100)NOT NULL, 
Descripcion TEXT, 
Creditos INT NOT NULL CHECK(Creditos>0), 
Semestre INT NOT NULL CHECK(Semestre>0), 
id_departamento INT, 
FOREIGN KEY (id_departamento)REFERENCES Departamentos (id_departamento) 
); 
CREATE TABLE Horarios( 
id_horario SERIAL PRIMARY KEY, 
FechaInicio DATE, 
FechaFin DATE CHECK (FechaFin>=FechaInicio), 
HoraInicio TIME NOT NULL, 
HoraFin TIME NOT NULL CHECK (HoraFin>HoraInicio), 
id_curso INT, 
id_Aula INT, 
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso), 
FOREIGN KEY (id_aula)REFERENCES Aulas(id_aula) 
); 
CREATE TABLE Profesores( 
id_profesor SERIAL PRIMARY KEY, 
Nombre VARCHAR(50)NOT NULL, 
Apellido VARCHAR(100)NOT NULL, 
Titulo VARCHAR(100) NOT NULL, 
id_departamento INT, 
FOREIGN KEY (id_departamento)REFERENCES Departamentos(id_departamento) 
); 
CREATE TABLE Inscripciones( 
id_inscripcion SERIAL PRIMARY KEY, 
FechaInscripcion DATE NOT NULL, 
Calificacion DECIMAL(10,2), 
id_estudiante INT, 
id_curso INT,  
FOREIGN KEY (id_estudiante)REFERENCES Estudiantes(id_estudiante), 
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso) 
); 
CREATE TABLE Cursos_Profesores ( 
id_CursosProfesores SERIAL PRIMARY KEY, 
id_curso INT, 
id_profesor INT, 
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso), 
FOREIGN KEY (id_profesor)REFERENCES Profesores(id_profesor) 
); 
CREATE TABLE ProgramasEstudio( 
id_programa SERIAL PRIMARY KEY, 
NombrePrograma VARCHAR(100) NOT NULL, 
DescripcionPrograma VARCHAR(100)NOT NULL 
); 
CREATE TABLE Programa_Cursos( 
id_ProgramaCurso SERIAL PRIMARY KEY, 
id_programa INT, 
id_curso INT,  
FOREIGN KEY (id_programa)REFERENCES ProgramasEstudio(id_programa), 
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso) 
); 
CREATE TABLE Carreras ( 
id_carrera SERIAL PRIMARY KEY, 
NombreCarrera VARCHAR(100) NOT NULL, 
TituloOtorgado VARCHAR(100) NOT NULL 
); 
CREATE TABLE Campus ( 
id_campus SERIAL PRIMARY KEY, 
NombreCampus VARCHAR(255) NOT NULL, 
DireccionCampus VARCHAR(255) NOT NULL 
); 
CREATE TABLE Estudiantes_Carreras ( 
id_estudiantes_carreras SERIAL PRIMARY KEY, 
id_estudiante INT, 
id_carrera INT, 
FechaInscripcion DATE NOT NULL, 
FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante), 
FOREIGN KEY (id_carrera) REFERENCES Carreras(id_carrera) 
);

INSERT INTO Estudiantes (Nombre, Apellido, FechaNac, Direccion, Ciudad, Email) VALUES 
('Juan', 'Pérez', '2000-05-21', 'Calle Falsa 123', 'Ciudad X', 'juan.perez@example.com'), 
('María', 'González', '1999-04-17', 'Av. Real 456', 'Ciudad Y', 'maria.gonzalez@example.com'), 
('Luis', 'Martínez', '2001-10-24', 'Calle del Sol 789', 'Ciudad Z', 'luis.martinez@example.com'), 
('Fernanda', 'Hernández', '2002-03-15', 'Av. Central 321', 'fernanda.hernandez@example.com', 'Ciudad W'), 
('Ricardo', 'Gómez', '1998-12-27', 'Boulevard Norte 654', 'Ciudad V', 'ricardo.gomez@example.com'); 
INSERT INTO Departamentos (NombreDepartamento, Edificio) VALUES 
('Departamento de Ingeniería', 'Edificio Alfa'), 
('Departamento de Negocios', 'Edificio Beta'), 
('Departamento de Ciencias Sociales', 'Edificio Gamma'), 
('Departamento de Medicina', 'Edificio Delta'), 
('Departamento de Artes', 'Edificio Épsilon'); 
INSERT INTO Aulas (NombreAula, Capacidad, Ubicacion) VALUES 
('Aula Magna', 150, 'Edificio Central, Piso 1'), 
('Laboratorio de Física', 40, 'Edificio de Ciencias, Piso 2'), 
('Sala de Conferencias', 80, 'Edificio de Administración, Piso 3'), 
('Aula 305', 30, 'Edificio de Ingeniería, Piso 3'), 
('Laboratorio de Computación', 50, 'Edificio Tecnológico, Planta Baja'); 
INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, Semestre, id_departamento) VALUES 
('Programación Avanzada', 'Curso sobre estructuras de datos y algoritmos.', 4, 2, 1), 
('Gestión Empresarial', 'Curso sobre administración de empresas y finanzas.', 3, 1, 2), 
('Introducción al Derecho', 'Fundamentos básicos de derecho constitucional.', 4, 1, 3), 
('Psicología Social', 'Impacto de la sociedad en el comportamiento humano.', 3, 2, 4), 
('Diseño Arquitectónico', 'Principios fundamentales del diseño y construcción.', 5, 3, 5); 
INSERT INTO Horarios (FechaInicio, FechaFin, HoraInicio, HoraFin, id_curso, id_Aula) VALUES 
('2025-08-01', '2025-12-15', '08:00:00', '10:00:00', 1, 1), 
('2025-08-01', '2025-12-15', '14:00:00', '16:00:00', 2, 2), 
('2025-08-01', '2025-12-15', '10:00:00', '12:00:00', 3, 3), 
('2025-08-01', '2025-12-15', '16:00:00', '18:00:00', 4, 4), 
('2025-08-01', '2025-12-15', '18:00:00', '20:00:00', 5, 5); 
INSERT INTO Profesores (Nombre, Apellido, Titulo, id_departamento) VALUES 
('Carlos', 'López', 'Doctor en Ciencias', 1), 
('Ana', 'Martínez', 'Máster en Administración', 2), 
('Eduardo', 'Ruiz', 'Doctor en Filosofía', 3), 
('Patricia', 'Vargas', 'Máster en Psicología', 4), 
('Roberto', 'Fernández', 'Ingeniero Civil', 5); 
INSERT INTO Inscripciones (FechaInscripcion, Calificacion, id_estudiante, id_curso) VALUES 
('2025-08-05', 85.50, 1, 1), 
('2025-08-06', 92.00, 2, 2), 
('2025-08-07', 88.20, 3, 3), 
('2025-08-08', 91.75, 4, 4), 
('2025-08-09', 79.50, 5, 5); 
INSERT INTO Cursos_Profesores (id_curso, id_profesor) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5); 
INSERT INTO ProgramasEstudio (NombrePrograma, DescripcionPrograma) VALUES 
('Ingeniería en Sistemas', 'Programa orientado al desarrollo de software y tecnología.'), 
('Administración de Empresas', 'Programa enfocado en gestión organizacional y liderazgo.'), 
('Psicología', 'Programa sobre salud mental, comportamiento y terapia.'), 
('Derecho', 'Programa de formación en legislación y justicia.'), 
('Arquitectura', 'Programa dedicado al diseño y construcción de espacios funcionales.'); 
INSERT INTO Programa_Cursos (id_programa, id_curso) VALUES 
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5); 
INSERT INTO Carreras (NombreCarrera, TituloOtorgado) VALUES 
('Ingeniería en Sistemas', 'Licenciado en Ingeniería en Sistemas'), 
('Administración de Empresas', 'Licenciado en Administración'), 
('Psicología', 'Licenciado en Psicología'), 
('Derecho', 'Licenciado en Derecho'), 
('Contaduría Pública', 'Licenciado en Contaduría'); 
INSERT INTO Campus (NombreCampus, DireccionCampus) VALUES 
('Campus Central', 'Av. Principal 123'), 
('Campus Norte', 'Calle Secundaria 456'), 
('Campus Sur', 'Av. Independencia 789'), 
('Campus Este', 'Calle Libertad 321'), 
('Campus Oeste', 'Boulevard Reforma 654'); 
INSERT INTO Estudiantes_Carreras (id_estudiante, id_carrera, FechaInscripcion) VALUES 
(1, 1, '2025-08-01'), 
(2, 2, '2025-08-02'), 
(3, 3, '2025-08-03'), 
(4, 4, '2025-08-04'), 
(5, 5, '2025-08-05');

ALTER TABLE Estudiantes  
ADD COLUMN id_carrera INT, 
ADD CONSTRAINT FK_Estudiantes_Carreras FOREIGN KEY (id_carrera)  
REFERENCES Carreras(id_carrera); 

ALTER TABLE Cursos  
ADD COLUMN id_campus INT, 
ADD CONSTRAINT FK_Cursos_Campus FOREIGN KEY (id_campus)  
REFERENCES Campus(id_campus); 

ALTER TABLE Profesores  
ADD COLUMN Email VARCHAR(250) UNIQUE NOT NULL; 

ALTER TABLE Estudiantes  
DROP COLUMN Ciudad; 

ALTER TABLE Horarios DROP CONSTRAINT horarios_id_aula_fkey; 
DROP TABLE Aulas 

ALTER TABLE Horarios  
DROP COLUMN id_aula

 
SELECT Nombre, Apellido FROM Estudiantes; 
SELECT NombreCurso FROM Cursos  
WHERE Creditos=3; 
 
SELECT e.Nombre, e.Apellido,  c.NombreCurso  
FROM Inscripciones i 
INNER JOIN Estudiantes e ON e.id_estudiante= i.Id_estudiante 
INNER JOIN Cursos c ON c.id_curso=i.id_curso 

SELECT e.Nombre, e.Apellido, c.NombreCurso 
FROM Estudiantes e  
LEFT JOIN Inscripciones i ON e.id_estudiante= i.id_estudiante 
LEFT JOIN Cursos c ON c.id_curso=i.id_curso

SELECT e.Nombre, e.Apellido, c.NombreCurso 
FROM Estudiantes e  
RIGHT JOIN Inscripciones i ON e.id_estudiante= i.id_estudiante 
RIGHT JOIN Cursos c ON c.id_curso=i.id_curso

SELECT c.NombreCurso, COUNT(i.id_estudiante) AS Cantidad_Estudiantes 
FROM Inscripciones i  
INNER JOIN Cursos c ON i.id_curso=c.id_curso 
GROUP BY c.NombreCurso   
                    

SELECT e.Nombre, e.Apellido, e.FechaNac 
FROM Estudiantes e 
WHERE FechaNac BETWEEN '1995-01-01' AND '1998-12-31' 
SELECT NombreCurso FROM Cursos 
ORDER BY NombreCurso; 

WITH InscripcionesPorEstudiante AS ( 
SELECT id_estudiante, COUNT(*) AS total_inscripciones 
FROM Inscripciones 
GROUP BY id_estudiante 
) 
SELECT e.Nombre, e.Apellido, i.total_inscripciones 
FROM InscripcionesPorEstudiante i 
JOIN Estudiantes e ON i.id_estudiante = e.id_estudiante 
ORDER BY i.total_inscripciones DESC 
LIMIT 3; 

SELECT p.Nombre, p.Apellido, COUNT(cp.id_curso) AS cantidad_cursos 
FROM Profesores p 
JOIN Cursos_Profesores cp ON p.id_profesor = cp.id_profesor 
GROUP BY p.id_profesor, p.Nombre, p.Apellido 
HAVING COUNT(cp.id_curso) > 2; 

WITH CursoMasInscrito AS ( 
SELECT i.id_curso, COUNT(*) AS total_inscripciones 
FROM Inscripciones i 
GROUP BY i.id_curso 
) 
SELECT d.NombreDepartamento, c.NombreCurso 
FROM Departamentos d 
JOIN Cursos c ON d.id_departamento = c.id_departamento 
JOIN CursoMasInscrito ci ON c.id_curso = ci.id_curso 
WHERE ci.total_inscripciones = ( 
SELECT MAX(total_inscripciones) 
FROM CursoMasInscrito 
WHERE id_curso IN ( 
SELECT id_curso FROM Cursos WHERE id_departamento = d.id_departamento 
) 
);

SELECT p.Nombre, p.Apellido, COUNT(cp.id_curso) AS cantidad_cursos 
FROM Profesores p 
JOIN Cursos_Profesores cp ON p.id_profesor = cp.id_profesor 
GROUP BY p.id_profesor, p.Nombre, p.Apellido 
HAVING COUNT(cp.id_curso) > 2; 

WITH CursoMasInscrito AS ( 
SELECT i.id_curso, COUNT(*) AS total_inscripciones 
FROM Inscripciones i 
GROUP BY i.id_curso 
) 
SELECT d.NombreDepartamento, c.NombreCurso 
FROM Departamentos d 
JOIN Cursos c ON d.id_departamento = c.id_departamento 
JOIN CursoMasInscrito ci ON c.id_curso = ci.id_curso 
WHERE ci.total_inscripciones = ( 
SELECT MAX(total_inscripciones) 
FROM CursoMasInscrito 
WHERE id_curso IN ( 
SELECT id_curso FROM Cursos WHERE id_departamento = d.id_departamento 
) 
); 

SELECT p.Nombre, p.Apellido, COUNT(cp.id_curso) AS cantidad_cursos 
FROM Profesores p 
JOIN Cursos_Profesores cp ON p.id_profesor = cp.id_profesor 
GROUP BY p.id_profesor, p.Nombre, p.Apellido 
HAVING COUNT(cp.id_curso) > 2;














