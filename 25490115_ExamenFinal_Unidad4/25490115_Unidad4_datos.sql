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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aulas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aulas (
    id_aula integer NOT NULL,
    nombreaula character varying(100) NOT NULL,
    capacidad integer NOT NULL,
    ubicacion character varying(100),
    CONSTRAINT aulas_capacidad_check CHECK ((capacidad > 0))
);


ALTER TABLE public.aulas OWNER TO postgres;

--
-- Name: aulas_id_aula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aulas_id_aula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aulas_id_aula_seq OWNER TO postgres;

--
-- Name: aulas_id_aula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aulas_id_aula_seq OWNED BY public.aulas.id_aula;


--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id_campus integer NOT NULL,
    nombrecampus character varying(255) NOT NULL,
    direccioncampus character varying(255) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_campus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_id_campus_seq OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_id_campus_seq OWNED BY public.campus.id_campus;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    id_carrera integer NOT NULL,
    nombrecarrera character varying(100) NOT NULL,
    titulootorgado character varying(100) NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_id_carrera_seq OWNER TO postgres;

--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_id_carrera_seq OWNED BY public.carreras.id_carrera;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    nombrecurso character varying(100) NOT NULL,
    descripcion text,
    creditos integer NOT NULL,
    semestre integer NOT NULL,
    id_departamento integer,
    id_campus integer,
    CONSTRAINT cursos_creditos_check CHECK ((creditos > 0)),
    CONSTRAINT cursos_semestre_check CHECK ((semestre > 0))
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_curso_seq OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;


--
-- Name: cursos_profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_profesores (
    id_cursosprofesores integer NOT NULL,
    id_curso integer,
    id_profesor integer
);


ALTER TABLE public.cursos_profesores OWNER TO postgres;

--
-- Name: cursos_profesores_id_cursosprofesores_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_profesores_id_cursosprofesores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_profesores_id_cursosprofesores_seq OWNER TO postgres;

--
-- Name: cursos_profesores_id_cursosprofesores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_profesores_id_cursosprofesores_seq OWNED BY public.cursos_profesores.id_cursosprofesores;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id_departamento integer NOT NULL,
    nombredepartamento character varying(100) NOT NULL,
    edificio character varying(50) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_departamento_seq OWNER TO postgres;

--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_departamento_seq OWNED BY public.departamentos.id_departamento;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    fechanac date,
    direccion character varying(250),
    email character varying(250),
    id_carrera integer
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes_carreras (
    id_estudiantes_carreras integer NOT NULL,
    id_estudiante integer,
    id_carrera integer,
    fechainscripcion date NOT NULL
);


ALTER TABLE public.estudiantes_carreras OWNER TO postgres;

--
-- Name: estudiantes_carreras_id_estudiantes_carreras_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_carreras_id_estudiantes_carreras_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_carreras_id_estudiantes_carreras_seq OWNER TO postgres;

--
-- Name: estudiantes_carreras_id_estudiantes_carreras_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_carreras_id_estudiantes_carreras_seq OWNED BY public.estudiantes_carreras.id_estudiantes_carreras;


--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNER TO postgres;

--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;


--
-- Name: horarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios (
    id_horario integer NOT NULL,
    fechainicio date,
    fechafin date,
    horainicio time without time zone NOT NULL,
    horafin time without time zone NOT NULL,
    id_curso integer,
    id_aula integer,
    CONSTRAINT horarios_check CHECK ((fechafin >= fechainicio)),
    CONSTRAINT horarios_check1 CHECK ((horafin > horainicio))
);


ALTER TABLE public.horarios OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_id_horario_seq OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_id_horario_seq OWNED BY public.horarios.id_horario;


--
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    fechainscripcion date NOT NULL,
    calificacion numeric(10,2),
    id_estudiante integer,
    id_curso integer
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(100) NOT NULL,
    titulo character varying(100) NOT NULL,
    id_departamento integer,
    email character varying(250)
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesores_id_profesor_seq OWNER TO postgres;

--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;


--
-- Name: programa_cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programa_cursos (
    id_programacurso integer NOT NULL,
    id_programa integer,
    id_curso integer
);


ALTER TABLE public.programa_cursos OWNER TO postgres;

--
-- Name: programa_cursos_id_programacurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programa_cursos_id_programacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programa_cursos_id_programacurso_seq OWNER TO postgres;

