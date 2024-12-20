toc.dat                                                                                             0000600 0004000 0002000 00000040734 14730543731 0014456 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            ie172project    17.0    17.0 7    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         7           1262    41163    ie172project    DATABASE     �   CREATE DATABASE ie172project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE ie172project;
                     postgres    false         �            1259    41172    clients    TABLE     �  CREATE TABLE public.clients (
    client_id integer NOT NULL,
    client_first_m character varying(32) NOT NULL,
    client_last_m character varying(32) NOT NULL,
    client_company character varying(128) NOT NULL,
    client_email character varying(128) NOT NULL,
    date_acquired date NOT NULL,
    client_status character varying(32) NOT NULL,
    client_delete_ind boolean DEFAULT false
);
    DROP TABLE public.clients;
       public         heap r       postgres    false         �            1259    41171    clients_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_client_id_seq;
       public               postgres    false    219         8           0    0    clients_client_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;
          public               postgres    false    218         �            1259    41179    jobs    TABLE     �  CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    job_title character varying(64) NOT NULL,
    days integer NOT NULL,
    hours integer NOT NULL,
    hourly_rate numeric(5,2) NOT NULL,
    hourly_commission numeric(5,2) NOT NULL,
    start_date date NOT NULL,
    assignment_date date,
    job_status character varying(32) NOT NULL,
    client_id integer,
    va_id integer,
    job_delete_ind boolean DEFAULT false
);
    DROP TABLE public.jobs;
       public         heap r       postgres    false         �            1259    41178    jobs_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.jobs_job_id_seq;
       public               postgres    false    221         9           0    0    jobs_job_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.jobs_job_id_seq OWNED BY public.jobs.job_id;
          public               postgres    false    220         �            1259    41237    jobs_skills    TABLE     q   CREATE TABLE public.jobs_skills (
    job_skill_id integer NOT NULL,
    job_id integer,
    skill_id integer
);
    DROP TABLE public.jobs_skills;
       public         heap r       postgres    false         �            1259    41236    jobs_skills_job_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobs_skills_job_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.jobs_skills_job_skill_id_seq;
       public               postgres    false    229         :           0    0    jobs_skills_job_skill_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.jobs_skills_job_skill_id_seq OWNED BY public.jobs_skills.job_skill_id;
          public               postgres    false    228         �            1259    41186    skills    TABLE     �   CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    skill_m character varying(64) NOT NULL,
    skill_description character varying(512) NOT NULL,
    skill_delete_ind boolean DEFAULT false
);
    DROP TABLE public.skills;
       public         heap r       postgres    false         �            1259    41185    skills_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.skills_skill_id_seq;
       public               postgres    false    223         ;           0    0    skills_skill_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;
          public               postgres    false    222         �            1259    41164    users    TABLE     �   CREATE TABLE public.users (
    user_name character varying(32),
    user_password character varying(64) NOT NULL,
    user_modified_on timestamp without time zone DEFAULT now(),
    user_delete_ind boolean DEFAULT false
);
    DROP TABLE public.users;
       public         heap r       postgres    false         �            1259    41196    va    TABLE     f  CREATE TABLE public.va (
    va_id integer NOT NULL,
    va_first_m character varying(32) NOT NULL,
    va_last_m character varying(32) NOT NULL,
    va_email character varying(64) NOT NULL,
    va_address character varying(128) NOT NULL,
    date_hired date NOT NULL,
    va_status character varying(32) NOT NULL,
    va_delete_ind boolean DEFAULT false
);
    DROP TABLE public.va;
       public         heap r       postgres    false         �            1259    41203 	   va_skills    TABLE     n   CREATE TABLE public.va_skills (
    va_skills_id integer NOT NULL,
    va_id integer,
    skill_id integer
);
    DROP TABLE public.va_skills;
       public         heap r       postgres    false         �            1259    41202    va_skills_va_skills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.va_skills_va_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.va_skills_va_skills_id_seq;
       public               postgres    false    227         <           0    0    va_skills_va_skills_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.va_skills_va_skills_id_seq OWNED BY public.va_skills.va_skills_id;
          public               postgres    false    226         �            1259    41195    va_va_id_seq    SEQUENCE     �   CREATE SEQUENCE public.va_va_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.va_va_id_seq;
       public               postgres    false    225         =           0    0    va_va_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.va_va_id_seq OWNED BY public.va.va_id;
          public               postgres    false    224         v           2604    41175    clients client_id    DEFAULT     v   ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);
 @   ALTER TABLE public.clients ALTER COLUMN client_id DROP DEFAULT;
       public               postgres    false    218    219    219         x           2604    41182    jobs job_id    DEFAULT     j   ALTER TABLE ONLY public.jobs ALTER COLUMN job_id SET DEFAULT nextval('public.jobs_job_id_seq'::regclass);
 :   ALTER TABLE public.jobs ALTER COLUMN job_id DROP DEFAULT;
       public               postgres    false    221    220    221                    2604    41240    jobs_skills job_skill_id    DEFAULT     �   ALTER TABLE ONLY public.jobs_skills ALTER COLUMN job_skill_id SET DEFAULT nextval('public.jobs_skills_job_skill_id_seq'::regclass);
 G   ALTER TABLE public.jobs_skills ALTER COLUMN job_skill_id DROP DEFAULT;
       public               postgres    false    228    229    229         z           2604    41189    skills skill_id    DEFAULT     r   ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);
 >   ALTER TABLE public.skills ALTER COLUMN skill_id DROP DEFAULT;
       public               postgres    false    222    223    223         |           2604    41199    va va_id    DEFAULT     d   ALTER TABLE ONLY public.va ALTER COLUMN va_id SET DEFAULT nextval('public.va_va_id_seq'::regclass);
 7   ALTER TABLE public.va ALTER COLUMN va_id DROP DEFAULT;
       public               postgres    false    225    224    225         ~           2604    41206    va_skills va_skills_id    DEFAULT     �   ALTER TABLE ONLY public.va_skills ALTER COLUMN va_skills_id SET DEFAULT nextval('public.va_skills_va_skills_id_seq'::regclass);
 E   ALTER TABLE public.va_skills ALTER COLUMN va_skills_id DROP DEFAULT;
       public               postgres    false    227    226    227         '          0    41172    clients 
   TABLE DATA           �   COPY public.clients (client_id, client_first_m, client_last_m, client_company, client_email, date_acquired, client_status, client_delete_ind) FROM stdin;
    public               postgres    false    219       4903.dat )          0    41179    jobs 
   TABLE DATA           �   COPY public.jobs (job_id, job_title, days, hours, hourly_rate, hourly_commission, start_date, assignment_date, job_status, client_id, va_id, job_delete_ind) FROM stdin;
    public               postgres    false    221       4905.dat 1          0    41237    jobs_skills 
   TABLE DATA           E   COPY public.jobs_skills (job_skill_id, job_id, skill_id) FROM stdin;
    public               postgres    false    229       4913.dat +          0    41186    skills 
   TABLE DATA           X   COPY public.skills (skill_id, skill_m, skill_description, skill_delete_ind) FROM stdin;
    public               postgres    false    223       4907.dat %          0    41164    users 
   TABLE DATA           \   COPY public.users (user_name, user_password, user_modified_on, user_delete_ind) FROM stdin;
    public               postgres    false    217       4901.dat -          0    41196    va 
   TABLE DATA           v   COPY public.va (va_id, va_first_m, va_last_m, va_email, va_address, date_hired, va_status, va_delete_ind) FROM stdin;
    public               postgres    false    225       4909.dat /          0    41203 	   va_skills 
   TABLE DATA           B   COPY public.va_skills (va_skills_id, va_id, skill_id) FROM stdin;
    public               postgres    false    227       4911.dat >           0    0    clients_client_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clients_client_id_seq', 12, false);
          public               postgres    false    218         ?           0    0    jobs_job_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jobs_job_id_seq', 27, false);
          public               postgres    false    220         @           0    0    jobs_skills_job_skill_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.jobs_skills_job_skill_id_seq', 259, true);
          public               postgres    false    228         A           0    0    skills_skill_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.skills_skill_id_seq', 15, false);
          public               postgres    false    222         B           0    0    va_skills_va_skills_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.va_skills_va_skills_id_seq', 92, true);
          public               postgres    false    226         C           0    0    va_va_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.va_va_id_seq', 22, false);
          public               postgres    false    224         �           2606    41177    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public                 postgres    false    219         �           2606    41184    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public                 postgres    false    221         �           2606    41242    jobs_skills jobs_skills_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_pkey PRIMARY KEY (job_skill_id);
 F   ALTER TABLE ONLY public.jobs_skills DROP CONSTRAINT jobs_skills_pkey;
       public                 postgres    false    229         �           2606    41194    skills skills_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);
 <   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_pkey;
       public                 postgres    false    223         �           2606    41170    users users_user_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_name_key;
       public                 postgres    false    217         �           2606    41201 
   va va_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.va
    ADD CONSTRAINT va_pkey PRIMARY KEY (va_id);
 4   ALTER TABLE ONLY public.va DROP CONSTRAINT va_pkey;
       public                 postgres    false    225         �           2606    41208    va_skills va_skills_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_pkey PRIMARY KEY (va_skills_id);
 B   ALTER TABLE ONLY public.va_skills DROP CONSTRAINT va_skills_pkey;
       public                 postgres    false    227         �           2606    41312    jobs jobs_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 B   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_client_id_fkey;
       public               postgres    false    221    4739    219         �           2606    41243 #   jobs_skills jobs_skills_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 M   ALTER TABLE ONLY public.jobs_skills DROP CONSTRAINT jobs_skills_job_id_fkey;
       public               postgres    false    221    229    4741         �           2606    41248 %   jobs_skills jobs_skills_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id);
 O   ALTER TABLE ONLY public.jobs_skills DROP CONSTRAINT jobs_skills_skill_id_fkey;
       public               postgres    false    229    223    4743         �           2606    41317    jobs jobs_va_id_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_va_id_fkey FOREIGN KEY (va_id) REFERENCES public.va(va_id);
 >   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_va_id_fkey;
       public               postgres    false    4745    225    221         �           2606    41214 !   va_skills va_skills_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id);
 K   ALTER TABLE ONLY public.va_skills DROP CONSTRAINT va_skills_skill_id_fkey;
       public               postgres    false    4743    227    223         �           2606    41209    va_skills va_skills_va_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_va_id_fkey FOREIGN KEY (va_id) REFERENCES public.va(va_id);
 H   ALTER TABLE ONLY public.va_skills DROP CONSTRAINT va_skills_va_id_fkey;
       public               postgres    false    227    225    4745                                            4903.dat                                                                                            0000600 0004000 0002000 00000001660 14730543731 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Amber	Spry	Fusion Athletics Center	amber@fusionathleticcenter.com	2024-03-10	ACTIVE	f
