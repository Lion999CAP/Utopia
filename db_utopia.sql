--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-02 01:35:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 215 (class 1259 OID 16502)
-- Name: tb_actividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_actividades (
    id_act integer NOT NULL,
    act_titulo text,
    act_fecha text,
    act_foto text
);


ALTER TABLE public.tb_actividades OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16501)
-- Name: tb_actividades_id_act_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_actividades_id_act_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_actividades_id_act_seq OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_actividades_id_act_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_actividades_id_act_seq OWNED BY public.tb_actividades.id_act;


--
-- TOC entry 220 (class 1259 OID 16583)
-- Name: tb_postulante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_postulante (
    ci_us text NOT NULL,
    aprobado boolean DEFAULT false NOT NULL,
    h_vida text
);


ALTER TABLE public.tb_postulante OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16511)
-- Name: tb_revista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_revista (
    n_revista integer NOT NULL,
    rev_introduccion text,
    rev_tematica text,
    rev_foto text
);


ALTER TABLE public.tb_revista OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16510)
-- Name: tb_revista_n_revista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_revista_n_revista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_revista_n_revista_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_revista_n_revista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_revista_n_revista_seq OWNED BY public.tb_revista.n_revista;


--
-- TOC entry 219 (class 1259 OID 16578)
-- Name: tb_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_rol (
    ci_us text NOT NULL,
    rol_us text,
    pagina_us text,
    descripcion text
);


ALTER TABLE public.tb_rol OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN tb_rol.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_rol.descripcion IS 'descripcon de las paginas';


--
-- TOC entry 218 (class 1259 OID 16570)
-- Name: tb_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario (
    ci_us text NOT NULL,
    nombre_us text,
    correo_us text,
    carrera_us text,
    celular_us text,
    fecha_us text,
    clave_us text DEFAULT 123456,
    foto_us text
);


ALTER TABLE public.tb_usuario OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE tb_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_usuario IS 'tabla de usuario de Utopía';


--
-- TOC entry 3190 (class 2604 OID 16505)
-- Name: tb_actividades id_act; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_actividades ALTER COLUMN id_act SET DEFAULT nextval('public.tb_actividades_id_act_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16514)
-- Name: tb_revista n_revista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_revista ALTER COLUMN n_revista SET DEFAULT nextval('public.tb_revista_n_revista_seq'::regclass);


--
-- TOC entry 3344 (class 0 OID 16502)
-- Dependencies: 215
-- Data for Name: tb_actividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_actividades VALUES (1, 'Cafe Utopía Mean Girls', '2023-05-15', 'cafeUtopiaMeanGirls.jpg');


--
-- TOC entry 3349 (class 0 OID 16583)
-- Dependencies: 220
-- Data for Name: tb_postulante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_postulante VALUES ('0123456789', true, 'Leandro Admin.pdf');
INSERT INTO public.tb_postulante VALUES ('0202391637', true, 'Leandro Magno Lara Santana.pdf');
INSERT INTO public.tb_postulante VALUES ('0892322435', true, 'Curriculum CV Juan Guteer.pdf');


--
-- TOC entry 3346 (class 0 OID 16511)
-- Dependencies: 217
-- Data for Name: tb_revista; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_revista VALUES (114, 'En esta mirada de Utopía al mundo de los deportes te invitamos a juntarnos ', 'Tendencias y estilos de vida', 'revista114.jpg');


--
-- TOC entry 3348 (class 0 OID 16578)
-- Dependencies: 219
-- Data for Name: tb_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_rol VALUES ('0123456789', 'Administrador', 'aceptarPostulaciones.jsp', 'Postulaciones');
INSERT INTO public.tb_rol VALUES ('0123456789', 'Administrador', 'integrantes.jsp', 'Integrantes');
INSERT INTO public.tb_rol VALUES ('0123456789', 'Administrador', 'administrarEventos.jsp', 'Gestionar eventos');
INSERT INTO public.tb_rol VALUES ('0202391637', 'Editor', 'integrantes.jsp', 'Integrantes');
INSERT INTO public.tb_rol VALUES ('0123456789', 'Administrador', 'administrarRevista.jsp', 'Gestión de la revista');
INSERT INTO public.tb_rol VALUES ('0892322435', 'Editor', 'integrantes.jsp', 'Integrantes');


--
-- TOC entry 3347 (class 0 OID 16570)
-- Dependencies: 218
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_usuario VALUES ('0202391637', 'Leandro Lara', 'llaras1@est.ups.edu.ec', 'ComputaciÃ³n', '0982345001', '2003-08-15', '123456', 'FOTOleandro.jpg');
INSERT INTO public.tb_usuario VALUES ('0123456789', 'Admin', 'admin@admin.com', 'ComputaciÃ³n', '0982345001', '2023-05-25', 'admin', 'uni.png');
INSERT INTO public.tb_usuario VALUES ('0892322435', 'Juan', 'juan@est.ups.edu.ec', 'ComunicaciÃ³n', '0987234323', '2002-06-13', '123456', 'fotoJuanGuteer.jpg');


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_actividades_id_act_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_actividades_id_act_seq', 1, false);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_revista_n_revista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_revista_n_revista_seq', 1, false);


--
-- TOC entry 3195 (class 2606 OID 16509)
-- Name: tb_actividades tb_actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_actividades
    ADD CONSTRAINT tb_actividades_pkey PRIMARY KEY (id_act);


--
-- TOC entry 3197 (class 2606 OID 16518)
-- Name: tb_revista tb_revista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_revista
    ADD CONSTRAINT tb_revista_pkey PRIMARY KEY (n_revista);


--
-- TOC entry 3199 (class 2606 OID 16577)
-- Name: tb_usuario tb_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (ci_us);


--
-- TOC entry 3200 (class 2606 OID 16589)
-- Name: tb_postulante tb_postulante_ci_us_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_postulante
    ADD CONSTRAINT tb_postulante_ci_us_fkey FOREIGN KEY (ci_us) REFERENCES public.tb_usuario(ci_us);


-- Completed on 2023-06-02 01:35:12

--
-- PostgreSQL database dump complete
--

