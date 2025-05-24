--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aulas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aulas (id_aula, nombreaula, capacidad, ubicacion) FROM stdin;
1	Aula Magna	150	Edificio Central, Piso 1
2	Laboratorio de Física	40	Edificio de Ciencias, Piso 2
3	Sala de Conferencias	80	Edificio de Administración, Piso 3
4	Aula 305	30	Edificio de Ingeniería, Piso 3
5	Laboratorio de Computación	50	Edificio Tecnológico, Planta Baja
\.


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id_campus, nombrecampus, direccioncampus) FROM stdin;
1	Campus Central	Av. Principal 123
2	Campus Norte	Calle Secundaria 456
3	Campus Sur	Av. Independencia 789
4	Campus Este	Calle Libertad 321
5	Campus Oeste	Boulevard Reforma 654
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (id_carrera, nombrecarrera, titulootorgado) FROM stdin;
1	Ingeniería en Sistemas	Licenciado en Ingeniería en Sistemas
2	Administración de Empresas	Licenciado en Administración
3	Psicología	Licenciado en Psicología
4	Derecho	Licenciado en Derecho
5	Contaduría Pública	Licenciado en Contaduría
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id_departamento, nombredepartamento, edificio) FROM stdin;
1	Departamento de Ingeniería	Edificio Alfa
2	Departamento de Negocios	Edificio Beta
3	Departamento de Ciencias Sociales	Edificio Gamma
4	Departamento de Medicina	Edificio Delta
5	Departamento de Artes	Edificio Épsilon
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id_curso, nombrecurso, descripcion, creditos, semestre, id_departamento, id_campus) FROM stdin;
1	Programación Avanzada	Curso sobre estructuras de datos y algoritmos.	4	2	1	\N
2	Gestión Empresarial	Curso sobre administración de empresas y finanzas.	3	1	2	\N
3	Introducción al Derecho	Fundamentos básicos de derecho constitucional.	4	1	3	\N
4	Psicología Social	Impacto de la sociedad en el comportamiento humano.	3	2	4	\N
5	Diseño Arquitectónico	Principios fundamentales del diseño y construcción.	5	3	5	\N
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (id_profesor, nombre, apellido, titulo, id_departamento, email) FROM stdin;
1	Carlos	López	Doctor en Ciencias	1	\N
2	Ana	Martínez	Máster en Administración	2	\N
3	Eduardo	Ruiz	Doctor en Filosofía	3	\N
4	Patricia	Vargas	Máster en Psicología	4	\N
5	Roberto	Fernández	Ingeniero Civil	5	\N
\.


--
-- Data for Name: cursos_profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos_profesores (id_cursosprofesores, id_curso, id_profesor) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id_estudiante, nombre, apellido, fechanac, direccion, email, id_carrera) FROM stdin;
1	Juan	Pérez	2000-05-21	Calle Falsa 123	juan.perez@example.com	\N
2	María	González	1999-04-17	Av. Real 456	maria.gonzalez@example.com	\N
3	Luis	Martínez	2001-10-24	Calle del Sol 789	luis.martinez@example.com	\N
4	Fernanda	Hernández	2002-03-15	Av. Central 321	fernanda.hernandez@example.com	\N
5	Ricardo	Gómez	1998-12-27	Boulevard Norte 654	ricardo.gomez@example.com	\N
\.


--
-- Data for Name: estudiantes_carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes_carreras (id_estudiantes_carreras, id_estudiante, id_carrera, fechainscripcion) FROM stdin;
1	1	1	2025-08-01
2	2	2	2025-08-02
3	3	3	2025-08-03
4	4	4	2025-08-04
5	5	5	2025-08-05
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (id_horario, fechainicio, fechafin, horainicio, horafin, id_curso, id_aula) FROM stdin;
1	2025-08-01	2025-12-15	08:00:00	10:00:00	1	1
2	2025-08-01	2025-12-15	14:00:00	16:00:00	2	2
3	2025-08-01	2025-12-15	10:00:00	12:00:00	3	3
4	2025-08-01	2025-12-15	16:00:00	18:00:00	4	4
5	2025-08-01	2025-12-15	18:00:00	20:00:00	5	5
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, fechainscripcion, calificacion, id_estudiante, id_curso) FROM stdin;
1	2025-08-05	85.50	1	1
2	2025-08-06	92.00	2	2
3	2025-08-07	88.20	3	3
4	2025-08-08	91.75	4	4
5	2025-08-09	79.50	5	5
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (id_programa, nombreprograma, descripcionprograma) FROM stdin;
1	Ingeniería en Sistemas	Programa orientado al desarrollo de software y tecnología.
2	Administración de Empresas	Programa enfocado en gestión organizacional y liderazgo.
3	Psicología	Programa sobre salud mental, comportamiento y terapia.
4	Derecho	Programa de formación en legislación y justicia.
5	Arquitectura	Programa dedicado al diseño y construcción de espacios funcionales.
\.


--
-- Data for Name: programa_cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programa_cursos (id_programacurso, id_programa, id_curso) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	3	5
\.


--
-- Name: aulas_id_aula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aulas_id_aula_seq', 5, true);


--
-- Name: campus_id_campus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_campus_seq', 5, true);


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_carrera_seq', 5, true);


--
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 5, true);


--
-- Name: cursos_profesores_id_cursosprofesores_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_profesores_id_cursosprofesores_seq', 5, true);


--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_departamento_seq', 5, true);


--
-- Name: estudiantes_carreras_id_estudiantes_carreras_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_carreras_id_estudiantes_carreras_seq', 5, true);


--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 5, true);


--
-- Name: horarios_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_horario_seq', 5, true);


--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 5, true);


--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 5, true);


--
-- Name: programa_cursos_id_programacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programa_cursos_id_programacurso_seq', 5, true);


--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_id_programa_seq', 5, true);


--
-- PostgreSQL database dump complete
--

