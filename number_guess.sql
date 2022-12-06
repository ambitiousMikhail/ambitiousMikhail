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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    game_id integer NOT NULL,
    name character varying(25) NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_number_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_number_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_number_guess_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_number_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_number_guess_id_seq OWNED BY public.number_guess.game_id;


--
-- Name: number_guess game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN game_id SET DEFAULT nextval('public.number_guess_number_guess_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES (24, 'Mike', 7);
INSERT INTO public.number_guess VALUES (25, 'Mike', 10);
INSERT INTO public.number_guess VALUES (26, 'Mike', 9);
INSERT INTO public.number_guess VALUES (27, 'Alex', 5);
INSERT INTO public.number_guess VALUES (28, 'Alex', 12);
INSERT INTO public.number_guess VALUES (29, 'Mike', 12);
INSERT INTO public.number_guess VALUES (30, 'Mike', 10);
INSERT INTO public.number_guess VALUES (31, 'user_1670367202397', 536);
INSERT INTO public.number_guess VALUES (32, 'user_1670367202397', 852);
INSERT INTO public.number_guess VALUES (33, 'user_1670367202396', 578);
INSERT INTO public.number_guess VALUES (34, 'user_1670367202396', 302);
INSERT INTO public.number_guess VALUES (35, 'user_1670367202397', 506);
INSERT INTO public.number_guess VALUES (36, 'user_1670367202397', 970);
INSERT INTO public.number_guess VALUES (37, 'user_1670367202397', 738);
INSERT INTO public.number_guess VALUES (38, 'user_1670367260336', 334);
INSERT INTO public.number_guess VALUES (39, 'user_1670367260336', 897);
INSERT INTO public.number_guess VALUES (40, 'user_1670367260335', 701);
INSERT INTO public.number_guess VALUES (41, 'user_1670367260335', 302);
INSERT INTO public.number_guess VALUES (42, 'user_1670367260336', 868);
INSERT INTO public.number_guess VALUES (43, 'user_1670367260336', 991);
INSERT INTO public.number_guess VALUES (44, 'user_1670367260336', 978);


--
-- Name: number_guess_number_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_number_guess_id_seq', 44, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