3	Matt	Henry	GymTek Academy	mhenry@gymtekacademy.com	2024-02-20	ACTIVE	f
4	Scott	Lummus	Gymnastics World of Georgia, Cummings	scott@gymworldofga.com	2024-03-20	ACTIVE	f
5	Scott	Lummus	Gymnastics World of Georgia, John's Creek	scott@gymworldofga.com	2024-03-15	ACTIVE	f
6	Jason	Bauer	Head Over Heels	jason@hohgymnj.com	2023-07-16	ACTIVE	f
7	Jason	Antz	I-Prevail Supplements	jason@i-prevailsupps.com	2023-12-28	ACTIVE	f
8	Ashley	Lyons	Ocean State School of Gymnastics	ashleylyons@ossg.com	2024-02-23	ACTIVE	f
9	Cassie	Davis	Stars and Stripes Athletics	cassie@starsandstripeskids.com	2023-10-23	ACTIVE	f
10	Sue	Salyer	Spotlight Acro and Cheer	spotlightacro@gmail.com	2024-10-07	ACTIVE	f
11	DeShaun	Holden	Top Notch Training Gym	deshaun@tntgym.org	2024-09-13	ACTIVE	f
1	Dianna	Haas	American Gymnastics Academy	dianna@agamericangym.com	2023-10-27	ACTIVE	f
\.


                                                                                4905.dat                                                                                            0000600 0004000 0002000 00000003601 14730543731 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Fusion_Administrative VA	5	20	5.00	1.00	2024-03-10	2024-03-11	ACTIVE	2	5	f
