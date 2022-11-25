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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(255) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_gane_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_gane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_gane_id_seq OWNER TO freecodecamp;

--
-- Name: games_gane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_gane_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_gane_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (194, 2018, 'Final', 4, 2, 354, 355);
INSERT INTO public.games VALUES (195, 2018, 'Third Place', 2, 0, 356, 357);
INSERT INTO public.games VALUES (196, 2018, 'Semi-Final', 2, 1, 355, 357);
INSERT INTO public.games VALUES (197, 2018, 'Semi-Final', 1, 0, 354, 356);
INSERT INTO public.games VALUES (198, 2018, 'Quarter-Final', 3, 2, 355, 358);
INSERT INTO public.games VALUES (199, 2018, 'Quarter-Final', 2, 0, 357, 359);
INSERT INTO public.games VALUES (200, 2018, 'Quarter-Final', 2, 1, 356, 360);
INSERT INTO public.games VALUES (201, 2018, 'Quarter-Final', 2, 0, 354, 361);
INSERT INTO public.games VALUES (202, 2018, 'Eighth-Final', 2, 1, 357, 362);
INSERT INTO public.games VALUES (203, 2018, 'Eighth-Final', 1, 0, 359, 363);
INSERT INTO public.games VALUES (204, 2018, 'Eighth-Final', 3, 2, 356, 364);
INSERT INTO public.games VALUES (205, 2018, 'Eighth-Final', 2, 0, 360, 365);
INSERT INTO public.games VALUES (206, 2018, 'Eighth-Final', 2, 1, 355, 366);
INSERT INTO public.games VALUES (207, 2018, 'Eighth-Final', 2, 1, 358, 367);
INSERT INTO public.games VALUES (208, 2018, 'Eighth-Final', 2, 1, 361, 368);
INSERT INTO public.games VALUES (209, 2018, 'Eighth-Final', 4, 3, 354, 369);
INSERT INTO public.games VALUES (210, 2014, 'Final', 1, 0, 370, 369);
INSERT INTO public.games VALUES (211, 2014, 'Third Place', 3, 0, 371, 360);
INSERT INTO public.games VALUES (212, 2014, 'Semi-Final', 1, 0, 369, 371);
INSERT INTO public.games VALUES (213, 2014, 'Semi-Final', 7, 1, 370, 360);
INSERT INTO public.games VALUES (214, 2014, 'Quarter-Final', 1, 0, 371, 372);
INSERT INTO public.games VALUES (215, 2014, 'Quarter-Final', 1, 0, 369, 356);
INSERT INTO public.games VALUES (216, 2014, 'Quarter-Final', 2, 1, 360, 362);
INSERT INTO public.games VALUES (217, 2014, 'Quarter-Final', 1, 0, 370, 354);
INSERT INTO public.games VALUES (218, 2014, 'Eighth-Final', 2, 1, 360, 373);
INSERT INTO public.games VALUES (219, 2014, 'Eighth-Final', 2, 0, 362, 361);
INSERT INTO public.games VALUES (220, 2014, 'Eighth-Final', 2, 0, 354, 374);
INSERT INTO public.games VALUES (221, 2014, 'Eighth-Final', 2, 1, 370, 375);
INSERT INTO public.games VALUES (222, 2014, 'Eighth-Final', 2, 1, 371, 365);
INSERT INTO public.games VALUES (223, 2014, 'Eighth-Final', 2, 1, 372, 376);
INSERT INTO public.games VALUES (224, 2014, 'Eighth-Final', 1, 0, 369, 363);
INSERT INTO public.games VALUES (225, 2014, 'Eighth-Final', 2, 1, 356, 377);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (354, 'France');
INSERT INTO public.teams VALUES (355, 'Croatia');
INSERT INTO public.teams VALUES (356, 'Belgium');
INSERT INTO public.teams VALUES (357, 'England');
INSERT INTO public.teams VALUES (358, 'Russia');
INSERT INTO public.teams VALUES (359, 'Sweden');
INSERT INTO public.teams VALUES (360, 'Brazil');
INSERT INTO public.teams VALUES (361, 'Uruguay');
INSERT INTO public.teams VALUES (362, 'Colombia');
INSERT INTO public.teams VALUES (363, 'Switzerland');
INSERT INTO public.teams VALUES (364, 'Japan');
INSERT INTO public.teams VALUES (365, 'Mexico');
INSERT INTO public.teams VALUES (366, 'Denmark');
INSERT INTO public.teams VALUES (367, 'Spain');
INSERT INTO public.teams VALUES (368, 'Portugal');
INSERT INTO public.teams VALUES (369, 'Argentina');
INSERT INTO public.teams VALUES (370, 'Germany');
INSERT INTO public.teams VALUES (371, 'Netherlands');
INSERT INTO public.teams VALUES (372, 'Costa Rica');
INSERT INTO public.teams VALUES (373, 'Chile');
INSERT INTO public.teams VALUES (374, 'Nigeria');
INSERT INTO public.teams VALUES (375, 'Algeria');
INSERT INTO public.teams VALUES (376, 'Greece');
INSERT INTO public.teams VALUES (377, 'United States');


--
-- Name: games_gane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_gane_id_seq', 225, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 377, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

