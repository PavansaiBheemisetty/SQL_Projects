--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area integer,
    volume integer,
    age numeric(4,2),
    material text,
    has_life boolean,
    has_water boolean,
    star_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area integer,
    volume integer,
    age numeric(4,2),
    material text,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area integer,
    volume integer,
    age numeric(4,2),
    material text,
    has_life boolean,
    has_water boolean,
    moon_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_palnet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_palnet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_palnet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_palnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_palnet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area integer,
    volume integer,
    age numeric(4,2),
    material text,
    has_life boolean,
    has_water boolean,
    planet_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_palnet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MILKY WAY', 98765432, 12345678, 10.00, 'This is some text', true, true, 1);
INSERT INTO public.galaxy VALUES (2, 'ANDROMEDA', 987654321, 123456789, 99.50, 'This is some text', false, false, 2);
INSERT INTO public.galaxy VALUES (3, 'TRIANGULUM', 123456, 98765, 55.00, 'This is some text', false, false, 3);
INSERT INTO public.galaxy VALUES (4, 'SOMBRERO', 34567891, 987152, 87.00, 'This is some text', true, true, 4);
INSERT INTO public.galaxy VALUES (5, 'WHIRLPOOL', 63783456, 63549735, 69.00, 'This is some text', false, false, 5);
INSERT INTO public.galaxy VALUES (6, 'PINWHEEL', 1638462, 47826, 17.00, 'This is some text', true, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 6, 'moon 6', 56789, 9872, 87.00, 'This  is star table', true, false);
INSERT INTO public.moon VALUES (1, 1, 'moon 1', 6356, 1735, 69.00, 'This is a moon table', true, true);
INSERT INTO public.moon VALUES (2, 2, 'moon 2', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (3, 3, 'moon 3', 6722, 7423, 70.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (4, 4, 'moon 4', 5721, 7824, 14.00, 'This is a moon table', true, true);
INSERT INTO public.moon VALUES (5, 5, 'moon 5', 624, 726, 15.00, 'This is a moon table', true, true);
INSERT INTO public.moon VALUES (7, 7, 'moon 7', 6356, 1735, 69.00, 'This is a moon table', true, true);
INSERT INTO public.moon VALUES (8, 8, 'moon 8', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (9, 9, 'moon 9', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (10, 10, 'moon 10', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (11, 11, 'moon 11', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (12, 12, 'moon 12', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (13, 1, 'moon 13', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (14, 2, 'moon 14', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (15, 3, 'moon 15', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (16, 4, 'moon 16', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (17, 5, 'moon 17', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (18, 6, 'moon 18', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (19, 7, 'moon 19', 1462, 826, 17.00, 'This is a moon table', false, true);
INSERT INTO public.moon VALUES (20, 8, 'moon 20', 1462, 826, 17.00, 'This is a moon table', false, true);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem impsum');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'lorem impsum');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'lorem impsum');
INSERT INTO public.more_info VALUES (4, 4, 'info4', 'lorem impsum');
INSERT INTO public.more_info VALUES (5, 5, 'info5', 'lorem impsum');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (6, 6, 'planet 6', 7182, 6353, 17.00, 'This is a star table', true, false, 6);
INSERT INTO public.planet VALUES (12, 6, 'planet 6', 56789, 9872, 87.00, 'This  i
arstar table', true, false, 12);
INSERT INTO public.planet VALUES (1, 1, 'planet 1', 567891, 9872, 87.00, 'This is a planet table', true, false, 1);
INSERT INTO public.planet VALUES (2, 2, 'planet 2', 6356, 1735, 69.00, 'This is a planet table', true, true, 2);
INSERT INTO public.planet VALUES (3, 3, 'planet 3', 1462, 826, 17.00, 'This is a planet table', NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 4, 'planet 4', 6722, 7423, 70.00, 'This is a planet table', false, NULL, 4);
INSERT INTO public.planet VALUES (5, 5, 'planet 5', 5721, 7824, 14.00, 'This is a planet table', true, true, 5);
INSERT INTO public.planet VALUES (7, 1, 'planet 7', 6356, 1735, 69.00, 'This is a planet table', true, true, 7);
INSERT INTO public.planet VALUES (8, 2, 'planet 8', 1462, 826, 17.00, 'This is a planet table', false, true, 8);
INSERT INTO public.planet VALUES (9, 3, 'planet 9', 6722, 7423, 70.00, 'This is a planet table', false, true, 9);
INSERT INTO public.planet VALUES (10, 4, 'planet 10', 5721, 7824, 14.00, 'This is a planet table', true, true, 10);
INSERT INTO public.planet VALUES (11, 5, 'planet 11', 624, 726, 15.00, 'This is a planet table', true, true, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1233456, 654321, 78.00, 'This is star table', false, false, 1);
INSERT INTO public.star VALUES (2, 2, 'Alpheratz', 567891, 9872, 87.00, 'This is star table', NULL, false, 2);
INSERT INTO public.star VALUES (3, 3, 'Mothallah', 6356, 1735, 69.00, 'This is star table', false, false, 3);
INSERT INTO public.star VALUES (4, 4, 'M104', 1462, 826, 17.00, 'This is star table', NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 5, 'M51', 6722, 7423, 70.00, 'This is star table', false, NULL, 5);
INSERT INTO public.star VALUES (6, 6, 'M101', 5721, 7824, 14.00, 'This is star table', NULL, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_palnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_palnet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: more_info unique_name1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT unique_name1 UNIQUE (name);


--
-- Name: star unique_name12; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name12 UNIQUE (name);


--
-- Name: planet unique_name123; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name123 UNIQUE (planet_id);


--
-- Name: moon unique_name1243; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name1243 UNIQUE (name);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

