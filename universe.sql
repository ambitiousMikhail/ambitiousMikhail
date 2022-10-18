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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    apparent_magnitud numeric,
    distance_from_earth text,
    constellation character varying(100)
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
-- Name: humanode; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.humanode (
    humanode_id integer NOT NULL,
    name character varying(255) NOT NULL,
    how_many_fingers integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.humanode OWNER TO freecodecamp;

--
-- Name: humanode_humanode_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.humanode_humanode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.humanode_humanode_id_seq OWNER TO freecodecamp;

--
-- Name: humanode_humanode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.humanode_humanode_id_seq OWNED BY public.humanode.humanode_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean,
    distance_from_planet integer,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    solar_radii numeric,
    age_in_millions_of_years numeric,
    notes text,
    galaxy_id integer NOT NULL
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
-- Name: humanode humanode_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humanode ALTER COLUMN humanode_id SET DEFAULT nextval('public.humanode_humanode_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, '0', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 0.9, '160 kly', 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 2.7, '200 kly', 'Tucana');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 3.4, '2.5 Mly', 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5.7, '2.9 Mly', 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, '13.7 Mly', 'Centaurus');


--
-- Data for Name: humanode; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.humanode VALUES (1, 'Human', 5, 1);
INSERT INTO public.humanode VALUES (2, 'Geptococ', 8, 4);
INSERT INTO public.humanode VALUES (3, 'Manybold', 16, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 9400, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 32900, 2);
INSERT INTO public.moon VALUES (4, 'Io', true, 346546, 3);
INSERT INTO public.moon VALUES (5, 'Europa', true, 88964, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 7995465, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 613453, 3);
INSERT INTO public.moon VALUES (8, 'Metis', false, 4561, 4);
INSERT INTO public.moon VALUES (9, 'Adrastea', true, 4464651, 5);
INSERT INTO public.moon VALUES (10, 'Theber', false, 4654654, 5);
INSERT INTO public.moon VALUES (11, 'Chaldene', true, 46654, 6);
INSERT INTO public.moon VALUES (12, 'S/2017 J2', false, 9664, 6);
INSERT INTO public.moon VALUES (13, 'Kale', false, 64660, 6);
INSERT INTO public.moon VALUES (14, 'Eirene', true, 4789, 5);
INSERT INTO public.moon VALUES (15, 'Carme', true, 4760, 8);
INSERT INTO public.moon VALUES (16, 'Megaclite', true, 888995465, 5);
INSERT INTO public.moon VALUES (17, 'Cyllene', false, 4453, 7);
INSERT INTO public.moon VALUES (18, 'Sinope', true, 4689465, 7);
INSERT INTO public.moon VALUES (19, 'Aoede', true, 12242, 7);
INSERT INTO public.moon VALUES (20, 'Kore', true, 78979, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Lolly Molly', 'Only sex', true, 4);
INSERT INTO public.planet VALUES (9, 'Bags', NULL, false, 6);
INSERT INTO public.planet VALUES (10, 'Green planet', 'Always is green', true, 6);
INSERT INTO public.planet VALUES (11, 'Sea planet', NULL, false, 3);
INSERT INTO public.planet VALUES (12, 'Andrew', NULL, false, 3);
INSERT INTO public.planet VALUES (7, 'Ford', 'Life for cars', false, 5);
INSERT INTO public.planet VALUES (1, 'Earth', 'We are live here', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'A red planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (4, 'NDF', 'A blue planet', true, 2);
INSERT INTO public.planet VALUES (5, 'Scorpion', 'Planet is duna', true, 4);
INSERT INTO public.planet VALUES (6, 'Reno', NULL, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.6, 'The lagest objest in thr Solar System.', 1);
INSERT INTO public.star VALUES (2, 'R71', 107, NULL, 'A blue supergiant and one of the brightest stars in thr LMC', 2);
INSERT INTO public.star VALUES (3, 'Nebula N81', 132, 5.6, 'N81 is the 81st nebula cataloged in a survey of the SMC carried out in the 1950s by astronomer Karl Henize.', 3);
INSERT INTO public.star VALUES (4, 'Sirius', 567, 68.5, 'A very ancient constellation.', 4);
INSERT INTO public.star VALUES (5, 'Canopus', 1664, 45.5, 'Carina is one part of the constellation formerly known as Argo Navis.', 2);
INSERT INTO public.star VALUES (6, 'Rigel', 46546, 548.6, 'Orion is one of the most ancient, and mostrecognized constellations in the night sky.', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: humanode_humanode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.humanode_humanode_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 48, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: humanode humanode_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humanode
    ADD CONSTRAINT humanode_name_key UNIQUE (name);


--
-- Name: humanode humanode_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humanode
    ADD CONSTRAINT humanode_pkey PRIMARY KEY (humanode_id);


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
-- Name: humanode humanode_planet_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humanode
    ADD CONSTRAINT humanode_planet_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