5	GTA_Administrative VA	5	15	7.00	5.50	2024-02-20	2024-02-26	ACTIVE	3	18	f
6	GWGC_Social Media VA	5	14	5.00	1.00	2024-05-27	2024-05-30	ACTIVE	4	9	f
7	GWGC_Administrative VA	4	16	5.00	1.00	2024-03-20	2024-03-25	ACTIVE	4	14	f
8	GWGJC_Operations VA	5	25	5.00	1.00	2024-03-15	2024-03-18	ACTIVE	5	18	f
9	HOH_Executive VA	6	26	7.25	0.25	2023-07-16	2023-07-17	ACTIVE	6	8	f
10	HOH_Data Analyst	3	12	5.75	0.75	2023-12-01	2023-12-04	ACTIVE	6	19	f
11	HOH_GoConnect Specialist	5	18	5.25	0.75	2023-10-28	2023-10-30	ACTIVE	6	17	f
12	HOH_HR VA	4	16	5.00	0.25	2023-07-20	2023-07-21	ACTIVE	6	9	f
13	HOH_Programs VA	5	20	5.00	0.25	2023-08-19	2023-08-21	ACTIVE	6	12	f
14	HOH_Graphic Design VA	5	25	4.75	0.25	2023-07-24	2023-07-25	ACTIVE	6	3	f
15	HOH_Facility Management VA	5	20	4.75	0.25	2023-07-21	2023-07-21	ACTIVE	6	16	f
16	HOH_Strategic Projects VA	6	18	4.75	0.25	2023-07-22	2023-07-24	ACTIVE	6	7	f
17	HOH_NinjaZone VA	5	20	4.75	0.25	2023-07-31	2023-08-02	ACTIVE	6	15	f
18	HOH_CSR VA	4	20	4.75	0.25	2023-07-22	2023-07-24	ACTIVE	6	18	f
19	HOH_Social Media VA	5	20	4.50	0.25	2024-10-31	2024-11-04	ACTIVE	6	2	f
20	HOH_Marketing Liason VA	4	16	3.75	0.25	2024-10-25	2024-10-28	ACTIVE	6	1	f
23	OSSG_Administrative VA	5	12	5.00	1.00	2024-02-23	2024-02-26	ACTIVE	8	13	f
24	S&S_Graphic Design VA	3	3	4.00	1.00	2023-10-23	2023-10-25	ACTIVE	9	11	f
25	SAC_Administrative VA	4	12	5.00	1.00	2024-10-07	2024-10-10	ACTIVE	10	4	f
26	TNT_Operations VA	5	35	6.00	1.00	2024-09-13	2024-09-16	ACTIVE	11	17	f
3	AGA_Administrative VA	5	24	5.00	1.00	2023-10-27	2023-10-30	ACTIVE	1	21	f
21	IPS_Administrative VA	5	15	5.00	1.00	2024-04-15	2024-04-16	ACTIVE	7	14	f
22	IPS_Graphic Design VA	4	12	6.00	1.00	2023-12-28	2024-01-02	ACTIVE	7	20	f
2	AGA_Marketing VA	4	20	5.00	1.00	2023-10-27	2023-10-30	ON HOLD	1	10	f
1	AGA_Operations VA	4	24	5.00	1.00	2023-10-27	2023-10-30	ACTIVE	1	6	f
\.


                                                                                                                               4913.dat                                                                                            0000600 0004000 0002000 00000001317 14730543731 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        239	1	1
