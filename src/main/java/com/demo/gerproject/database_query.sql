--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-14 22:13:26

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
-- TOC entry 214 (class 1259 OID 25396)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    place_id integer NOT NULL,
    text character varying(255)
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25399)
-- Name: comment_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_sequence OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25400)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    firstname character varying(255),
    lastname character varying(255),
    password character varying(255),
    place_id integer NOT NULL,
    role character varying NOT NULL,
    username character varying(255),
    email character varying(255)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25405)
-- Name: customer_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_sequence OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25406)
-- Name: customer_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_stock (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    quantity integer NOT NULL,
    stock_id integer NOT NULL
);


ALTER TABLE public.customer_stock OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25409)
-- Name: customer_stock_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_stock_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_stock_sequence OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25410)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    place_id integer NOT NULL,
    salary double precision NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25415)
-- Name: employee_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_sequence OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25416)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    amount double precision NOT NULL,
    customer_id integer NOT NULL,
    place_id integer NOT NULL,
    status character varying(255) NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25419)
-- Name: payment_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_sequence OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25420)
-- Name: place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place (
    id integer NOT NULL,
    capacity integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.place OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25423)
-- Name: place_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.place_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.place_sequence OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25424)
-- Name: place_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place_service (
    id integer NOT NULL,
    place_id integer NOT NULL,
    price integer NOT NULL,
    type character varying(255)
);


ALTER TABLE public.place_service OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25427)
-- Name: place_service_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.place_service_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.place_service_sequence OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25428)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    available integer NOT NULL,
    bk_date timestamp(6) without time zone,
    customer_id integer NOT NULL,
    description character varying(255),
    place_id integer NOT NULL,
    place_service_type integer NOT NULL,
    vehicle_id integer NOT NULL,
    vehicle_status character varying NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25433)
-- Name: schedule_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_sequence OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25434)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    item character varying(255),
    place_id integer NOT NULL,
    quantity integer NOT NULL,
    pcs_price double precision NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25437)
-- Name: stock_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_sequence OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25438)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    id integer NOT NULL,
    brand character varying(255),
    customer_id integer NOT NULL,
    km double precision NOT NULL,
    model character varying(255),
    v_year integer NOT NULL,
    vehicle_engine_type character varying(255),
    vehicle_type character varying(255)
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25443)
-- Name: vehicle_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_sequence OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 25396)
-- Dependencies: 214
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, customer_id, place_id, text) FROM stdin;
\.


--
-- TOC entry 3395 (class 0 OID 25400)
-- Dependencies: 216
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, created_at, firstname, lastname, password, place_id, role, username, email) FROM stdin;
7	2023-01-08 00:14:18.214	Test	test	$2a$10$d9WhDyOxtLbeKPZAzLULMeXFfS0QmIHmDwncnVqTzfjTgHsv/9sJO	1	USER	test	test@gmail.com
8	2023-01-08 19:21:03.232	mustafa	mustafa	$2a$10$DiqHNJp5t2wubUZs95qpUu/bl5qppcLPGY5kIIEeqdGfNJRXeY2ZC	1	USER	mustafa	mustafa@gmail.com
11	2023-01-13 12:58:48.129	as	as	$2a$10$bP89nlWgsd0t4vsvD2f4neYq1scTBj81nRn7SuJKEXmM.bhXK92ka	1	USER	as	cgunes52@gmail.com
14	2023-01-14 14:06:29.592	alican	gunes	$2a$10$SYgxhluxAI1EwQJ4qjllHOaFBUW24taDjgKurqs6pzkLEmBhTBH2W	1	ADMIN	alicangunes	alican@gmail.com
\.


--
-- TOC entry 3397 (class 0 OID 25406)
-- Dependencies: 218
-- Data for Name: customer_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_stock (id, customer_id, quantity, stock_id) FROM stdin;
1	3	1	1
2	3	1	3
3	3	2	5
4	4	2	1
5	4	2	4
\.


--
-- TOC entry 3399 (class 0 OID 25410)
-- Dependencies: 220
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, firstname, lastname, place_id, salary) FROM stdin;
1	Tuncer	Ek	1	8.5
2	Selim	Kırgın	1	12.4
3	Ali	Yol	1	11.5
5	Kasım	Turp	1	15.4
6	Yaşar	Yaşamaz	1	9.2
7	can	can	1	9.2
\.


