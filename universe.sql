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
    name character varying(100) NOT NULL,
    age_in_thousands_of_years integer NOT NULL,
    size_in_millions numeric(5,1) NOT NULL,
    spiral boolean NOT NULL,
    active boolean
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
    name character varying(100) NOT NULL,
    moon_type character varying(50),
    diameter numeric NOT NULL,
    surface_material text,
    habitable boolean,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_type character varying(50),
    radius numeric NOT NULL,
    temperature integer NOT NULL,
    habitable boolean,
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions integer NOT NULL,
    habitable_zone boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric(5,1),
    habitable boolean NOT NULL,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 1.0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 11, 1.2, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 8, 0.4, true, false);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 10, 0.8, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9, 0.6, true, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 12, 0.7, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural satellite', 3474.8, 'Rocky', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural satellite', 22.2, 'Rocky', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural satellite', 12.4, 'Rocky', false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'Natural satellite', 1560.8, 'Ice', true, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Natural satellite', 5268.2, 'Ice and rock', false, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Natural satellite', 4820, 'Ice and rock', false, 3);
INSERT INTO public.moon VALUES (7, 'Titan', 'Natural satellite', 5150, 'Ice and rock', true, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Natural satellite', 504.2, 'Ice', true, 4);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Natural satellite', 198.2, 'Rocky', false, 5);
INSERT INTO public.moon VALUES (10, 'Triton', 'Natural satellite', 1353.4, 'Ice', false, 6);
INSERT INTO public.moon VALUES (11, 'Charon', 'Dwarf planet satellite', 606, 'Rocky', false, 10);
INSERT INTO public.moon VALUES (12, 'Luna', 'Natural satellite', 1737.5, 'Rocky', false, 1);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Natural satellite', 106.6, 'Rocky', false, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Natural satellite', 763.8, 'Ice', false, 5);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Natural satellite', 1436, 'Rocky and ice', false, 5);
INSERT INTO public.moon VALUES (16, 'Dione', 'Natural satellite', 561.4, 'Ice', false, 5);
INSERT INTO public.moon VALUES (17, 'Tethys', 'Natural satellite', 1062.4, 'Ice', false, 5);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Natural satellite', 360.4, 'Ice and rock', false, 5);
INSERT INTO public.moon VALUES (19, 'Ariel', 'Natural satellite', 578.9, 'Rocky and ice', false, 8);
INSERT INTO public.moon VALUES (20, 'Umbriel', 'Natural satellite', 584.7, 'Rocky and ice', false, 8);
INSERT INTO public.moon VALUES (21, 'Miranda', 'Natural satellite', 471.6, 'Rocky and ice', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371, 288, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389.5, 218, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 6051.8, 737, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas giant', 69911, 165, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas giant', 58232, 134, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice giant', 24622, 72, false, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Terrestrial', 2439.7, 452, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant', 25362, 58, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 1188.3, 44, false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Exoplanet', 17000, 43, true, 2);
INSERT INTO public.planet VALUES (11, 'HD 40307g', 'Exoplanet', 20000, 57, true, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Exoplanet', 13000, 50, true, 2);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 4500, true, 1);
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 6000, false, 3);
INSERT INTO public.solar_system VALUES (3, 'Kepler-186 System', 5500, true, 4);
INSERT INTO public.solar_system VALUES (4, 'TRAPPIST-1 System', 5000, true, 5);
INSERT INTO public.solar_system VALUES (5, 'HD 40307 System', 12000, false, 6);
INSERT INTO public.solar_system VALUES (6, 'Proxima Centauri System', 5000, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 4500.0, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 250.0, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Binary star system', 6000.0, false, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'A-type main-sequence', 455.0, false, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red supergiant', 8.5, false, 2);
INSERT INTO public.star VALUES (6, 'Antares', 'Red supergiant', 12.0, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