240	1	3
241	1	4
242	1	5
243	1	9
244	1	12
12	4	1
13	4	4
14	4	12
15	4	13
16	5	1
17	5	2
18	5	4
19	5	7
20	5	11
21	5	12
22	5	14
23	6	1
24	6	2
25	6	4
26	7	1
27	8	1
28	8	4
29	8	8
30	8	11
31	8	12
32	8	14
33	9	1
34	9	2
35	9	3
36	9	4
37	9	13
38	10	3
39	11	11
40	11	12
41	12	1
42	12	4
43	12	8
44	12	13
45	13	1
46	13	2
47	13	4
48	13	8
49	13	13
50	14	1
51	14	2
52	14	4
53	15	1
54	15	2
55	15	4
56	16	1
57	16	3
58	17	1
59	17	3
60	18	1
61	18	4
62	18	11
63	18	12
64	18	14
65	19	2
66	19	4
67	19	5
68	20	1
73	23	1
74	23	2
75	23	4
76	23	8
77	23	12
78	24	4
79	25	1
80	25	2
81	25	4
82	25	12
83	26	1
84	26	2
85	26	4
86	26	10
87	26	11
88	26	12
219	3	1
220	3	4
221	3	13
226	21	1
227	22	4
228	22	5
229	22	7
230	2	1
231	2	4
232	2	14
\.


                                                                                                                                                                                                                                                                                                                 4907.dat                                                                                            0000600 0004000 0002000 00000003240 14730543731 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Administrative Assistance	Manages day-to-day tasks, including scheduling, email management, and organization, to streamline operations and support client needs.	f
