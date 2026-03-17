--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2026-03-17 21:01:28

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
-- TOC entry 247 (class 1259 OID 43573)
-- Name: comentariuforum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentariuforum (
    id_comentariu integer NOT NULL,
    id_utilizator integer,
    id_intrebare integer,
    continutcomentariu character varying(500),
    data_comentariu timestamp without time zone
);


ALTER TABLE public.comentariuforum OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 43572)
-- Name: comentariuforum_id_comentariu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentariuforum_id_comentariu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentariuforum_id_comentariu_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 246
-- Name: comentariuforum_id_comentariu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentariuforum_id_comentariu_seq OWNED BY public.comentariuforum.id_comentariu;


--
-- TOC entry 243 (class 1259 OID 43549)
-- Name: donatie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donatie (
    id_donatie integer NOT NULL,
    id_utilizator integer,
    email character varying(100) NOT NULL,
    nume character varying(100) NOT NULL,
    suma numeric(10,2) NOT NULL,
    data_donatie date NOT NULL
);


ALTER TABLE public.donatie OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 43548)
-- Name: donatie_id_donatie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donatie_id_donatie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.donatie_id_donatie_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 242
-- Name: donatie_id_donatie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donatie_id_donatie_seq OWNED BY public.donatie.id_donatie;


--
-- TOC entry 240 (class 1259 OID 43527)
-- Name: eveniment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eveniment (
    id_eveniment integer NOT NULL,
    nume character varying(30),
    perioada character varying(15),
    locatie character varying(20),
    descriere character varying(50),
    data_adaugare date
);


ALTER TABLE public.eveniment OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 43526)
-- Name: eveniment_id_eveniment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eveniment_id_eveniment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eveniment_id_eveniment_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 239
-- Name: eveniment_id_eveniment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eveniment_id_eveniment_seq OWNED BY public.eveniment.id_eveniment;


--
-- TOC entry 241 (class 1259 OID 43533)
-- Name: evenimenteutilizatori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evenimenteutilizatori (
    id_eveniment integer NOT NULL,
    id_utilizator integer NOT NULL
);


ALTER TABLE public.evenimenteutilizatori OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 43442)
-- Name: facultate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultate (
    id_facultate integer NOT NULL,
    id_universitate integer,
    numefacultate character varying(50) NOT NULL
);


ALTER TABLE public.facultate OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 43441)
-- Name: facultate_id_facultate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultate_id_facultate_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facultate_id_facultate_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: facultate_id_facultate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultate_id_facultate_seq OWNED BY public.facultate.id_facultate;


--
-- TOC entry 232 (class 1259 OID 43466)
-- Name: firma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firma (
    id_firma integer NOT NULL,
    denumire character varying(30) NOT NULL
);


ALTER TABLE public.firma OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 43465)
-- Name: firma_id_firma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firma_id_firma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.firma_id_firma_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 231
-- Name: firma_id_firma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firma_id_firma_seq OWNED BY public.firma.id_firma;


--
-- TOC entry 245 (class 1259 OID 43561)
-- Name: intrebareforum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intrebareforum (
    id_intrebare integer NOT NULL,
    id_utilizator integer,
    titlu character varying(100),
    continutintrebare character varying(500),
    data_intrebare date
);


ALTER TABLE public.intrebareforum OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 43560)
-- Name: intrebareforum_id_intrebare_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intrebareforum_id_intrebare_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intrebareforum_id_intrebare_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 244
-- Name: intrebareforum_id_intrebare_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intrebareforum_id_intrebare_seq OWNED BY public.intrebareforum.id_intrebare;


--
-- TOC entry 220 (class 1259 OID 43392)
-- Name: judet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judet (
    id_judet integer NOT NULL,
    id_tara integer,
    numejudet character varying(20) NOT NULL
);


ALTER TABLE public.judet OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 43391)
-- Name: judet_id_judet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.judet_id_judet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.judet_id_judet_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 219
-- Name: judet_id_judet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.judet_id_judet_seq OWNED BY public.judet.id_judet;


--
-- TOC entry 222 (class 1259 OID 43404)
-- Name: localitate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localitate (
    id_localitate integer NOT NULL,
    id_judet integer,
    numelocalitate character varying(30) NOT NULL
);


ALTER TABLE public.localitate OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 43403)
-- Name: localitate_id_localitate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localitate_id_localitate_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.localitate_id_localitate_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 221
-- Name: localitate_id_localitate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localitate_id_localitate_seq OWNED BY public.localitate.id_localitate;


--
-- TOC entry 234 (class 1259 OID 43473)
-- Name: locdemunca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locdemunca (
    id_locmunca integer NOT NULL,
    id_utilizator integer,
    id_firma integer,
    functie character varying(50)
);


ALTER TABLE public.locdemunca OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 43472)
-- Name: locdemunca_id_locmunca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locdemunca_id_locmunca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locdemunca_id_locmunca_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 233
-- Name: locdemunca_id_locmunca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locdemunca_id_locmunca_seq OWNED BY public.locdemunca.id_locmunca;


--
-- TOC entry 237 (class 1259 OID 43505)
-- Name: newsletter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsletter (
    id_abonare integer NOT NULL,
    email character varying(30) NOT NULL,
    data_abonare date
);