--
-- TOC entry 3401 (class 0 OID 25416)
-- Dependencies: 222
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, amount, customer_id, place_id, status, schedule_id) FROM stdin;
1	1300	7	1	PAID	6
7	1322.5	7	1	PAID	11
8	65	7	1	PAID	12
9	820	7	1	PAID	13
\.


--
-- TOC entry 3403 (class 0 OID 25420)
-- Dependencies: 224
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place (id, capacity, name) FROM stdin;
1	4	CG
2	4	DG
3	4	YY
\.


--
-- TOC entry 3405 (class 0 OID 25424)
-- Dependencies: 226
-- Data for Name: place_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place_service (id, place_id, price, type) FROM stdin;
1	1	500	Annual Service
2	1	800	Major Service
3	1	1300	Fault Repair Service
4	0	45	Can Service
6	0	430	Mustafa service
11	1	520	abc
12	1	423	cdg
\.


--
-- TOC entry 3407 (class 0 OID 25428)
-- Dependencies: 228
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (id, available, bk_date, customer_id, description, place_id, place_service_type, vehicle_id, vehicle_status) FROM stdin;
6	4	2023-01-12 17:45:15	7	calismiyor	1	2	13	FIXED
9	4	2023-01-17 17:45:15	8	bilmiyom ne oldu	1	2	2	BOOKED
11	4	2023-01-18 03:00:00	7	asdaas	1	3	14	BOOKED
12	4	2023-01-20 03:00:00	7	deneme	1	4	15	BOOKED
13	4	2023-01-21 03:00:00	7	yag akitiyor	1	2	1	FIXED
\.


--
-- TOC entry 3409 (class 0 OID 25434)
-- Dependencies: 230
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id, item, place_id, quantity, pcs_price) FROM stdin;
1	Snow Brush	1	20	12.8
2	Car Power Inverter	1	50	20
3	Car Fresher	1	100	8
4	Car Led Lights	1	10	20.5
5	Antifreeze	1	50	22.5
\.


--
-- TOC entry 3411 (class 0 OID 25438)
-- Dependencies: 232
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (id, brand, customer_id, km, model, v_year, vehicle_engine_type, vehicle_type) FROM stdin;
1	Skoda	7	220.231	Fabia	2001	Petrol	Hatchback
2	Mini Cooper	8	56.456	Cooper	2001	Diesel	Hatchback
13	Fiat	7	168.2	Palio	2001	Petrol	Hatchback
14	Fiat	7	7.2	Egea	2017	Petrol	Sedan
15	Hyundai	7	42.5	ix35	2015	Petrol	4x4
\.


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 215
-- Name: comment_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_sequence', 14, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 217
-- Name: customer_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_sequence', 14, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_stock_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_stock_sequence', 5, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 221
-- Name: employee_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_sequence', 13, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 223
-- Name: payment_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_sequence', 9, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 225
-- Name: place_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.place_sequence', 3, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 227
-- Name: place_service_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.place_service_sequence', 12, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 229
-- Name: schedule_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_sequence', 13, true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 231
-- Name: stock_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_sequence', 5, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 233
-- Name: vehicle_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_sequence', 15, true);


--
-- TOC entry 3219 (class 2606 OID 25445)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 25447)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 25449)
-- Name: customer_stock customer_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_stock
    ADD CONSTRAINT customer_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 25451)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 25453)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 25455)
-- Name: place place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 25457)
-- Name: place_service place_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_service
    ADD CONSTRAINT place_service_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 25459)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 25461)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 25463)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 25464)
-- Name: comment comment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 25469)
-- Name: customer customer_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 25474)
-- Name: employee employee_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 25479)
-- Name: payment payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 25484)
-- Name: payment payment_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 25489)
-- Name: payment payment_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 25494)
-- Name: place_service place_service_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_service
    ADD CONSTRAINT place_service_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 25499)
-- Name: schedule schedule_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 25504)
-- Name: schedule schedule_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 25509)
-- Name: schedule schedule_place_service_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_place_service_type_fkey FOREIGN KEY (place_service_type) REFERENCES public.place_service(id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 25514)
-- Name: schedule schedule_vehicle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_vehicle_id_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id) NOT VALID;


--
-- TOC entry 3249 (class 2606 OID 25519)
-- Name: stock stock_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 25524)
-- Name: vehicle vehicle_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


-- Completed on 2023-01-14 22:13:26

--
-- PostgreSQL database dump complete
--