2	Social Media Management	Creates, schedules, and monitors social media content to build brand presence and engage with target audiences across platforms.	f
3	Data Analysis	Analyzes data to provide actionable insights that drive decision-making and improve business performance.	f
4	Canva Design	Utilizes Canva to create visually appealing graphics, presentations, and social media assets.	f
5	Photoshop Design	Leverages Photoshop to edit images and design custom visual elements for branding and marketing.	f
6	App Design	Designs user-friendly and visually cohesive apps, focusing on an intuitive user experience.	f
7	Web Design	Develops and maintains websites that are functional, responsive, and aligned with branding goals.	f
8	Recruitment	Sources, screens, and interviews candidates to find the best fit for each role, optimizing team efficiency.	f
9	Accounting	Manages financial transactions, budgeting, and reporting to ensure accurate and timely financial records.	f
10	Customer Service (V)	Provides responsive and friendly voice support to assist customers with inquiries and resolve issues.	f
11	Customer Service (NV)	Handles customer support through email and chat, delivering clear and efficient assistance.	f
12	GoConnect	Uses GoConnect to manage and enhance customer support interactions and workflows.	f
13	Connecteam	Employs Connecteam to streamline team communication, scheduling, and task management.	f
14	Shopify	Utilizes Shopify to manage product listings, marketing campaigns, and e-commerce solutions.	f
\.


                                                                                                                                                                                                                                                                                                                                                                4901.dat                                                                                            0000600 0004000 0002000 00000000316 14730543731 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Joshua	03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4	2024-12-15 02:29:12.665747	f
Micah	b168cb5c0e4f8334e7618f13ed1dce60617c7dfc0cbfcbbb135bf4de5d5ce1f6	2024-12-17 23:43:06.125004	f
\.


                                                                                                                                                                                                                                                                                                                  4909.dat                                                                                            0000600 0004000 0002000 00000004102 14730543731 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Divine	Cabrales	divineangelcabrales@gmail.com	Q2QJ+V9W San Jose del Monte City, Bulacan	2024-10-31	ACTIVE	f
3	Fumi	Cabrales	mascabrales@gmail.com	Q2QJ+V9W San Jose del Monte City, Bulacan	2023-07-24	ACTIVE	f
4	Julia	Cambel	juliacristinacambel@gmail.com	Silk Residences, Sta mesa	2024-10-10	ACTIVE	f
5	Joan	Dela Cruz	joandelacruz663@gmail.com	Turac Pangasinan	2024-03-10	ACTIVE	f
6	Nicole	Figueroa	ndfigueroa25@gmail.com	Quezon City, Metro Manila	2023-10-30	ACTIVE	f
7	Angelica	Jajalla	angelica.grace.jajalla@gmail.com	QX27+2F Meycauayan, Bulacan, Philippines                            	2023-07-22	ACTIVE	f
8	Anj	Miranda	anjmiranda008@gmail.com	RVVM+R49 Guiguinto, Bulacan, Philippines	2023-07-16	ACTIVE	f
9	Cheska	Miranda	cesca.miranda@gmial.com	RVVM+R49 Guiguinto, Bulacan, Philippines                            	2023-07-21	ACTIVE	f
10	Clizen	Oblimar	oblimarcv@gmail.com	Bulakan. Bulacan	2023-10-30	ACTIVE	f
11	Danica	Ocampo	Danica.ocampo1610@gmail.com	17 Salinas, Lungsod ng Valenzuela, 1440 Kalakhang Maynila	2023-10-25	ACTIVE	f
12	Rodge	Papa	joserodrigopapa@gmail.com	HXHJ+RP Manila, Metro Manila	2023-08-21	ACTIVE	f
13	Prince	Posadas	princeericson.posadas@gmail.com	Commonwealth, Quezon City, National Capital Region, Philippines	2024-02-26	ACTIVE	f
14	Kath	Rapisura	kathrinejoymoratorapisura@gmail.com	RW58+GH Balagtas, Bulacan	2024-04-16	ACTIVE	f
15	Micah	Reyes	micahjoyce.reyes.reyes@gmail.com	H369+VVW Pasig, Metro Manila	2023-08-02	ACTIVE	f
16	Gab	Sanchez	gabrielleanthea.sanchez1@gmail.com	QX27+2F Meycauayan, Bulacan, Philippines	2023-07-21	ACTIVE	f
17	Jallezia	Surio	jalleziames@gmail.com	RW8W+QQP Santa Maria, Bulacan	2023-10-30	ACTIVE	f
18	Alexis	Taga-an	alexisdua28@gmail.com	Q229+62 Caloocan, Metro Manila, Philippines	2023-07-22	ACTIVE	f
19	Jai	Valeriano	sjogren2479@gmail.com	QX27+FH3 Meycauayan, Bulacan	2023-12-03	ACTIVE	f
20	Hannah	Zaragosa	faithzaragoza1@gmail.com	RVGQ+FVQ Guiguinto, Bulacan	2024-01-02	ACTIVE	f
21	Michelle	Mateo	michu.synergyva@gmail.com	Taal, Bocaue, Bulacan	2023-10-30	ACTIVE	f
1	Mikhaela	Arcega	m.mikhaelaa8@gmail.com	Malabon, Metro Manila	2024-10-25	ACTIVE	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                              4911.dat                                                                                            0000600 0004000 0002000 00000001042 14730543731 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	2	2
6	2	4
8	3	1
9	3	4
12	2	5
13	3	2
14	4	1
15	4	2
16	4	4
17	4	12
18	5	1
19	5	4
20	5	12
21	5	13
22	6	1
23	6	3
24	6	4
25	6	9
33	7	3
34	8	1
35	8	2
36	8	3
37	8	4
38	8	13
39	9	1
40	9	4
41	9	8
42	9	13
43	10	1
44	10	4
45	10	14
46	11	4
47	12	1
48	12	2
49	12	4
50	12	8
51	12	13
52	13	1
53	13	2
54	13	3
55	13	4
56	13	12
57	14	2
58	15	1
59	15	3
60	15	4
61	15	9
62	16	1
63	16	2
64	16	4
65	17	1
66	17	2
67	17	4
68	17	10
69	17	11
70	17	12
71	18	1
72	18	2
73	18	4
74	18	7
75	18	11
76	18	12
77	18	14
78	19	3
79	20	1
80	20	5
81	20	7
82	21	1
83	6	12
87	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000033103 14730543731 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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

