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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (319, 'a', 2, 3);
INSERT INTO public.users VALUES (336, 'user_1680489400323', 0, NULL);
INSERT INTO public.users VALUES (321, 'user_1680489093992', 2, 374);
INSERT INTO public.users VALUES (320, 'user_1680489093993', 5, 91);
INSERT INTO public.users VALUES (335, 'user_1680489400324', 5, 244);
INSERT INTO public.users VALUES (323, 'user_1680489114897', 2, 18);
INSERT INTO public.users VALUES (322, 'user_1680489114898', 5, 18);
INSERT INTO public.users VALUES (338, 'user_1680489410078', 2, 689);
INSERT INTO public.users VALUES (325, 'user_1680489121930', 2, 341);
INSERT INTO public.users VALUES (337, 'user_1680489410079', 5, 201);
INSERT INTO public.users VALUES (324, 'user_1680489121931', 5, 72);
INSERT INTO public.users VALUES (327, 'user_1680489126038', 2, 220);
INSERT INTO public.users VALUES (326, 'user_1680489126039', 5, 14);
INSERT INTO public.users VALUES (340, 'user_1680489421620', 2, 37);
INSERT INTO public.users VALUES (329, 'user_1680489135845', 2, 350);
INSERT INTO public.users VALUES (339, 'user_1680489421621', 5, 221);
INSERT INTO public.users VALUES (328, 'user_1680489135846', 5, 48);
INSERT INTO public.users VALUES (331, 'user_1680489271634', 2, 311);
INSERT INTO public.users VALUES (342, 'user_1680489711741', 2, 125);
INSERT INTO public.users VALUES (330, 'user_1680489271635', 5, 325);
INSERT INTO public.users VALUES (341, 'user_1680489711742', 5, 9);
INSERT INTO public.users VALUES (333, 'user_1680489279604', 2, 604);
INSERT INTO public.users VALUES (332, 'user_1680489279605', 5, 208);
INSERT INTO public.users VALUES (334, 'x', 0, NULL);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 342, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