ALTER TABLE public.newsletter OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 43504)
-- Name: newsletter_id_abonare_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsletter_id_abonare_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletter_id_abonare_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 236
-- Name: newsletter_id_abonare_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsletter_id_abonare_seq OWNED BY public.newsletter.id_abonare;


--
-- TOC entry 238 (class 1259 OID 43511)
-- Name: newsletterutilizatori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsletterutilizatori (
    id_abonare integer NOT NULL,
    id_utilizator integer NOT NULL
);


ALTER TABLE public.newsletterutilizatori OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 43489)
-- Name: specializareutilizatori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializareutilizatori (
    id_utilizator integer NOT NULL,
    id_specializare integer NOT NULL,
    aninmatriculare integer,
    anfinalizare integer
);


ALTER TABLE public.specializareutilizatori OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 43454)
-- Name: specializari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializari (
    id_specializare integer NOT NULL,
    id_facultate integer,
    numespecializare character varying(25) NOT NULL
);


ALTER TABLE public.specializari OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 43453)
-- Name: specializari_id_specializare_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specializari_id_specializare_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specializari_id_specializare_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 229
-- Name: specializari_id_specializare_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specializari_id_specializare_seq OWNED BY public.specializari.id_specializare;


--
-- TOC entry 218 (class 1259 OID 43385)
-- Name: tara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tara (
    id_tara integer NOT NULL,
    numetara character varying(20) NOT NULL
);


ALTER TABLE public.tara OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 43384)
-- Name: tara_id_tara_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tara_id_tara_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tara_id_tara_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 217
-- Name: tara_id_tara_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tara_id_tara_seq OWNED BY public.tara.id_tara;


--
-- TOC entry 224 (class 1259 OID 43416)
-- Name: universitate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universitate (
    id_universitate integer NOT NULL,
    numeuniversitate character varying(50) NOT NULL
);


ALTER TABLE public.universitate OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 43415)
-- Name: universitate_id_universitate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universitate_id_universitate_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.universitate_id_universitate_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 223
-- Name: universitate_id_universitate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universitate_id_universitate_seq OWNED BY public.universitate.id_universitate;


--
-- TOC entry 226 (class 1259 OID 43423)
-- Name: utilizator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizator (
    id_utilizator integer NOT NULL,
    id_localitate integer,
    id_universitate integer,
    nume character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telefon character varying(10),
    adresa character varying(100),
    cod_postal character varying(20),
    stare_civila character varying(30),
    cariera character varying(100),
    parola character varying(100) NOT NULL,
    interese character varying(200),
    poza_profil character varying(100)
);


ALTER TABLE public.utilizator OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 43422)
-- Name: utilizator_id_utilizator_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilizator_id_utilizator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilizator_id_utilizator_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 225
-- Name: utilizator_id_utilizator_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilizator_id_utilizator_seq OWNED BY public.utilizator.id_utilizator;