--
-- Name: programa_cursos_id_programacurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programa_cursos_id_programacurso_seq OWNED BY public.programa_cursos.id_programacurso;


--
-- Name: programasestudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programasestudio (
    id_programa integer NOT NULL,
    nombreprograma character varying(100) NOT NULL,
    descripcionprograma character varying(100) NOT NULL
);


ALTER TABLE public.programasestudio OWNER TO postgres;

--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programasestudio_id_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programasestudio_id_programa_seq OWNER TO postgres;

--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programasestudio_id_programa_seq OWNED BY public.programasestudio.id_programa;


--
-- Name: aulas id_aula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aulas ALTER COLUMN id_aula SET DEFAULT nextval('public.aulas_id_aula_seq'::regclass);


--
-- Name: campus id_campus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN id_campus SET DEFAULT nextval('public.campus_id_campus_seq'::regclass);


--
-- Name: carreras id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id_carrera SET DEFAULT nextval('public.carreras_id_carrera_seq'::regclass);


--
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- Name: cursos_profesores id_cursosprofesores; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores ALTER COLUMN id_cursosprofesores SET DEFAULT nextval('public.cursos_profesores_id_cursosprofesores_seq'::regclass);


--
-- Name: departamentos id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamentos_id_departamento_seq'::regclass);


--
-- Name: estudiantes id_estudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);


--
-- Name: estudiantes_carreras id_estudiantes_carreras; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras ALTER COLUMN id_estudiantes_carreras SET DEFAULT nextval('public.estudiantes_carreras_id_estudiantes_carreras_seq'::regclass);


--
-- Name: horarios id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios ALTER COLUMN id_horario SET DEFAULT nextval('public.horarios_id_horario_seq'::regclass);


--
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- Name: profesores id_profesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);


--
-- Name: programa_cursos id_programacurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_cursos ALTER COLUMN id_programacurso SET DEFAULT nextval('public.programa_cursos_id_programacurso_seq'::regclass);


--
-- Name: programasestudio id_programa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio ALTER COLUMN id_programa SET DEFAULT nextval('public.programasestudio_id_programa_seq'::regclass);


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
-- Name: aulas aulas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aulas
    ADD CONSTRAINT aulas_pkey PRIMARY KEY (id_aula);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id_campus);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id_carrera);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- Name: cursos_profesores cursos_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_pkey PRIMARY KEY (id_cursosprofesores);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- Name: estudiantes_carreras estudiantes_carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_pkey PRIMARY KEY (id_estudiantes_carreras);


--
-- Name: estudiantes estudiantes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_email_key UNIQUE (email);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


--
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- Name: profesores profesores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_email_key UNIQUE (email);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);


--
-- Name: programa_cursos programa_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_cursos
    ADD CONSTRAINT programa_cursos_pkey PRIMARY KEY (id_programacurso);


--
-- Name: programasestudio programasestudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio
    ADD CONSTRAINT programasestudio_pkey PRIMARY KEY (id_programa);


--
-- Name: cursos cursos_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- Name: cursos_profesores cursos_profesores_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: cursos_profesores cursos_profesores_id_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesores(id_profesor);


--
-- Name: estudiantes_carreras estudiantes_carreras_id_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_id_carrera_fkey FOREIGN KEY (id_carrera) REFERENCES public.carreras(id_carrera);


--
-- Name: estudiantes_carreras estudiantes_carreras_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- Name: cursos fk_cursos_campus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fk_cursos_campus FOREIGN KEY (id_campus) REFERENCES public.campus(id_campus);


--
-- Name: estudiantes fk_estudiantes_carreras; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_estudiantes_carreras FOREIGN KEY (id_carrera) REFERENCES public.carreras(id_carrera);


--
-- Name: horarios horarios_id_aula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_id_aula_fkey FOREIGN KEY (id_aula) REFERENCES public.aulas(id_aula);


--
-- Name: horarios horarios_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: inscripciones inscripciones_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: inscripciones inscripciones_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- Name: profesores profesores_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- Name: programa_cursos programa_cursos_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_cursos
    ADD CONSTRAINT programa_cursos_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: programa_cursos programa_cursos_id_programa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programa_cursos
    ADD CONSTRAINT programa_cursos_id_programa_fkey FOREIGN KEY (id_programa) REFERENCES public.programasestudio(id_programa);


--
-- PostgreSQL database dump complete
--