DROP DATABASE ie172project;
--
-- Name: ie172project; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ie172project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';


ALTER DATABASE ie172project OWNER TO postgres;

\connect ie172project

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
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    client_id integer NOT NULL,
    client_first_m character varying(32) NOT NULL,
    client_last_m character varying(32) NOT NULL,
    client_company character varying(128) NOT NULL,
    client_email character varying(128) NOT NULL,
    date_acquired date NOT NULL,
    client_status character varying(32) NOT NULL,
    client_delete_ind boolean DEFAULT false
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_client_id_seq OWNER TO postgres;

--
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    job_title character varying(64) NOT NULL,
    days integer NOT NULL,
    hours integer NOT NULL,
    hourly_rate numeric(5,2) NOT NULL,
    hourly_commission numeric(5,2) NOT NULL,
    start_date date NOT NULL,
    assignment_date date,
    job_status character varying(32) NOT NULL,
    client_id integer,
    va_id integer,
    job_delete_ind boolean DEFAULT false
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_job_id_seq OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_job_id_seq OWNED BY public.jobs.job_id;


--
-- Name: jobs_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs_skills (
    job_skill_id integer NOT NULL,
    job_id integer,
    skill_id integer
);


ALTER TABLE public.jobs_skills OWNER TO postgres;

--
-- Name: jobs_skills_job_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_skills_job_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_skills_job_skill_id_seq OWNER TO postgres;

--
-- Name: jobs_skills_job_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_skills_job_skill_id_seq OWNED BY public.jobs_skills.job_skill_id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    skill_m character varying(64) NOT NULL,
    skill_description character varying(512) NOT NULL,
    skill_delete_ind boolean DEFAULT false
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_skill_id_seq OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_name character varying(32),
    user_password character varying(64) NOT NULL,
    user_modified_on timestamp without time zone DEFAULT now(),
    user_delete_ind boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: va; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.va (
    va_id integer NOT NULL,
    va_first_m character varying(32) NOT NULL,
    va_last_m character varying(32) NOT NULL,
    va_email character varying(64) NOT NULL,
    va_address character varying(128) NOT NULL,
    date_hired date NOT NULL,
    va_status character varying(32) NOT NULL,
    va_delete_ind boolean DEFAULT false
);


ALTER TABLE public.va OWNER TO postgres;

