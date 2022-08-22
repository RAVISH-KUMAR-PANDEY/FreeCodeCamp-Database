--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: creature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creature (
    creature_id integer NOT NULL,
    name character varying(30) NOT NULL,
    obs_volume integer,
    obs_mass numeric,
    size integer,
    description text NOT NULL,
    in_milkyway boolean,
    on_earth boolean
);


ALTER TABLE public.creature OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creature_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creature_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creature_creature_id_seq OWNED BY public.creature.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    obs_volume integer,
    obs_mass numeric,
    light_year_away integer,
    description text NOT NULL,
    has_earth boolean,
    is_twin boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    obs_volume integer,
    obs_mass numeric,
    distance integer,
    description text NOT NULL,
    in_milkyway boolean,
    is_earth boolean,
    planet_id integer
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
-- Name: my_serial; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_serial
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_serial OWNER TO freecodecamp;

--
-- Name: my_serial; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_serial OWNED BY public.galaxy.galaxy_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    obs_volume integer,
    obs_mass numeric,
    distance integer,
    description text NOT NULL,
    in_milkyway boolean,
    is_earth boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    obs_volume integer,
    obs_mass numeric,
    light_year_away integer,
    description text NOT NULL,
    is_milkyway boolean,
    is_twin boolean,
    galaxy_id integer
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
-- Name: creature creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature ALTER COLUMN creature_id SET DEFAULT nextval('public.creature_creature_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.my_serial'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creature VALUES (1, 'HUMAN', 70, 7.56, 2, 'living being', true, true);
INSERT INTO public.creature VALUES (2, 'HUMAN', 70, 7.56, 2, 'living being', true, true);
INSERT INTO public.creature VALUES (3, 'HUMAN', 70, 7.56, 2, 'living being', true, true);
INSERT INTO public.creature VALUES (4, 'HUMAN', 70, 7.56, 2, 'living being', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 3456677, 5555555, 23457, 'It is our Galaxy.', true, false);
INSERT INTO public.galaxy VALUES (2, 'XYZ', 64748, 263847.56, 27464, 'jdhfhr', false, true);
INSERT INTO public.galaxy VALUES (3, 'XYZ', 64748, 263847.56, 27464, 'jdhfhr', false, true);
INSERT INTO public.galaxy VALUES (4, 'XYZ', 64748, 263847.56, 27464, 'jdhfhr', false, true);
INSERT INTO public.galaxy VALUES (5, 'XYZ', 64748, 263847.56, 27464, 'jdhfhr', false, true);
INSERT INTO public.galaxy VALUES (6, 'XYZ', 64748, 263847.56, 27464, 'jdhfhr', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (3, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (4, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (5, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (6, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (7, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (8, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (9, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (10, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (11, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (12, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (13, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (14, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (15, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (16, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (17, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (18, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (19, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (20, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (21, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (22, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (23, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (24, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (25, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (26, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.moon VALUES (27, 'Earth Moon', 70, 7.56, 2, 'We see it', true, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (6, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (7, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (11, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (12, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (13, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (14, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (15, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (16, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.planet VALUES (17, 'Earth', 70, 7.56, 2, 'We see it', true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.star VALUES (2, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.star VALUES (3, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.star VALUES (4, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.star VALUES (5, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);
INSERT INTO public.star VALUES (6, 'VISHWA', 70, 7.56, 2, 'We see it', true, true, 1);


--
-- Name: creature_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creature_creature_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: my_serial; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_serial', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (creature_id);


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
-- Name: creature u_cret; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT u_cret UNIQUE (creature_id);


--
-- Name: galaxy u_galax; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT u_galax UNIQUE (galaxy_id);


--
-- Name: moon u_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT u_moon UNIQUE (moon_id);


--
-- Name: planet u_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT u_planet UNIQUE (planet_id);


--
-- Name: star u_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT u_star UNIQUE (star_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