--
-- TOC entry 4731 (class 2604 OID 43576)
-- Name: comentariuforum id_comentariu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentariuforum ALTER COLUMN id_comentariu SET DEFAULT nextval('public.comentariuforum_id_comentariu_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 43552)
-- Name: donatie id_donatie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donatie ALTER COLUMN id_donatie SET DEFAULT nextval('public.donatie_id_donatie_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 43530)
-- Name: eveniment id_eveniment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eveniment ALTER COLUMN id_eveniment SET DEFAULT nextval('public.eveniment_id_eveniment_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 43445)
-- Name: facultate id_facultate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultate ALTER COLUMN id_facultate SET DEFAULT nextval('public.facultate_id_facultate_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 43469)
-- Name: firma id_firma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma ALTER COLUMN id_firma SET DEFAULT nextval('public.firma_id_firma_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 43564)
-- Name: intrebareforum id_intrebare; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intrebareforum ALTER COLUMN id_intrebare SET DEFAULT nextval('public.intrebareforum_id_intrebare_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 43395)
-- Name: judet id_judet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judet ALTER COLUMN id_judet SET DEFAULT nextval('public.judet_id_judet_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 43407)
-- Name: localitate id_localitate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localitate ALTER COLUMN id_localitate SET DEFAULT nextval('public.localitate_id_localitate_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 43476)
-- Name: locdemunca id_locmunca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locdemunca ALTER COLUMN id_locmunca SET DEFAULT nextval('public.locdemunca_id_locmunca_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 43508)
-- Name: newsletter id_abonare; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletter ALTER COLUMN id_abonare SET DEFAULT nextval('public.newsletter_id_abonare_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 43457)
-- Name: specializari id_specializare; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializari ALTER COLUMN id_specializare SET DEFAULT nextval('public.specializari_id_specializare_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 43388)
-- Name: tara id_tara; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tara ALTER COLUMN id_tara SET DEFAULT nextval('public.tara_id_tara_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 43419)
-- Name: universitate id_universitate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universitate ALTER COLUMN id_universitate SET DEFAULT nextval('public.universitate_id_universitate_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 43426)
-- Name: utilizator id_utilizator; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator ALTER COLUMN id_utilizator SET DEFAULT nextval('public.utilizator_id_utilizator_seq'::regclass);


--
-- TOC entry 4961 (class 0 OID 43573)
-- Dependencies: 247
-- Data for Name: comentariuforum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentariuforum (id_comentariu, id_utilizator, id_intrebare, continutcomentariu, data_comentariu) FROM stdin;
7	21	2	Eu am reușit să mă angajez la aproximativ 2 luni după absolvire. Am început printr-un internship plătit în timpul verii, care s-a transformat ulterior în job full-time. Ce m-a ajutat cel mai mult a fost să aplic din timp, să am un CV bine structurat și să fiu activă pe LinkedIn. Recomand să participați la evenimente de carieră și să cereți feedback după interviuri  ajută enorm!	2025-05-01 12:34:00
8	22	2	În cazul meu, a durat cam 6 luni până să găsesc un job stabil în domeniul meu. Între timp, am făcut cursuri online și am participat la webinarii, ceea ce m-a ajutat să-mi îmbunătățesc portofoliul. Procesul a fost puțin descurajator la început, dar perseverența a făcut diferența. Nu renunțați dacă primiți refuzuri, fiecare interviu e o experiență valoroasă!	2025-05-01 14:12:00
9	24	3	Da, m-a ajutat foarte mult! M-a contactat direct un recrutor după ce am actualizat profilul și am adăugat câteva proiecte personale. Chiar și fără experiență profesională, faptul că am avut o descriere clară și recomandări de la profesori a făcut diferența. Recomand cu încredere să îl folosiți activ.	2025-05-11 16:22:00
\.


--
-- TOC entry 4957 (class 0 OID 43549)
-- Dependencies: 243
-- Data for Name: donatie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donatie (id_donatie, id_utilizator, email, nume, suma, data_donatie) FROM stdin;
1	8	andreeaalexandrabudui@gmail.com	Budui Andreea	1.00	2025-06-02
2	\N	andreea@gmail.com	Budui Andreea	100.00	2025-06-28
3	25	buduiandreea10@gmail.com	Budui Andreea	50.00	2025-06-28
4	\N	buduiandreea1@gmail.com	Budui Andreea	12.00	2025-06-28
5	\N	buduiandreea11@gmail.com	Budui Andreea	151.00	2025-06-28
6	\N	buduiandreea1012@gmail.com	Budui Andreea	100.00	2025-06-28
7	\N	buduiandreea5@gmail.com	Budui Andreea	100.00	2025-06-28
8	\N	andreeaalexandrabudui@gmail.com	Budui Andreea	100.00	2025-06-28
9	\N	andreeabudui1012@gmail.com	Budui Andreea	100.00	2025-06-28
10	\N	andreeabudui101@gmail.com	Budui Andreea	100.00	2025-06-28
11	\N	andreeabudui101@gmail.com	Budui Andreea	100.00	2025-06-28
12	\N	andreeabudui54@gmail.com	Budui Andreea	100.00	2025-06-28
13	\N	andreeabudui514@gmail.com	Budui Andreea	100.00	2025-06-28
14	\N	andreeabudui1013@gmail.com	Budui Andreea	100.00	2025-06-28
15	\N	andreeabudui1013@gmail.com	Budui Andreea	100.00	2025-06-28
16	\N	andreeabudui1013@gmail.com	Budui Andreea	100.00	2025-06-28
17	\N	andreeabudui1013@gmail.com	Budui Andreea	100.00	2025-06-28
18	\N	andreeabudui2003@gmail.com	Budui Andreea	100.00	2025-06-28
19	\N	andreeabudui03@gmail.com	Budui Andreea	100.00	2025-06-28
20	\N	andreeabudui03@gmail.com	Budui Andreea	100.00	2025-06-28
21	\N	andreeabudui003@gmail.com	Budui Andreea	100.00	2025-06-28
\.


--
-- TOC entry 4954 (class 0 OID 43527)
-- Dependencies: 240
-- Data for Name: eveniment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eveniment (id_eveniment, nume, perioada, locatie, descriere, data_adaugare) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 43533)
-- Dependencies: 241
-- Data for Name: evenimenteutilizatori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evenimenteutilizatori (id_eveniment, id_utilizator) FROM stdin;
\.


--
-- TOC entry 4942 (class 0 OID 43442)
-- Dependencies: 228
-- Data for Name: facultate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facultate (id_facultate, id_universitate, numefacultate) FROM stdin;
11	10	
15	10	istorie
16	12	mecanica
17	13	Istorie
20	10	Istorie
21	11	Istorie
22	13	FEAA
10	10	feaa
13	10	feaa
14	11	Feaa
12	11	Feaa
23	11	Feaa
24	11	Feaa
\.


--
-- TOC entry 4946 (class 0 OID 43466)
-- Dependencies: 232
-- Data for Name: firma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firma (id_firma, denumire) FROM stdin;
1	REDPOINT
2	Red Point Software Solutions
3	
4	OSF DIGITAL
5	Centric 
6	Codeless
7	RomSoft
\.


--
-- TOC entry 4959 (class 0 OID 43561)
-- Dependencies: 245
-- Data for Name: intrebareforum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intrebareforum (id_intrebare, id_utilizator, titlu, continutintrebare, data_intrebare) FROM stdin;
2	20	La cât timp după absolvire ați reușit să vă angajați?	Bună! Sunt curioasă cât timp v-a luat să vă găsiți un loc de muncă după terminarea facultății. Ați început imediat, ați făcut un stagiu sau ați avut o perioadă de căutare? M-ar ajuta să aflu cum a fost pentru voi, mai ales în domeniul IT sau marketing. Mulțumesc!	2025-05-01
3	23	Cât de util vi s-a părut LinkedIn în găsirea primului job?	Bună tuturor! Aș vrea să aflu dacă v-a ajutat cu adevărat profilul de LinkedIn în procesul de angajare. Ați fost contactați de recrutori sau ați aplicat voi direct? Ați recomanda să investim timp în profilul de LinkedIn sau e doar o formalitate?	2025-05-11
8	34	Voluntariat Iasi	Pareri ONG-uri unde as putea face voluntariat in calitate de absolvent?	2025-06-28
\.


--
-- TOC entry 4934 (class 0 OID 43392)
-- Dependencies: 220
-- Data for Name: judet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judet (id_judet, id_tara, numejudet) FROM stdin;
12	10	vaslui
10	10	Vaslui
11	10	Vaslui
15	10	Vaslui
\.


--
-- TOC entry 4936 (class 0 OID 43404)
-- Dependencies: 222
-- Data for Name: localitate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localitate (id_localitate, id_judet, numelocalitate) FROM stdin;
14	10	ivesti
10	10	Barlad
12	10	Barlad
13	10	Barlad
17	10	Barlad
18	10	Barlad
\.


--
-- TOC entry 4948 (class 0 OID 43473)
-- Dependencies: 234
-- Data for Name: locdemunca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locdemunca (id_locmunca, id_utilizator, id_firma, functie) FROM stdin;
1	1	1	Frontend Developer
2	1	1	Frontend Developer
3	1	1	Frontend Developer
4	1	1	Frontend Developer
5	2	2	Frontend Developer
6	2	2	Frontend Developer
7	3	3	Frontend Developer
8	3	2	Frontend Developer
9	3	4	Frontend Developer
10	3	5	Frontend Developer
11	3	2	Frontend Developer
12	3	5	Frontend Developer
13	3	6	Frontend Developer
14	3	6	Frontend Developer
15	3	4	Frontend Developer
16	3	6	Frontend Developer
17	3	5	Frontend Developer
18	3	4	Frontend Developer
19	3	7	Frontend Developer
20	3	7	Frontend Developer
21	3	7	Frontend Developer
22	3	7	Frontend Developer
23	3	7	Frontend Developer
24	3	7	Frontend Developer
25	3	5	Frontend Developer
26	3	5	Frontend Developer
27	3	5	Frontend Developer
28	3	5	Frontend Developer
29	3	5	Frontend Developer
30	3	4	Frontend Developer
31	3	6	Frontend Developer
32	3	6	Frontend Developer
33	4	5	Web Developer
34	5	6	Frontend Developer
35	5	6	Frontend Developer
36	5	6	Frontend Developer
37	6	3	Digital Marketing
38	7	3	Digital Marketing 
39	7	3	Digital Marketing 
40	7	3	Digital Marketing 
41	7	3	Digital Marketing 
42	7	3	Digital Marketing 
43	7	3	Digital Marketing 
44	8	3	Digital Marketing
45	8	3	Digital Marketing
46	15	3	student
47	15	3	student
48	15	3	student
49	16	2	student
50	16	2	student
51	26	3	
52	27	3	
53	31	3	
54	32	3	
55	33	3	
56	34	3	
\.


--
-- TOC entry 4951 (class 0 OID 43505)
-- Dependencies: 237
-- Data for Name: newsletter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsletter (id_abonare, email, data_abonare) FROM stdin;
1	andreea@gmail.com	\N
2	andreea1@gmail.com	\N
3	1@gmail.com	\N
4	andrei@gmail.com	\N
5	111@gmail.com	\N
6	2@gmail.cpm	\N
7	3@gmail.com	\N
8	mariaion@gmail.com	\N
9	andreeabudui@gmail.com	\N
10	andreea10@gmail.com	\N
11	buduiandreea@gmail.com	\N
12	buduiandreea10@gmail.com	\N
13	buduiandreea1@gmail.com	\N
14	buduiandreea11@gmail.com	\N
15	buduiandreea1012@gmail.com	\N
16	buduiandreea5@gmail.com	\N
17	andreeabudui1012@gmail.com	\N
18	andreeabudui101@gmail.com	\N
19	andreeabudui54@gmail.com	\N
20	andreeabudui514@gmail.com	\N
21	andreeabudui5124@gmail.com	\N
22	andreeabudui03@gmail.com	\N
23	andreeabudui003@gmail.com	\N
\.


--
-- TOC entry 4952 (class 0 OID 43511)
-- Dependencies: 238
-- Data for Name: newsletterutilizatori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsletterutilizatori (id_abonare, id_utilizator) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 43489)
-- Dependencies: 235
-- Data for Name: specializareutilizatori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specializareutilizatori (id_utilizator, id_specializare, aninmatriculare, anfinalizare) FROM stdin;
1	5	2022	2025
2	5	2022	2025
3	6	0	0
4	6	0	0
5	6	0	0
6	6	0	0
7	10	0	0
8	5	2022	2022
9	11	2022	2022
12	5	2022	2025
13	11	2022	2025
14	12	2021	2025
16	14	2027	2027
17	15	2018	2022
20	9	1	1
21	18	2023	2027
22	19	2027	2027
23	9	2021	2027
24	20	2022	2025
25	21	2022	2025
26	22	2022	2025
27	22	2022	2025
28	23	2022	2025
29	5	2022	2025
30	23	2022	2025
31	18	2022	2025
32	18	2022	2025
33	18	2022	2025
34	18	2022	2025
\.


--
-- TOC entry 4944 (class 0 OID 43454)
-- Dependencies: 230
-- Data for Name: specializari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specializari (id_specializare, id_facultate, numespecializare) FROM stdin;
12	14	eai
13	12	eai
10	14	marketing
6	10	
14	16	inginerie metalelor
15	17	istoria medievala
19	15	inginerie metalelor
20	21	finante banci
21	22	INFORMATICA ECONOMICA
22	10	informatica economica
18	14	Informatica Economica
23	14	Informatica Economica
24	14	Informatica Economica
5	14	Informatica Economica
9	10	management
7	14	Informatica Economica
8	14	Informatica Economica
11	10	finante banci
\.


--
-- TOC entry 4932 (class 0 OID 43385)
-- Dependencies: 218
-- Data for Name: tara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tara (id_tara, numetara) FROM stdin;
10	Romania
11	romania
\.


--
-- TOC entry 4938 (class 0 OID 43416)
-- Dependencies: 224
-- Data for Name: universitate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universitate (id_universitate, numeuniversitate) FROM stdin;
10	uaic
11	Uaic
12	asachi
13	UAIC
\.


--
-- TOC entry 4940 (class 0 OID 43423)
-- Dependencies: 226
-- Data for Name: utilizator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilizator (id_utilizator, id_localitate, id_universitate, nume, email, telefon, adresa, cod_postal, stare_civila, cariera, parola, interese, poza_profil) FROM stdin;
25	10	13	Budui Andreea	buduiandreea10@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$0rcEIe5p4WDlotJtQRQ2Hu6seKnlTIhD81cyNzDdycGKcCa24UcIy		uploads/profil_68600a46d084c9.15973827.jpg
26	10	10	Budui Andreea	buduiandreea1012@gmail.com	0765768844	strada dn11	737320	necăsătorit		$2y$10$Kyf/fwXdFBBqgDQCp5naveXIg5o4ysnOGvFmMBy9w4/NesiyxTYdq	participare la evenimente	uploads/profil_68601d6c08aa91.57301376.jpg
4	10	11	laura	laura@gmail.com	12333	adresa	121121	necăsătorit	Web Developer	$2y$10$Iq95Z3Qv6.2acvEgNP9YyuWmZwEIAfmZtFlJBzDoBQ1BjjWWezka.	w	uploads/profil_683da213d5c684.48944955.jpg
27	10	10	Budui Andreea	buduiandreea5@gmail.com	076587643	strada dn11	737320	necăsătorit		$2y$10$F/9JUrXBZsHe8MOvFwonl.lPyHFi9vmZPrWexsg/sk/1V0WRZQ0A.	participare la evenimente	uploads/profil_6860207be729f5.11220680.jpg
28	10	13	Budui Andreea	andreeabudui1012@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$6IygHrztpAhxFgL0/o30GuH6r//9yC3bOo5BGeAokwyzFQ.93gdYK		uploads/profil_686023278309c2.12053108.jpg
29	10	10	Budui Andreea	andreeabudui101@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$T3SXhXWd6iMGBOb7aXVHkudALiHLesnlCZJA6R4oj8w6knH0UEgPC		uploads/profil_68602521527977.32311241.jpg
6	10	10	marilu	marilu@gmail.com	0747865577	adresa	121121	necăsătorit	Digital Marketing	$2y$10$jH1h.Mq01GU2u55QQbySJO0ehkrerJnyqVtwfLviYmSfWaOWav.mG		uploads/profil_683da58f93b122.11224799.jpg
17	10	13	maria	mariaion@gmail.com	0747865577	adresa	121121	necăsătorit	Tester Software	$2y$10$ynHn6nak8m3AkBmR1nHZMurAGMDpBOIwPK3IoSGHBwgb9WTMFpnfa	sa vb cu oameni noi	uploads/profil_6847d8e9f2a281.23205806.jpg
20	10	10	Budui Andreea	12@gmail.com	07356483	adresa	121121	necăsătorit	Tester Software	$2y$10$KRniI0wVMSk.8Gvp8qREeuBYM.TvVLgPbRcgGEuMRAvRSTmbQpZxW	s	uploads/profil_685fd4e34c95e0.21878363.jpg
21	10	10	Dragomir Alina	dragomiralina@gmail.com	0747865577	adresa	121121	căsătorit	Tester Software	$2y$10$GhaLtPdu0a1pw3CFRDMJNOcF7KTQK.Xj52/3X5t5F0eGZ/MwzB93S	1	uploads/profil_685fd5a8be4099.71014146.jpg
7	10	10	madona	madona@gmail.com	07356483	adresa	121121	necăsătorit	Digital Marketing 	$2y$10$upu7rL5TTqwWPloF/VUuWO6Y9BHSPeffQExBdfIyVX9f25ZZsNwdm		uploads/profil_683da8b62d3846.78370645.jpg
22	17	10	Ivan Matei	ivanmatei@gmail.com	07356483	adresa	121121	necăsătorit	Web Developer	$2y$10$hvf/b50hbUfweQfurpJojO4U/OzdTcKzRIvuQ4W0pvAcUcRgdEhH2	1	uploads/profil_685fd8e6634ab1.19410433.jpg
8	10	10	tina	tina@gmail.com	07356483	adresa	121121	necăsătorit	Digital Marketing	$2y$10$nGSBcGaA8cZUeTUEbmyKyuKPjuYWTchOLLiP5hnpB/B4MrMEhB9FS		uploads/profil_683dac7d8bb852.23399509.jpg
9	12	10	gigel	gigel@gmail.com	0747865577	adresa	121121	necăsătorit	Frontend Developer	$2y$10$lRBtEO1BOGd5l0GLfJStlOXJjQAXTcwJpRFjXvbp2fq7M2W7ZWVpG		uploads/profil_683dbb38161f10.86199037.jpg
23	18	10	Maria Ionescu	mariaionescu@gmail.com	1	adresa	121121	necăsătorit	Web Developer	$2y$10$v.o4HjDBSrUI9jYkVkVghO4083NYMJ2NfD.ttBtYtAxYLgLyPAEFW		uploads/profil_685fd9c6da07e2.06946816.jpg
24	10	11	Otilia Manolache	andrei1@gmail.com	11	adresa	121121	necăsătorit	Frontend Developer	$2y$10$HSfoS6W1RQZ/kd/Ek23cM.CxAUFS8CiZpDiJ.ww/xgMoD3LudJ1PC		uploads/profil_685fda8e1c34e3.01179018.jpg
30	10	13	Budui Andreea	andreeabudui54@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$lwhO.yZzwQIv/uO1lwnzYOBnruizlbXCI1uKabT5/gkRf8loLY5C.		uploads/profil_68602b19631ed7.56268653.jpg
15	10	10	madi	madi@gmail.com	0747865577	adresa	121121	necăsătorit	Tester Software	$2y$10$u2twF9OKiTVVcXIzLtepZevkXiu0uGZtTGDR72ZD.Hv2Rt7OANvGS	d	uploads/profil_683ddd9997e269.44486332.jpg
3	10	10	maria	maria1@gmail.com	07356483	adresa	121121	necăsătorit	Tester Software	$2y$10$vfYEXl/uyFhvRrMKKfLS4eLmrpHqrz38ObhIxPJhl5bcxMurax02e	a	uploads/profil_683d9da31ba660.07032770.jpg
1	10	10	Budui Andreea	andreeaalexandrabudui@gmail.com	0747865577	adresa	121121	necăsătorit	Tester Software	$2y$10$8ajrErQvUDsldNmaTdQEYuOXYtopWs3SIuqJ3nhfA0yjv0VDTnzlC	nu am	uploads/20190118_190223.jpg
2	10	10	andrei	andrei@gmail.com	07356483	adresa	121121	necăsătorit	Tester Software	$2y$10$l1IpBtfq/Z0wC1AsRLQlZ.k1aibPNcZu7UOvM.yJo7TAm2Wn7FKq6	1	uploads/profil_683d9c2b1132e7.32832056.jpg
5	10	10	andrei	a@gmail.com	12333	adresa	121121	necăsătorit	Tester Software	$2y$10$9sg8MLYzoVM4KyrMLYBXLOFMVEz92/Xv1mA4oJczNl4yIVBRjoXVi	1	uploads/profil_683da345bac650.71558345.jpg
16	14	12	h	h@gmail.com	11	adresa	121121	necăsătorit	Tester Software	$2y$10$BMjRcRlyBR/NxGid1ebinuOOUl4E1y0GHLCH16eEwARUskeOabUey		uploads/profil_683de2845613e3.39702786.jpg
12	10	10	Budui Andreea	a2@gmail.com	0747865577	adresa	121121	necăsătorit	Tester Software	$2y$10$LUd0Zf2Eq4C5bGk4l3EnLu9Ygg7z0FbrDTJ49iLAq3s7HlMeTgBRa		uploads/profil_683dc3f2016798.38198106.jpg
13	13	10	Budui Andreea	d@gmail.com	0747865577	adresa	121121	căsătorit	Tester Software	$2y$10$y9hNIM9KWjlTrvrmAleXE.He8QHX1V/KVPCegDiQO8Fcd8R7ulY6i	a	uploads/profil_683dce3676b8b7.87422929.jpg
14	10	11	andrei	ff@gmail.com	0747865577	adresa	121121	necăsătorit	Tester Software	$2y$10$jhJhYNLt4PQzMtirW0k56e0GTIb95086b4ctgSA4bA7A1MCHE6z72	s	uploads/profil_683dd49bace7f9.52047586.jpg
31	10	11	Budui Andreea	andreeabudui514@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$LBzzAqVF8zoWyRVZN6PMDeaMlBSvvt1riPJ2QVnOik9YN5Ckx6q/2	participare la evenimente	uploads/profil_68602ba16d1690.05761852.jpg
32	10	11	Budui Andreea	andreeabudui2003@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$p6VzRqTpCWOgpu2Vj20are9nuPnkx114cSbqPWyCVHvtEWHocqWT6	participare la evenimente	uploads/profil_68603423680fb2.35019719.jpg
33	10	11	Budui Andreea	andreeabudui03@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$M52ZozG8gB7gdZDKUwKW2us4mKwgqpYDyg0lpU9vzzzuXUeeh9PUm	participare la evenimente	uploads/profil_68603566763a92.22857037.jpg
34	10	11	Budui Andreea	andreeabudui003@gmail.com	0747865577	strada dn11	737320	necăsătorit		$2y$10$7lcHlHPwGlxjZ3JciGQBeeUcVsLZ7KEhhEyAUJjZdrCpT8fNMYRcS	participare la evenimente	uploads/profil_686036a3589937.04095574.jpg
\.


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 246
-- Name: comentariuforum_id_comentariu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentariuforum_id_comentariu_seq', 9, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 242
-- Name: donatie_id_donatie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donatie_id_donatie_seq', 21, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 239
-- Name: eveniment_id_eveniment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eveniment_id_eveniment_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 227
-- Name: facultate_id_facultate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultate_id_facultate_seq', 24, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 231
-- Name: firma_id_firma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firma_id_firma_seq', 7, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 244
-- Name: intrebareforum_id_intrebare_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intrebareforum_id_intrebare_seq', 8, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 219
-- Name: judet_id_judet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.judet_id_judet_seq', 15, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 221
-- Name: localitate_id_localitate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.localitate_id_localitate_seq', 18, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 233
-- Name: locdemunca_id_locmunca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locdemunca_id_locmunca_seq', 56, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 236
-- Name: newsletter_id_abonare_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsletter_id_abonare_seq', 23, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 229
-- Name: specializari_id_specializare_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specializari_id_specializare_seq', 24, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 217
-- Name: tara_id_tara_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tara_id_tara_seq', 13, true);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 223
-- Name: universitate_id_universitate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universitate_id_universitate_seq', 15, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 225
-- Name: utilizator_id_utilizator_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizator_id_utilizator_seq', 34, true);


--
-- TOC entry 4767 (class 2606 OID 43578)
-- Name: comentariuforum comentariuforum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentariuforum
    ADD CONSTRAINT comentariuforum_pkey PRIMARY KEY (id_comentariu);


--
-- TOC entry 4763 (class 2606 OID 43554)
-- Name: donatie donatie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donatie
    ADD CONSTRAINT donatie_pkey PRIMARY KEY (id_donatie);


--
-- TOC entry 4759 (class 2606 OID 43532)
-- Name: eveniment eveniment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eveniment
    ADD CONSTRAINT eveniment_pkey PRIMARY KEY (id_eveniment);


--
-- TOC entry 4761 (class 2606 OID 43537)
-- Name: evenimenteutilizatori evenimenteutilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenimenteutilizatori
    ADD CONSTRAINT evenimenteutilizatori_pkey PRIMARY KEY (id_eveniment, id_utilizator);


--
-- TOC entry 4745 (class 2606 OID 43447)
-- Name: facultate facultate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultate
    ADD CONSTRAINT facultate_pkey PRIMARY KEY (id_facultate);


--
-- TOC entry 4749 (class 2606 OID 43471)
-- Name: firma firma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma
    ADD CONSTRAINT firma_pkey PRIMARY KEY (id_firma);


--
-- TOC entry 4765 (class 2606 OID 43566)
-- Name: intrebareforum intrebareforum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intrebareforum
    ADD CONSTRAINT intrebareforum_pkey PRIMARY KEY (id_intrebare);


--
-- TOC entry 4735 (class 2606 OID 43397)
-- Name: judet judet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judet
    ADD CONSTRAINT judet_pkey PRIMARY KEY (id_judet);


--
-- TOC entry 4737 (class 2606 OID 43409)
-- Name: localitate localitate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localitate
    ADD CONSTRAINT localitate_pkey PRIMARY KEY (id_localitate);


--
-- TOC entry 4751 (class 2606 OID 43478)
-- Name: locdemunca locdemunca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locdemunca
    ADD CONSTRAINT locdemunca_pkey PRIMARY KEY (id_locmunca);


--
-- TOC entry 4755 (class 2606 OID 43510)
-- Name: newsletter newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletter
    ADD CONSTRAINT newsletter_pkey PRIMARY KEY (id_abonare);


--
-- TOC entry 4757 (class 2606 OID 43515)
-- Name: newsletterutilizatori newsletterutilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletterutilizatori
    ADD CONSTRAINT newsletterutilizatori_pkey PRIMARY KEY (id_abonare, id_utilizator);


--
-- TOC entry 4753 (class 2606 OID 43493)
-- Name: specializareutilizatori specializareutilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializareutilizatori
    ADD CONSTRAINT specializareutilizatori_pkey PRIMARY KEY (id_utilizator, id_specializare);


--
-- TOC entry 4747 (class 2606 OID 43459)
-- Name: specializari specializari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializari
    ADD CONSTRAINT specializari_pkey PRIMARY KEY (id_specializare);


--
-- TOC entry 4733 (class 2606 OID 43390)
-- Name: tara tara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tara
    ADD CONSTRAINT tara_pkey PRIMARY KEY (id_tara);


--
-- TOC entry 4739 (class 2606 OID 43421)
-- Name: universitate universitate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universitate
    ADD CONSTRAINT universitate_pkey PRIMARY KEY (id_universitate);


--
-- TOC entry 4741 (class 2606 OID 43590)
-- Name: utilizator utilizator_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizator_email_key UNIQUE (email);


--
-- TOC entry 4743 (class 2606 OID 43428)
-- Name: utilizator utilizator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizator_pkey PRIMARY KEY (id_utilizator);


--
-- TOC entry 4784 (class 2606 OID 43584)
-- Name: comentariuforum comentariuforum_id_intrebare_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentariuforum
    ADD CONSTRAINT comentariuforum_id_intrebare_fkey FOREIGN KEY (id_intrebare) REFERENCES public.intrebareforum(id_intrebare);


--
-- TOC entry 4785 (class 2606 OID 43579)
-- Name: comentariuforum comentariuforum_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentariuforum
    ADD CONSTRAINT comentariuforum_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4782 (class 2606 OID 43555)
-- Name: donatie donatie_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donatie
    ADD CONSTRAINT donatie_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4780 (class 2606 OID 43538)
-- Name: evenimenteutilizatori evenimenteutilizatori_id_eveniment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenimenteutilizatori
    ADD CONSTRAINT evenimenteutilizatori_id_eveniment_fkey FOREIGN KEY (id_eveniment) REFERENCES public.eveniment(id_eveniment);


--
-- TOC entry 4781 (class 2606 OID 43543)
-- Name: evenimenteutilizatori evenimenteutilizatori_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenimenteutilizatori
    ADD CONSTRAINT evenimenteutilizatori_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4772 (class 2606 OID 43448)
-- Name: facultate facultate_id_universitate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultate
    ADD CONSTRAINT facultate_id_universitate_fkey FOREIGN KEY (id_universitate) REFERENCES public.universitate(id_universitate);


--
-- TOC entry 4783 (class 2606 OID 43567)
-- Name: intrebareforum intrebareforum_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intrebareforum
    ADD CONSTRAINT intrebareforum_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4768 (class 2606 OID 43398)
-- Name: judet judet_id_tara_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judet
    ADD CONSTRAINT judet_id_tara_fkey FOREIGN KEY (id_tara) REFERENCES public.tara(id_tara);


--
-- TOC entry 4769 (class 2606 OID 43410)
-- Name: localitate localitate_id_judet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localitate
    ADD CONSTRAINT localitate_id_judet_fkey FOREIGN KEY (id_judet) REFERENCES public.judet(id_judet);


--
-- TOC entry 4774 (class 2606 OID 43484)
-- Name: locdemunca locdemunca_id_firma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locdemunca
    ADD CONSTRAINT locdemunca_id_firma_fkey FOREIGN KEY (id_firma) REFERENCES public.firma(id_firma);


--
-- TOC entry 4775 (class 2606 OID 43479)
-- Name: locdemunca locdemunca_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locdemunca
    ADD CONSTRAINT locdemunca_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4778 (class 2606 OID 43516)
-- Name: newsletterutilizatori newsletterutilizatori_id_abonare_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletterutilizatori
    ADD CONSTRAINT newsletterutilizatori_id_abonare_fkey FOREIGN KEY (id_abonare) REFERENCES public.newsletter(id_abonare);


--
-- TOC entry 4779 (class 2606 OID 43521)
-- Name: newsletterutilizatori newsletterutilizatori_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletterutilizatori
    ADD CONSTRAINT newsletterutilizatori_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4776 (class 2606 OID 43499)
-- Name: specializareutilizatori specializareutilizatori_id_specializare_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializareutilizatori
    ADD CONSTRAINT specializareutilizatori_id_specializare_fkey FOREIGN KEY (id_specializare) REFERENCES public.specializari(id_specializare);


--
-- TOC entry 4777 (class 2606 OID 43494)
-- Name: specializareutilizatori specializareutilizatori_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializareutilizatori
    ADD CONSTRAINT specializareutilizatori_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- TOC entry 4773 (class 2606 OID 43460)
-- Name: specializari specializari_id_facultate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializari
    ADD CONSTRAINT specializari_id_facultate_fkey FOREIGN KEY (id_facultate) REFERENCES public.facultate(id_facultate);


--
-- TOC entry 4770 (class 2606 OID 43431)
-- Name: utilizator utilizator_id_localitate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizator_id_localitate_fkey FOREIGN KEY (id_localitate) REFERENCES public.localitate(id_localitate);


--
-- TOC entry 4771 (class 2606 OID 43436)
-- Name: utilizator utilizator_id_universitate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizator_id_universitate_fkey FOREIGN KEY (id_universitate) REFERENCES public.universitate(id_universitate);


-- Completed on 2026-03-17 21:01:28

--
-- PostgreSQL database dump complete
--