--
-- Name: va_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.va_skills (
    va_skills_id integer NOT NULL,
    va_id integer,
    skill_id integer
);


ALTER TABLE public.va_skills OWNER TO postgres;

--
-- Name: va_skills_va_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.va_skills_va_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.va_skills_va_skills_id_seq OWNER TO postgres;

--
-- Name: va_skills_va_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.va_skills_va_skills_id_seq OWNED BY public.va_skills.va_skills_id;


--
-- Name: va_va_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.va_va_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.va_va_id_seq OWNER TO postgres;

--
-- Name: va_va_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.va_va_id_seq OWNED BY public.va.va_id;


--
-- Name: clients client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);


--
-- Name: jobs job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN job_id SET DEFAULT nextval('public.jobs_job_id_seq'::regclass);


--
-- Name: jobs_skills job_skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_skills ALTER COLUMN job_skill_id SET DEFAULT nextval('public.jobs_skills_job_skill_id_seq'::regclass);


--
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);


--
-- Name: va va_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va ALTER COLUMN va_id SET DEFAULT nextval('public.va_va_id_seq'::regclass);


--
-- Name: va_skills va_skills_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va_skills ALTER COLUMN va_skills_id SET DEFAULT nextval('public.va_skills_va_skills_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (client_id, client_first_m, client_last_m, client_company, client_email, date_acquired, client_status, client_delete_ind) FROM stdin;
\.
COPY public.clients (client_id, client_first_m, client_last_m, client_company, client_email, date_acquired, client_status, client_delete_ind) FROM '$$PATH$$/4903.dat';

--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (job_id, job_title, days, hours, hourly_rate, hourly_commission, start_date, assignment_date, job_status, client_id, va_id, job_delete_ind) FROM stdin;
\.
COPY public.jobs (job_id, job_title, days, hours, hourly_rate, hourly_commission, start_date, assignment_date, job_status, client_id, va_id, job_delete_ind) FROM '$$PATH$$/4905.dat';

--
-- Data for Name: jobs_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs_skills (job_skill_id, job_id, skill_id) FROM stdin;
\.
COPY public.jobs_skills (job_skill_id, job_id, skill_id) FROM '$$PATH$$/4913.dat';

--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (skill_id, skill_m, skill_description, skill_delete_ind) FROM stdin;
\.
COPY public.skills (skill_id, skill_m, skill_description, skill_delete_ind) FROM '$$PATH$$/4907.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_name, user_password, user_modified_on, user_delete_ind) FROM stdin;
\.
COPY public.users (user_name, user_password, user_modified_on, user_delete_ind) FROM '$$PATH$$/4901.dat';

--
-- Data for Name: va; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.va (va_id, va_first_m, va_last_m, va_email, va_address, date_hired, va_status, va_delete_ind) FROM stdin;
\.
COPY public.va (va_id, va_first_m, va_last_m, va_email, va_address, date_hired, va_status, va_delete_ind) FROM '$$PATH$$/4909.dat';

--
-- Data for Name: va_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.va_skills (va_skills_id, va_id, skill_id) FROM stdin;
\.
COPY public.va_skills (va_skills_id, va_id, skill_id) FROM '$$PATH$$/4911.dat';

--
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_client_id_seq', 12, false);


--
-- Name: jobs_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_job_id_seq', 27, false);


--
-- Name: jobs_skills_job_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_skills_job_skill_id_seq', 259, true);


--
-- Name: skills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_skill_id_seq', 15, false);


--
-- Name: va_skills_va_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.va_skills_va_skills_id_seq', 92, true);


--
-- Name: va_va_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.va_va_id_seq', 22, false);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: jobs_skills jobs_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_pkey PRIMARY KEY (job_skill_id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: va va_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va
    ADD CONSTRAINT va_pkey PRIMARY KEY (va_id);


--
-- Name: va_skills va_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_pkey PRIMARY KEY (va_skills_id);


--
-- Name: jobs jobs_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id);


--
-- Name: jobs_skills jobs_skills_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- Name: jobs_skills jobs_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_skills
    ADD CONSTRAINT jobs_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id);


--
-- Name: jobs jobs_va_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_va_id_fkey FOREIGN KEY (va_id) REFERENCES public.va(va_id);


--
-- Name: va_skills va_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id);


--
-- Name: va_skills va_skills_va_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.va_skills
    ADD CONSTRAINT va_skills_va_id_fkey FOREIGN KEY (va_id) REFERENCES public.va(va_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             