--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

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

--
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'landed',
    'cancelled',
    'diverted'
);


ALTER TYPE public.status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airlines (
    airline_id uuid NOT NULL,
    iata_code character varying NOT NULL,
    airline character varying NOT NULL
);


ALTER TABLE public.airlines OWNER TO postgres;

--
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    airport_id uuid NOT NULL,
    iata_code character varying NOT NULL,
    airport character varying NOT NULL,
    city character varying NOT NULL,
    state character varying NOT NULL,
    country character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flights (
    flight_id uuid NOT NULL,
    airline_id uuid,
    origin_airport_id uuid,
    destination_airport_id uuid,
    distance integer NOT NULL,
    scheduled_departure timestamp without time zone NOT NULL,
    scheduled_arrival timestamp without time zone NOT NULL,
    arrival_delay integer NOT NULL,
    status public.status NOT NULL,
    cancellation_reason character varying,
    air_system_delay boolean NOT NULL,
    security_delay boolean NOT NULL,
    airline_delay boolean NOT NULL,
    late_aircraft_delay boolean NOT NULL,
    weather_delay boolean NOT NULL
);


ALTER TABLE public.flights OWNER TO postgres;

--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlines (airline_id, iata_code, airline) FROM stdin;
9ac91524-737f-47e4-bb51-365a3c0535a8	UA	United Air Lines Inc.
56e4aa48-75b2-4da0-9fe0-033ef7008a91	AA	American Airlines Inc.
c2e13e71-01b7-44fe-b091-5f86ae80c023	US	US Airways Inc.
9e7e7cfc-68ae-4c4f-9721-407f71db5155	F9	Frontier Airlines Inc.
e222dd9f-9312-401d-9ed1-9e3f253fd6a8	B6	JetBlue Airways
7d1ea82a-b408-4a79-afe6-313f0e01cc09	OO	Skywest Airlines Inc.
94d86c52-5799-48f5-8693-1aea5b7c4d48	AS	Alaska Airlines Inc.
b4eb8c9f-187e-4394-9bd3-ce5c6a153231	NK	Spirit Air Lines
44d688b1-5f1b-41c3-b767-1526eca22fa7	WN	Southwest Airlines Co.
c2c012a9-4bdf-4b04-ac83-714fbc93b289	DL	Delta Air Lines Inc.
bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	EV	Atlantic Southeast Airlines
7cb1d701-00b9-49bc-809d-c64d6ccf0c29	HA	Hawaiian Airlines Inc.
ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	MQ	American Eagle Airlines Inc.
c76d7bf1-637b-40bf-a13b-750d4b75362d	VX	Virgin America
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (airport_id, iata_code, airport, city, state, country, latitude, longitude) FROM stdin;
0d1af828-7db4-4470-b1ff-ee9d4865dc70	ABE	Lehigh Valley International Airport	Allentown	PA	USA	40.65236	-75.4404
e1154404-f9a9-42ff-8bf9-4b6a19e0d580	ABI	Abilene Regional Airport	Abilene	TX	USA	32.41132	-99.6819
479c7b82-dae0-4b8f-9885-63acb8c8ac3d	ABQ	Albuquerque International Sunport	Albuquerque	NM	USA	35.04022	-106.60919
0c1f2ca4-72c8-4065-9b83-f69ac4ac38c3	ABR	Aberdeen Regional Airport	Aberdeen	SD	USA	45.44906	-98.42183
39920618-dee9-47c7-9542-b2df2e7b447d	ABY	Southwest Georgia Regional Airport	Albany	GA	USA	31.53552	-84.19447
ce4f8126-12b4-4ab5-b68c-44a7c3dd657b	ACK	Nantucket Memorial Airport	Nantucket	MA	USA	41.25305	-70.06018
921346ea-a085-494e-83d5-82a298dba109	ACT	Waco Regional Airport	Waco	TX	USA	31.61129	-97.23052
190fcb81-39c3-437e-94ec-a0889cc47e9d	ACV	Arcata Airport	Arcata/Eureka	CA	USA	40.97812	-124.10862
f12c8f72-384b-4d1c-9e3a-c032b411fa40	ACY	Atlantic City International Airport	Atlantic City	NJ	USA	39.45758	-74.57717
6cce2429-b4f3-4cab-bf26-659fc0b04ec6	ADK	Adak Airport	Adak	AK	USA	51.87796	-176.64603
1216be34-c700-415f-a5f9-a3a93a7a8a71	ADQ	Kodiak Airport	Kodiak	AK	USA	57.74997	-152.49386
3ff1b391-99b4-4af9-92a6-594d83192846	AEX	Alexandria International Airport	Alexandria	LA	USA	31.32737	-92.54856
1fb7f6ea-48be-45a3-8c9d-1cf87e4be3bd	AGS	Augusta Regional Airport (Bush Field)	Augusta	GA	USA	33.36996	-81.9645
36788b76-2141-4a3f-a7ec-816bb4a3d4c3	AKN	King Salmon Airport	King Salmon	AK	USA	58.6768	-156.64922
b523dd4a-95db-4639-af15-d888e967c3fc	ALB	Albany International Airport	Albany	NY	USA	42.74812	-73.80298
4dddb86a-454d-4b06-aa94-a1b9d00adbcd	ALO	Waterloo Regional Airport	Waterloo	IA	USA	42.55708	-92.40034
765ab0c4-cdb9-4cc4-9a53-6d69a669c90d	AMA	Rick Husband Amarillo International Airport	Amarillo	TX	USA	35.21937	-101.70593
de24023d-db7f-4fcd-875b-edfcff42b5f5	ANC	Ted Stevens Anchorage International Airport	Anchorage	AK	USA	61.17432	-149.99619
59e12356-5210-44bd-94f7-311bab17305b	APN	Alpena County Regional Airport	Alpena	MI	USA	45.07807	-83.56029
27d09749-8c3e-4532-8df5-df18743098a9	ASE	Aspen-Pitkin County Airport	Aspen	CO	USA	39.22316	-106.86885
1a743a77-55e0-4c53-ab16-765667e2cc37	ATL	Hartsfield-Jackson Atlanta International Airport	Atlanta	GA	USA	33.64044	-84.42694
688d65c7-52b5-4d29-9fa9-f9b5cdd52ecf	ATW	Appleton International Airport	Appleton	WI	USA	44.25741	-88.51948
0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	AUS	Austin-Bergstrom International Airport	Austin	TX	USA	30.19453	-97.66987
5c65c9ef-e1c5-4e0c-b98e-68735a7a8731	AVL	Asheville Regional Airport	Asheville	NC	USA	35.43619	-82.54181
6e974fea-b47f-4916-bfea-a32bce6f1f67	AVP	Wilkes-Barre/Scranton International Airport	Wilkes-Barre/Scranton	PA	USA	41.33815	-75.72427
1bdb7eb1-50ff-443f-900a-a5a02a62ef7a	AZO	Kalamazoo/Battle Creek International Airport	Kalamazoo	MI	USA	42.23488	-85.55206
9e6d748c-0887-402d-9c56-75882767f180	BDL	Bradley International Airport	Windsor Locks	CT	USA	41.93887	-72.68323
75762a50-12ec-4222-83d4-d8af7f125e9a	BET	Bethel Airport	Bethel	AK	USA	60.77978	-161.838
23dd7561-2551-4bf1-9274-493b57d1bbfe	BFL	Meadows Field	Bakersfield	CA	USA	35.4336	-119.05677
a5bf7b8e-a710-4342-b4c9-593da824baf7	BGM	Greater Binghamton Airport	Binghamton	NY	USA	42.20848	-75.97961
b5519062-1b6a-446b-9d0a-ce38e5b31dae	BGR	Bangor International Airport	Bangor	ME	USA	44.80744	-68.82814
f07d6f3c-7656-45c6-8f0f-b23feea8be32	BHM	Birmingham-Shuttlesworth International Airport	Birmingham	AL	USA	33.56294	-86.75355
cb834b77-8b60-485a-9aa0-0bc7c067c3e2	BIL	Billings Logan International Airport	Billings	MT	USA	45.80766	-108.54286
ed52e6fd-070d-458f-8f88-76e3835e2f83	BIS	Bismarck Municipal Airport	Bismarck	ND	USA	46.77411	-100.74672
6ed50361-d18c-4f8f-8e3f-47e9fdfe5ba1	BJI	Bemidji Regional Airport	Bemidji	MN	USA	47.50942	-94.93372
24bccc02-ba34-4371-94a1-093c6ca19197	BLI	Bellingham International Airport	Bellingham	WA	USA	48.79275	-122.53753
c1fce84d-810d-4f26-95e6-47f499ff8647	BMI	Central Illinois Regional Airport at Bloomington-Normal	Bloomington	IL	USA	40.47799	-88.91595
67e7149b-55f5-43f7-93f2-87921e81cb81	BNA	Nashville International Airport	Nashville	TN	USA	36.12448	-86.67818
a91dbca0-d0c8-4846-9589-cb86ff1a3874	BOI	Boise Airport (Boise Air Terminal)	Boise	ID	USA	43.56444	-116.22278
30074e54-879b-4fbe-8a42-9b6d1690cec3	BOS	Gen. Edward Lawrence Logan International Airport	Boston	MA	USA	42.36435	-71.00518
9e74d204-1f26-4a59-b9ca-208f2c579075	BPT	Jack Brooks Regional Airport (Southeast Texas Regional)	Beaumont/Port Arthur	TX	USA	29.95083	-94.02069
90bac932-a661-4e4e-b465-bcdbf93f4c02	BQK	Brunswick Golden Isles Airport	Brunswick	GA	USA	31.25903	-81.46631
8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	BQN	Rafael Hernández Airport	Aguadilla	PR	USA	18.49486	-67.12944
429a6721-5ce1-481e-845d-03a6cc7d4003	BRD	Brainerd Lakes Regional Airport	Brainerd	MN	USA	46.39786	-94.13723
720a0e7a-2938-4e87-9ba7-bc3d3d8aaaff	BRO	Brownsville/South Padre Island International Airport	Brownsville	TX	USA	25.90683	-97.42586
1d2ce5ea-df15-46df-84d4-38521d26ce66	BRW	Wiley Post-Will Rogers Memorial Airport	Barrow	AK	USA	71.28545	-156.766
0a9bde8d-a963-4c82-9cf3-4b759f428b31	BTM	Bert Mooney Airport	Butte	MT	USA	45.9548	-112.49746
84e0f5f0-0776-47b2-8cf0-ffe211e02bac	BTR	Baton Rouge Metropolitan Airport	Baton Rouge	LA	USA	30.53316	-91.14963
7fadfa3c-e8a6-4511-8dea-609c2868e8fe	BTV	Burlington International Airport	Burlington	VT	USA	44.473	-73.15031
c0da7786-cefb-463a-a6d5-57260bfb6019	BUF	Buffalo Niagara International Airport	Buffalo	NY	USA	42.94052	-78.73217
aa136adc-9c55-40c2-9758-93042a0a26ac	BUR	Bob Hope Airport (Hollywood Burbank Airport)	Burbank	CA	USA	34.20062	-118.3585
566b6db6-eefa-482b-a38b-9842c22c0136	BWI	Baltimore-Washington International Airport	Baltimore	MD	USA	39.1754	-76.6682
98bddb1c-570d-4ef0-8172-289c12db59d1	BZN	Bozeman Yellowstone International Airport (Gallatin Field Airport)	Bozeman	MT	USA	45.7769	-111.15301
e6926d02-6676-405e-8dbc-fea02edfb321	CAE	Columbia Metropolitan Airport	Columbia	SC	USA	33.93884	-81.11954
8d29330d-f93e-4f00-a95c-8c5463e2bd4a	CAK	Akron-Canton Regional Airport	Akron	OH	USA	40.91631	-81.44247
020a983a-8a74-4aa3-8039-85cc0bcfbf25	CDC	Cedar City Regional Airport	Cedar City	UT	USA	37.70097	-113.09858
9e07aef1-4c69-4211-bbf2-7b4fb595b4b6	CDV	Merle K. (Mudhole) Smith Airport	Cordova	AK	USA	60.49183	-145.47765
2aa004b9-fef3-4e2a-8546-02c73b28fe70	CEC	Del Norte County Airport (Jack McNamara Field)	Crescent City	CA	USA	41.78016	-124.23653
0622b581-5b63-4a28-9a24-8b17e6ebc775	CHA	Chattanooga Metropolitan Airport (Lovell Field)	Chattanooga	TN	USA	35.03527	-85.20379
943fd2a9-e75a-4b6e-9ad1-fe99c24c6ac2	CHO	Charlottesville-Albemarle Airport	Charlottesville	VA	USA	38.13864	-78.45286
c53ed55a-6259-43dd-a050-6288e2e5a045	CHS	Charleston International Airport/Charleston AFB	Charleston	SC	USA	32.89865	-80.04051
05932e22-3166-458e-b741-1ca107a3cb29	CID	The Eastern Iowa Airport	Cedar Rapids	IA	USA	41.88459	-91.71087
ddf91df2-f024-47e6-a94c-bd42591a92f9	CIU	Chippewa County International Airport	Sault Ste. Marie	MI	USA	46.25075	-84.47239
71ddb136-cb48-4319-a56b-1e6eb01de1c1	CLD	McClellan-Palomar Airport	San Diego	CA	USA	33.12723	-117.27873
b37300fc-b095-4e23-b471-de894da310f9	CLE	Cleveland Hopkins International Airport	Cleveland	OH	USA	41.41089	-81.8494
40a00d0c-5d52-4237-90ad-fafef48deb0b	CLL	Easterwood Airport	College Station	TX	USA	30.58859	-96.36382
2e658ce1-8fd8-4a01-bc38-e3b47a61348d	CLT	Charlotte Douglas International Airport	Charlotte	NC	USA	35.21401	-80.94313
83d464c6-d4f4-4d26-b638-139e1f71139e	CMH	Port Columbus International Airport	Columbus	OH	USA	39.99799	-82.89188
51077fb2-296f-4eab-8f66-e6b2e4fca641	CMI	University of Illinois - Willard Airport	Champaign/Urbana	IL	USA	40.03925	-88.27806
822b29b7-32f8-45ab-a84a-41efbbfbc0d3	CMX	Houghton County Memorial Airport	Hancock	MI	USA	47.16842	-88.48906
895f8b2b-b344-403f-accd-c0e0b59f75a2	CNY	Canyonlands Field	Moab	UT	USA	38.75496	-109.75484
b47ce9f7-6489-4c48-a03e-52240d45235d	COD	Yellowstone Regional Airport	Cody	WY	USA	44.52019	-109.0238
4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	COS	City of Colorado Springs Municipal Airport	Colorado Springs	CO	USA	38.80581	-104.70025
745168c1-c6c5-415d-8a5f-31d97ab927b1	COU	Columbia Regional Airport	Columbia	MO	USA	38.81809	-92.21963
74add686-3a76-4238-bbcf-52a969a17dad	CPR	Natrona County International Airport	Casper	WY	USA	42.90836	-106.46447
0f9bb6c9-7437-4357-88ce-54353e6bf6a6	CRP	Corpus Christi International Airport	Corpus Christi	TX	USA	27.77036	-97.50122
db226aae-aea8-4243-b3fc-fc51491f69de	CRW	Yeager Airport	Charleston	WV	USA	38.37315	-81.59319
93c05655-d35b-46c0-921a-8a0303d91f16	CSG	Columbus Metropolitan Airport	Columbus	GA	USA	32.51633	-84.93886
93b4c991-3f50-4236-996c-4cebe0f962d3	CVG	Cincinnati/Northern Kentucky International Airport	Covington	KY	USA	39.04614	-84.66217
d1b1cd44-c082-4d96-9eef-1a7f77806293	CWA	Central Wisconsin Airport	Mosinee	WI	USA	44.77762	-89.66678
51037b5a-ec1e-4298-9a63-82335a8be6d0	DAB	Daytona Beach International Airport	Daytona Beach	FL	USA	29.17992	-81.05806
b8d5f60e-15c0-46d5-8a3d-9dbe30229439	DAL	Dallas Love Field	Dallas	TX	USA	32.84711	-96.85177
417dfc63-b559-48bb-afb9-5e6aeb78695f	DAY	James M. Cox Dayton International Airport	Dayton	OH	USA	39.90238	-84.21938
1f7edced-302c-4db4-a322-74d3e2194aa8	DBQ	Dubuque Regional Airport	Dubuque	IA	USA	42.40296	-90.70917
a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	DCA	Ronald Reagan Washington National Airport	Arlington	VA	USA	38.85208	-77.03772
39184e8c-153c-4f15-83b7-520dfc412682	DEN	Denver International Airport	Denver	CO	USA	39.85841	-104.667
e5772f8f-21ce-4944-bcd9-0123a312a113	DFW	Dallas/Fort Worth International Airport	Dallas-Fort Worth	TX	USA	32.89595	-97.0372
610880d6-eaab-4056-b0af-f2dbf9698faf	DHN	Dothan Regional Airport	Dothan	AL	USA	31.32134	-85.44963
c9419638-4638-4d58-94f2-fbaf20043989	DIK	Dickinson Theodore Roosevelt Regional Airport	Dickinson	ND	USA	46.79739	-102.80195
ef6801c3-884d-40b9-aed8-ffb2acadd655	DLG	Dillingham Airport	Dillingham	AK	USA	59.04541	-158.50334
8da69c37-5a62-48c8-a7fd-815036e76ae4	DLH	Duluth International Airport	Duluth	MN	USA	46.84209	-92.19365
16b0b050-f3b0-4368-81ff-0c483cdd7b06	DRO	Durango-La Plata County Airport	Durango	CO	USA	37.15152	-107.75377
c9e7dcc1-795a-4b7a-a528-07064fece36f	DSM	Des Moines International Airport	Des Moines	IA	USA	41.53493	-93.66068
b334592c-f6aa-405f-b7a2-67d942e3b8ad	DTW	Detroit Metropolitan Airport	Detroit	MI	USA	42.21206	-83.34884
99fcc290-1563-4605-bab3-241608a5bb66	DVL	Devils Lake Regional Airport	Devils Lake	ND	USA	48.11425	-98.90878
d2f95330-9e45-4c0d-8dba-ca6b8057bd65	EAU	Chippewa Valley Regional Airport	Eau Claire	WI	USA	44.86526	-91.48507
0c104c2f-94c0-4f91-add7-41bf066bb1a2	ECP	Northwest Florida Beaches International Airport	Panama City	FL	USA	30.355631972483877	-85.79953485767247
731e4ae2-e24c-4101-87e0-0f24a45d1188	EGE	Eagle County Regional Airport	Eagle	CO	USA	39.64257	-106.9177
92f97891-a230-46be-946f-158d7b257d73	EKO	Elko Regional Airport	Elko	NV	USA	40.82493	-115.7917
04f2dd97-06f7-4381-a6c7-635c8dd3fca8	ELM	Elmira/Corning Regional Airport	Elmira	NY	USA	42.15991	-76.89144
31906092-d1e5-418a-9ec2-b5aa9b819a7f	ELP	El Paso International Airport	El Paso	TX	USA	31.80667	-106.37781
b9e79daa-2e5b-4acd-a66f-23b1dd4dcace	ERI	Erie International Airport	Erie	PA	USA	42.08202	-80.17622
652009ea-03c2-464a-b555-62282dd1a8e1	ESC	Delta County Airport	Escanaba	MI	USA	45.72267	-87.09373
a06592ee-27b6-49b6-baf2-2ba176d3ea9c	EUG	Eugene Airport (Mahlon Sweet Field)	Eugene	OR	USA	44.12326	-123.21869
f0448a72-1f75-4716-8a31-c686c32214e7	EVV	Evansville Regional Airport	Evansville	IN	USA	38.03799	-87.53063
937b1e28-1364-482d-a5bd-7bafe7aa7210	EWN	Coastal Carolina Regional Airport (Craven County Regional)	New Bern	NC	USA	35.07297	-77.04294
9b0fc777-7255-49f4-9d33-b1d5500e3298	EWR	Newark Liberty International Airport	Newark	NJ	USA	40.6925	-74.16866
cbb79e81-5e51-41e1-af7a-8bc0c31ec1eb	EYW	Key West International Airport	Key West	FL	USA	24.55611	-81.75956
859644b5-0093-48fd-b43a-cdcf7efa06fb	FAI	Fairbanks International Airport	Fairbanks	AK	USA	64.81368	-147.85967
20a64773-c733-4a46-b546-488d01d3da98	FAR	Hector International Airport	Fargo	ND	USA	46.91935	-96.81499
1c676ed7-9306-4850-8809-0ebfe0c59de9	FAT	Fresno Yosemite International Airport	Fresno	CA	USA	36.77619	-119.71814
c359a018-3bf6-40d3-b3d9-a9039a4c610f	FAY	Fayetteville Regional Airport	Fayetteville	NC	USA	34.99147	-78.88
462d4294-65c7-4690-877b-a36affd34fba	FCA	Glacier Park International Airport	Kalispell	MT	USA	48.3114	-114.25507
924c09c2-086f-4779-b652-3378100d8e15	FLG	Flagstaff Pulliam Airport	Flagstaff	AZ	USA	35.13845	-111.67122
b0bacb84-e58a-492c-a93a-0cd54194c0b1	FLL	Fort Lauderdale-Hollywood International Airport	Ft. Lauderdale	FL	USA	26.07258	-80.15275
4ba86470-66e4-4103-b441-248d1b0edcdc	FNT	Bishop International Airport	Flint	MI	USA	42.9655	-83.74346
32b91b66-a0d0-422e-9ed2-35b540ac687f	FSD	Sioux Falls Regional Airport	Sioux Falls	SD	USA	43.58135	-96.7417
aae0a2f1-7573-42fe-a860-02c2f57f7d0e	FSM	Fort Smith Regional Airport	Fort Smith	AR	USA	35.33659	-94.36744
0dea4eb5-4bec-4fc2-839a-68068c4a59b5	FWA	Fort Wayne International Airport	Fort Wayne	IN	USA	40.97847	-85.19515
1723b1fc-3769-431f-95e6-be67c2e70497	GCC	Gillette-Campbell County Airport	Gillette	WY	USA	44.3489	-105.53936
0f5ac7dc-5e29-4cca-aa2f-051ace5170ab	GCK	Garden City Regional Airport	Garden City	KS	USA	37.92752	-100.72441
d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	GEG	Spokane International Airport	Spokane	WA	USA	47.61986	-117.53384
22bd2373-7003-4276-8de1-540eb64e15e4	GFK	Grand Forks International Airport	Grand Forks	ND	USA	47.94926	-97.17611
70ff9440-5984-46ae-a286-833e40bc3cc9	GGG	East Texas Regional Airport	Longview	TX	USA	32.38486	-94.71171
679f0a0d-7f71-483b-ab1d-9505845b0389	GJT	Grand Junction Regional Airport (Walker Field)	Grand Junction	CO	USA	39.12241	-108.52673
64ed75de-16f0-44f9-aa77-8efdadd75a02	GNV	Gainesville Regional Airport	Gainesville	FL	USA	29.69006	-82.27178
b55b8136-9a81-4e22-b2b8-b54ea6695d72	GPT	Gulfport-Biloxi International Airport	Gulfport-Biloxi	MS	USA	30.40728	-89.07009
540e52ce-d36a-4ac1-8400-480bf9b3f095	GRB	Green Bay-Austin Straubel International Airport	Green Bay	WI	USA	44.48507	-88.12959
2b4fcd88-145c-4b4b-a2d0-c2b5f8d82e49	GRI	Central Nebraska Regional Airport	Grand Island	NE	USA	40.96747	-98.30861
397b91ae-7c04-4bd2-9463-fc5b2b278c4b	GRK	Killeen-Fort Hood Regional Airport	Killeen	TX	USA	31.0649	-97.8278
9c814fe7-98e4-4170-9b1c-abe28b10d5ba	GRR	Gerald R. Ford International Airport	Grand Rapids	MI	USA	42.88082	-85.52277
0b15631f-d083-4b76-8d70-75ab7dd2940c	GSO	Piedmont Triad International Airport	Greensboro	NC	USA	36.09775	-79.9373
52ca9d97-f51a-4ed5-9e33-d81ff6752a5a	GSP	Greenville-Spartanburg International Airport	Greer	SC	USA	34.89567	-82.21886
a1988f3b-04cd-4d32-bf92-0aa576e33f92	GST	Gustavus Airport	Gustavus	AK	USA	58.42438	-135.70738
70840ecc-bcff-4e0b-bffa-49d4088679cf	GTF	Great Falls International Airport	Great Falls	MT	USA	47.482	-111.37069
191db264-b295-469b-b04e-f1c91632250f	GTR	Golden Triangle Regional Airport	Columbus-Starkville-West Point	MS	USA	33.45033	-88.59137
c5f11208-41b3-4eaf-9e99-2780f49cea86	GUC	Gunnison-Crested Butte Regional Airport	Gunnison	CO	USA	38.53396	-106.93318
8df62bf2-1c69-4607-a2f6-828c8a8974a2	GUM	Guam International Airport	Agana	GU	USA	13.48345	-144.79598
44be13b9-69d8-4bec-b0c0-e4af26e6ccc7	HDN	Yampa Valley Airport (Yampa Valley Regional)	Hayden	CO	USA	40.48118	-107.21766
aaf9469b-d7a9-4aac-b033-d598e4527232	HIB	Range Regional Airport (Chisholm-Hibbing Airport)	Hibbing	MN	USA	47.3866	-92.83899
8730d59f-9661-4df5-aaaf-5bc5caf97dad	HLN	Helena Regional Airport	Helena	MT	USA	46.60682	-111.98275
f1e978f1-35da-4540-827c-2817efca7f67	HNL	Honolulu International Airport	Honolulu	HI	USA	21.31869	-157.92241
4da96129-bb33-4b93-ba2e-8ea1b7d96a3f	HOB	Lea County Regional Airport	Hobbs	NM	USA	32.68753	-103.21703
30b529a2-d575-423d-908a-2c2f004c560c	HOU	William P. Hobby Airport	Houston	TX	USA	29.64542	-95.27889
9ee36afd-3a79-45a2-a7f4-e20c72958a90	HPN	Westchester County Airport	White Plains	NY	USA	41.06696	-73.70757
fafa7414-d083-403a-a745-48abdf131a4c	HRL	Valley International Airport	Harlingen	TX	USA	26.22851	-97.65439
911ef503-1dd7-47c0-bdd0-ae7648b2fbf4	HSV	Huntsville International Airport	Huntsville	AL	USA	34.64045	-86.77311
8c6d5c3b-2cd2-4ac9-a60e-dff0a9440ee8	HYA	Barnstable Municipal Airport	Hyannis	MA	USA	41.66934	-70.28036
1b29e169-2c3e-4e97-8ed6-21afbfdd2925	HYS	Hays Regional Airport	Hays	KS	USA	38.84494	-99.27403
a46aae93-4cb4-4e4a-a37f-80a2c5147f37	IAD	Washington Dulles International Airport	Chantilly	VA	USA	38.94453	-77.45581
fd5c96c8-610f-4727-9ba7-7f9b49bcbb52	IAG	Niagara Falls International Airport	Niagara Falls	NY	USA	43.10726	-78.94538
17c55660-12f7-499a-9f12-1b1e0d558d03	IAH	George Bush Intercontinental Airport	Houston	TX	USA	29.98047	-95.33972
a6a03d63-65ea-462f-bff9-f1d04c11e2fd	ICT	Wichita Dwight D. Eisenhower National Airport (Wichita Mid-Continent Airport)	Wichita	KS	USA	37.64996	-97.43305
fa7f28a1-7e68-4e6c-9726-0b0c5bc681b6	IDA	Idaho Falls Regional Airport	Idaho Falls	ID	USA	43.51456	-112.07017
41f3e2cf-bca1-4281-87a3-aeafa4a0a1b5	ILG	Wilmington Airport	Wilmington	DE	USA	39.67872	-75.60653
ad3f5aaa-de5f-47f2-a47f-fb6eeb85a811	ILM	Wilmington International Airport	Wilmington	NC	USA	34.27061	-77.90256
5549a35f-d59f-477c-8de9-752f803a3276	IMT	Ford Airport	Iron Mountain/Kingsford	MI	USA	45.81835	-88.11454
23cc1784-a84f-46af-ac01-7d2b1f2828cc	IND	Indianapolis International Airport	Indianapolis	IN	USA	39.71733	-86.29438
5b31756d-4774-4dd4-afc3-0a8afa3d5453	INL	Falls International Airport	International Falls	MN	USA	48.56619	-93.40307
512aa2f3-0c56-4419-b182-afbc5bdfc6eb	ISN	Sloulin Field International Airport	Williston	ND	USA	48.17794	-103.64235
3813ffaf-3414-4546-a786-aceaf1f29bab	ISP	Long Island MacArthur Airport	Islip	NY	USA	40.79524	-73.10021
5fb5599f-b99d-4cb8-8587-3f8259bb0707	ITH	Ithaca Tompkins Regional Airport	Ithaca	NY	USA	42.49103	-76.45844
c5970237-9d8a-46b7-a8b3-e051a8c2f06b	ITO	Hilo International Airport	Hilo	HI	USA	19.72026	-155.04847
02437781-359c-4e7d-973c-4a6c39f49b08	JAC	Jackson Hole Airport	Jackson	WY	USA	43.60732	-110.73774
dec3c374-7d0d-4aca-a519-60ce9bc79d79	JAN	Jackson-Evers International Airport	Jackson	MS	USA	32.31117	-90.07589
bb4a1f43-cd49-4548-9c40-68be992ecb81	JAX	Jacksonville International Airport	Jacksonville	FL	USA	30.49406	-81.68786
a99f7a37-e7d1-4518-9900-0a21b2faae74	JFK	John F. Kennedy International Airport (New York International Airport)	New York	NY	USA	40.63975	-73.77893
b5855000-75f1-4b3a-a84b-cebfee95bbb2	JLN	Joplin Regional Airport	Joplin	MO	USA	37.15181	-94.49827
e2db0449-baf3-4b41-a44b-c3657824079a	JMS	Jamestown Regional Airport	Jamestown	ND	USA	46.92972	-98.6782
bc4d8cbe-b5e4-4f61-af98-b8507168b1d4	JNU	Juneau International Airport	Juneau	AK	USA	58.35496	-134.57628
13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	KOA	Kona International Airport at Keahole	Kailua/Kona	HI	USA	19.73877	-156.04563
d1e4306d-d4ea-4b29-943d-2787b1c0badb	KTN	Ketchikan International Airport	Ketchikan	AK	USA	55.35557	-131.71374
d56ffc7a-af30-445d-a3b0-104c7dcc97a6	LAN	Capital Region International Airport ( Lansing Capital City)	Lansing	MI	USA	42.7787	-84.58736
1f51d41f-c8eb-4fcc-afd0-1bbf4c2db7e1	LAR	Laramie Regional Airport	Laramie	WY	USA	41.31205	-105.67499
ec27c849-ee4d-4f87-818d-5ebf2adab285	LAS	McCarran International Airport	Las Vegas	NV	USA	36.08036	-115.15233
ff245f13-d27e-4dd0-9472-1cd88206e14c	LAW	Lawton-Fort Sill Regional Airport	Lawton	OK	USA	34.56771	-98.41664
93784ecb-8e6a-4159-a7a1-a40002a5c5cc	LAX	Los Angeles International Airport	Los Angeles	CA	USA	33.94254	-118.40807
6b0b7e7f-1b6d-45d7-856e-31afd41d5dab	LBB	Lubbock Preston Smith International Airport	Lubbock	TX	USA	33.66364	-101.82278
35da2e18-a8d0-4669-bc42-78b1d793c7d1	LBE	Arnold Palmer Regional Airport	Latrobe	PA	USA	40.27594	-79.4048
ff44f5a1-ea2a-4134-b07b-dff208172754	LCH	Lake Charles Regional Airport	Lake Charles	LA	USA	30.1261	-93.2234
d40a8354-2344-4cc2-8ddf-cdf45bb3c7eb	LEX	Blue Grass Airport	Lexington	KY	USA	38.03697	-84.60539
e21456b7-9ba4-4f73-94b5-9702a1c01aea	LFT	Lafayette Regional Airport	Lafayette	LA	USA	30.20528	-91.98766
0b753b16-0eac-45df-8db5-70af8de58431	LGA	LaGuardia Airport (Marine Air Terminal)	New York	NY	USA	40.77724	-73.87261
b1cb37af-8ae5-43cb-8a89-701e233d582e	LGB	Long Beach Airport (Daugherty Field)	Long Beach	CA	USA	33.81772	-118.15161
82057082-4f10-49c4-b6da-2661f289e6b7	LIH	Lihue Airport	Lihue	HI	USA	21.97598	-159.33896
d60c22b9-7c54-4654-9094-79b67d756de4	LIT	Bill and Hillary Clinton National Airport (Adams Field)	Little Rock	AR	USA	34.7294	-92.22425
88179592-3866-42e0-b805-9979bcbe0fad	LNK	Lincoln Airport (Lincoln Municipal)	Lincoln	NE	USA	40.85097	-96.75925
f71d97bb-4c71-47c5-aca5-616b531d69ee	LRD	Laredo International Airport	Laredo	TX	USA	27.54374	-99.46154
819f3294-3930-44f5-a99b-4f80042f2a8b	LSE	La Crosse Regional Airport	La Crosse	WI	USA	43.87938	-91.25654
5583672f-8ee9-4e1d-8ccf-9ec3b59ea77f	LWS	Lewiston-Nez Perce County Airport	Lewiston	ID	USA	46.3745	-117.01539
45794771-7eea-47a1-b5ee-3de26801d071	MAF	Midland International Airport	Midland	TX	USA	31.94253	-102.20191
c6f3cb98-82f9-4bba-adc8-5b2d3dfe5739	MBS	MBS International Airport	Saginaw	MI	USA	43.53291	-84.07965
f2d678b1-8153-46e2-bf8e-aa197ce84aca	MCI	Kansas City International Airport	Kansas City	MO	USA	39.29761	-94.71391
761461d5-643f-4c65-8769-21d1ed2adc36	MCO	Orlando International Airport	Orlando	FL	USA	28.42889	-81.31603
2eb593b9-ce84-445a-8f29-43ca50011299	MDT	Harrisburg International Airport	Harrisburg	PA	USA	40.1935	-76.7634
ca72b9ab-f02d-4c7d-814d-2f3613f2d370	MDW	Chicago Midway International Airport	Chicago	IL	USA	41.78598	-87.75242
206104eb-761d-4b8b-aede-50875a9e52e5	MEI	Meridian Regional Airport	Meridian	MS	USA	32.33313	-88.75121
bbf1438c-1470-4b17-8bf3-ec578b328900	MEM	Memphis International Airport	Memphis	TN	USA	35.04242	-89.97667
31adb60d-b31f-4c27-804c-630d2782c2fd	MFE	McAllen-Miller International Airport (McAllen Miller International)	McAllen	TX	USA	26.17583	-98.23861
17c03644-1b2c-49ae-b6cd-8d0bde66f820	MFR	Rogue Valley International Airport	Medford	OR	USA	42.37423	-122.8735
0a227934-9832-4e9d-84fb-a25775ba12fb	MGM	Montgomery Regional Airport	Montgomery	AL	USA	32.30064	-86.39398
179ba040-9e0a-47d3-a863-ced12435fe1a	MHK	Manhattan Regional Airport	Manhattan	KS	USA	39.14097	-96.67083
f3b5244f-b651-4318-a086-bf0b13368c6e	MHT	Manchester-Boston Regional Airport	Manchester	NH	USA	42.93452	-71.43706
9f7ac324-dbdd-48b7-b465-3f84b98ef945	MIA	Miami International Airport	Miami	FL	USA	25.79325	-80.29056
ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	MKE	General Mitchell International Airport	Milwaukee	WI	USA	42.94722	-87.89658
53b1eaef-2b32-4865-9f29-655872016e5b	MKG	Muskegon County Airport	Muskegon	MI	USA	43.16949	-86.23822
5630d9d0-abd7-4031-803a-b1a9107d0bbe	MLB	Melbourne International Airport	Melbourne	FL	USA	28.10275	-80.64581
d32285f3-42ec-4493-8153-c9dc03905db2	MLI	Quad City International Airport	Moline	IL	USA	41.44853	-90.50754
6d2a5bb6-4c68-4b97-bae2-b0fb46c23ae0	MLU	Monroe Regional Airport	Monroe	LA	USA	32.51087	-92.03769
c7c41c2a-ed21-49e0-a96a-1d2b794c5104	MMH	Mammoth Yosemite Airport	Mammoth Lakes	CA	USA	37.62405	-118.83777
e1da04dd-24a9-4aad-9795-bebd413ea88a	MOB	Mobile Regional Airport	Mobile	AL	USA	30.69142	-88.24283
e9fa394f-420d-4bc5-a251-67558f858b3f	MOT	Minot International Airport	Minot	ND	USA	48.25938	-101.28033
2103b42e-2a74-46de-9302-968b8aafeb79	MQT	Sawyer International Airport	Marquette	MI	USA	46.35364	-87.39536
cca54640-41f3-4508-86e5-78faa9b0d4a2	MRY	Monterey Regional Airport (Monterey Peninsula Airport)	Monterey	CA	USA	36.58698	-121.84295
0db05805-32e6-4ba0-8bca-331176bc84b3	MSN	Dane County Regional Airport	Madison	WI	USA	43.13986	-89.33751
20b9da24-7eb2-4374-ba06-002f8475b1f5	MSO	Missoula International Airport	Missoula	MT	USA	46.91631	-114.09056
8efb8902-1cf4-4798-a5be-cd86f011f7ed	MSP	Minneapolis-Saint Paul International Airport	Minneapolis	MN	USA	44.88055	-93.21692
ba586dec-e3f7-416b-be7c-7036176fa2a9	MSY	Louis Armstrong New Orleans International Airport	New Orleans	LA	USA	29.99339	-90.25803
258b4d56-7b05-432a-a32d-34df9ae32c74	MTJ	Montrose Regional Airport	Montrose	CO	USA	38.50887	-107.89383
cc9bc634-ac3c-4f69-b90e-69eddbf59021	MVY	Martha's Vineyard Airport	Marthas Vineyard	MA	USA	41.39303	-70.61433
094775f5-e4e3-4fca-b88a-b5c412548bdb	MYR	Myrtle Beach International Airport	Myrtle Beach	SC	USA	33.67975	-78.92833
e23e10a4-9363-4f0b-8e90-c05fa6f58a4e	OAJ	Albert J. Ellis Airport	Jacksonville	NC	USA	34.82916	-77.61214
220d76f8-307b-4240-9335-a0ac5eb6e0b5	OAK	Oakland International Airport	Oakland	CA	USA	37.72129	-122.22072
5c89a23c-37c7-4379-b07d-e40d325ef99a	OGG	Kahului Airport	Kahului	HI	USA	20.89865	-156.43046
6c03e7bd-a5b4-4123-a449-14ec67009bab	OKC	Will Rogers World Airport	Oklahoma City	OK	USA	35.39309	-97.60073
b1062708-791a-4d09-aade-7516111fd22d	OMA	Eppley Airfield	Omaha	NE	USA	41.30252	-95.89417
f644da2d-f6b3-44b7-a536-9768e60589b0	OME	Nome Airport	Nome	AK	USA	64.5122	-165.44525
4c0796a6-84d6-43eb-8ba0-be3eb277da6d	ONT	Ontario International Airport	Ontario	CA	USA	34.056	-117.60119
962de796-50ec-403e-90e7-dd8cbf8dd135	ORD	Chicago O'Hare International Airport	Chicago	IL	USA	41.9796	-87.90446
83514dc0-7e7a-4058-a13b-ae4b8168cd27	ORF	Norfolk International Airport	Norfolk	VA	USA	36.89461	-76.20122
c4827e50-d5ea-4173-b72f-524ce920a172	ORH	Worcester Regional Airport	Worcester	MA	USA	42.26734	-71.87571
a6776f09-79c7-42bc-9bc8-21b019e66c9f	OTH	Southwest Oregon Regional Airport (North Bend Municipal)	North Bend	OR	USA	43.41714	-124.24603
b664eb7f-b715-4ccf-ac71-99d8e352cdf7	OTZ	Ralph Wien Memorial Airport	Kotzebue	AK	USA	66.88468	-162.59855
5a82c79f-b96e-40bc-92be-698bdc9ea36f	PAH	Barkley Regional Airport	Paducah	KY	USA	37.06083	-88.77375
2a6057c7-22ce-46a7-ac2b-deb4f22cf7c8	PBG	Plattsburgh International Airport	Plattsburgh	NY	USA	44.657707466818955	-73.46705576127248
55f76a81-76d7-45d4-965f-36aec15fdbb0	PBI	Palm Beach International Airport	West Palm Beach	FL	USA	26.68316	-80.09559
3dfebb03-d61c-4f82-a7bb-a84ae90638a2	PDX	Portland International Airport	Portland	OR	USA	45.58872	-122.5975
c28dbcfb-35a9-457f-918b-7197c7d57de3	PHF	Newport News/Williamsburg International Airport	Newport News	VA	USA	37.1319	-76.49299
3b85c138-79ba-401a-a5bd-82bcbfbb7813	PHL	Philadelphia International Airport	Philadelphia	PA	USA	39.87195	-75.24114
574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	PHX	Phoenix Sky Harbor International Airport	Phoenix	AZ	USA	33.43417	-112.00806
eafaffaf-f7f7-42f1-bccb-2cada8cca167	PIA	General Wayne A. Downing Peoria International Airport	Peoria	IL	USA	40.66424	-89.69331
a811dfec-18db-40c5-8e1b-ff5da24e69ff	PIB	Hattiesburg-Laurel Regional Airport	Hattiesburg-Laurel	MS	USA	31.46715	-89.33706
592aec0a-e679-4adf-91ee-6e9d56b17f1e	PIH	Pocatello Regional Airport	Pocatello	ID	USA	42.91131	-112.59586
12d5c993-ac8c-4b1f-ba44-022a0387f073	PIT	Pittsburgh International Airport	Pittsburgh	PA	USA	40.49147	-80.23287
e26808f6-bfd7-45e2-8566-a4e0fa51bd8c	PLN	Pellston Regional Airport of Emmet County	Pellston	MI	USA	45.57093	-84.79672
1c343bcf-bfcf-4b75-aa17-b17e0d7441b6	PNS	Pensacola International Airport (Pensacola Gulf Coast Regional Airport)	Pensacola	FL	USA	30.47331	-87.18744
b5fb1315-080f-4dd6-a7f7-0b1500c9672a	PPG	Pago Pago International Airport (Tafuna Airport)	Pago Pago	AS	USA	14.33102	-170.71053
02574c76-bc20-40c0-bd10-518352edbbae	PSC	Tri-Cities Airport	Pasco	WA	USA	46.26468	-119.11903
f9e1cdce-28f5-4e36-9717-71ef3c667d83	PSE	Mercedita Airport	Ponce	PR	USA	18.0083	-66.56301
6664fffa-40be-4341-a18d-e65ec19985bb	PSG	Petersburg James A. Johnson Airport	Petersburg	AK	USA	56.80165	-132.94528
0a60c4db-581b-4be4-b43a-f4aa7fd1d102	PSP	Palm Springs International Airport	Palm Springs	CA	USA	33.82922	-116.50625
cc5e3c03-de3b-4b2b-9cc1-ff6465023c1c	PUB	Pueblo Memorial Airport	Pueblo	CO	USA	38.28909	-104.49657
7a3063c0-3e91-49c7-8885-2f34ecaf14c2	PVD	Theodore Francis Green State Airport	Providence	RI	USA	41.724	-71.42822
32677614-aec3-443b-8c32-ac8adcbb5634	PWM	Portland International Jetport	Portland	ME	USA	43.64617	-70.30875
dab3127c-bcf9-4cbb-8428-2b7e4c0a2bb1	RAP	Rapid City Regional Airport	Rapid City	SD	USA	44.04532	-103.05737
39428470-63a9-400b-9cee-f850c18c1298	RDD	Redding Municipal Airport	Redding	CA	USA	40.50898	-122.2934
cf5967d7-257b-4f2f-9ca2-6ddd7d3bc0d4	RDM	Redmond Municipal Airport (Roberts Field)	Redmond	OR	USA	44.25407	-121.14996
b6768101-d32f-46b4-ae06-78293040b7b5	RDU	Raleigh-Durham International Airport	Raleigh	NC	USA	35.87764	-78.78747
dccd0302-b875-4457-90f3-c0403f48fb73	RHI	Rhinelander-Oneida County Airport	Rhinelander	WI	USA	45.63119	-89.46745
537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	RIC	Richmond International Airport	Richmond	VA	USA	37.50517	-77.31967
6f414fc3-f0b1-427d-876d-c554d5a044f0	RKS	Rock Springs-Sweetwater County Airport	Rock Springs	WY	USA	41.59422	-109.06519
04c81e3b-7621-4c9b-b978-e7123b287ce5	RNO	Reno/Tahoe International Airport	Reno	NV	USA	39.49858	-119.76806
dcf8388a-d83c-483b-a05a-3c574698df9c	ROA	Roanoke Regional Airport (Woodrum Field)	Roanoke	VA	USA	37.32547	-79.97543
dabdd0c5-e0a4-4a99-97ac-fcec7b9faf8d	ROC	Greater Rochester International Airport	Rochester	NY	USA	43.11887	-77.67238
b25b37da-f344-4cbc-a38b-7fec377535b8	ROW	Roswell International Air Center	Roswell	NM	USA	33.30156	-104.53056
2db74299-f866-4535-afa6-aef700d8146c	RST	Rochester International Airport	Rochester	MN	USA	43.90883	-92.49799
b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	RSW	Southwest Florida International Airport	Ft. Myers	FL	USA	26.53617	-81.75517
55bfac26-cfa1-420a-9ef9-70048d2326e8	SAF	Santa Fe Municipal Airport	Santa Fe	NM	USA	35.61678	-106.08814
ecaf8cd7-c24b-4278-81ad-6bed94ca123a	SAN	San Diego International Airport (Lindbergh Field)	San Diego	CA	USA	32.73356	-117.18966
f9a10132-35a1-4f1a-86e2-4a05a05b26a9	SAT	San Antonio International Airport	San Antonio	TX	USA	29.53369	-98.46978
1cd64d19-7966-446e-bcd3-a02c56e70c12	SAV	Savannah/Hilton Head International Airport	Savannah	GA	USA	32.12758	-81.20214
509444be-70dd-401a-a056-319e65f49b1c	SBA	Santa Barbara Municipal Airport (Santa Barbara Airport)	Santa Barbara	CA	USA	34.42621	-119.84037
2e0f30ff-240a-4568-84c7-c5a66caa23d0	SBN	South Bend International Airport (South Bend Regional)	South Bend	IN	USA	41.70895	-86.31847
a7946155-316f-4605-9fba-aa1573f8be86	SBP	San Luis Obispo County Regional Airport (McChesney Field)	San Luis Obispo	CA	USA	35.23706	-120.64239
f580dbd2-19b2-4133-9ce1-08876465c0d0	SCC	Deadhorse Airport (Prudhoe Bay Airport)	Deadhorse	AK	USA	70.19476	-148.46516
2d0c2680-6ca2-481d-b4cf-9600455afd6b	SCE	University Park Airport	State College	PA	USA	40.85121	-77.8463
3967b881-e3fc-4d0b-af7c-0efdd4cf93ef	SDF	Louisville International Airport (Standiford Field)	Louisville	KY	USA	38.17439	-85.736
a0259e5d-eafe-4c20-9f7a-da427e1a5c15	SEA	Seattle-Tacoma International Airport	Seattle	WA	USA	47.44898	-122.30931
482881a6-c848-490b-9565-22468e00c5d7	SFO	San Francisco International Airport	San Francisco	CA	USA	37.619	-122.37484
e5dafbf2-9081-4db8-83fb-4478c7685a70	SGF	Springfield-Branson National Airport	Springfield	MO	USA	37.24433	-93.38686
808070b9-8aac-4778-88a7-3dd332fcf8ca	SGU	St. George Regional Airport	St George	UT	USA	37.09058	-113.59306
668f0890-489b-437d-b22d-20ddfa71bdd0	SHV	Shreveport Regional Airport	Shreveport	LA	USA	32.44663	-93.8256
cecafaef-b3bc-4310-b56b-91f9d925bc92	SIT	Sitka Rocky Gutierrez Airport	Sitka	AK	USA	57.04714	-135.3616
c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	SJC	Norman Y. Mineta San José International Airport	San Jose	CA	USA	37.36186	-121.92901
eb2b576a-4b25-41a2-905f-e89b9392e040	SJT	San Angelo Regional Airport (Mathis Field)	San Angelo	TX	USA	31.35775	-100.49631
2252ada7-ca47-47a3-a183-de83d2aa3cd0	SJU	Luis Muñoz Marín International Airport	San Juan	PR	USA	18.43942	-66.00183
cea35714-d52a-40da-9949-c5ba12469150	SLC	Salt Lake City International Airport	Salt Lake City	UT	USA	40.78839	-111.97777
5731f612-6da8-41cc-a5a4-af8a8d7689bc	SMF	Sacramento International Airport	Sacramento	CA	USA	38.69542	-121.59077
627ad800-7325-4fb9-ab80-d277c6b4b8b2	SMX	Santa Maria Public Airport (Capt G. Allan Hancock Field)	Santa Maria	CA	USA	34.89925	-120.45758
6c3137e1-55f5-4a91-8ded-3918052a1cc2	SNA	John Wayne Airport (Orange County Airport)	Santa Ana	CA	USA	33.67566	-117.86822
47f69410-d216-4249-b351-b26b82b2e9b9	SPI	Abraham Lincoln Capital Airport	Springfield	IL	USA	39.84395	-89.67762
d8fedfb1-5f17-4f73-9ddd-277e814ec44f	SPS	Wichita Falls Municipal Airport/Sheppard AFB	Wichita Falls	TX	USA	33.9888	-98.49189
aefecd3d-1032-4592-a5a3-81fcc95e4065	SRQ	Sarasota-Bradenton International Airport	Sarasota	FL	USA	27.39533	-82.55411
ea064464-19c6-4c3b-962e-e0128f900e9a	STC	St. Cloud Regional Airport	St Cloud	MN	USA	45.54532	-94.05834
2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	STL	St. Louis International Airport at Lambert Field	St Louis	MO	USA	38.74769	-90.35999
4c472cb2-e4bb-4be4-8753-04dd97d37df1	STT	Cyril E. King Airport	Charlotte Amalie	VI	USA	18.33731	-64.97336
a3764581-3f70-4b2f-b592-cf0f57aa1af9	STX	Henry E. Rohlsen Airport	Christiansted	VI	USA	17.70189	-64.79856
bdf62b6a-7424-4351-91a6-52ca2aa3430c	SUN	Friedman Memorial Airport	Hailey	ID	USA	43.50484	-114.29659
d63b6ecd-d32a-44e4-8882-ffecfa6343da	SUX	Sioux Gateway Airport	Sioux City	IA	USA	42.4026	-96.38437
83781902-ac10-4b4f-8651-f176f627b1b5	SWF	Stewart International Airport	Newburgh	NY	USA	41.50409	-74.10484
b84db205-3c6f-4721-85b9-a8d8aa4f23cd	SYR	Syracuse Hancock International Airport	Syracuse	NY	USA	43.11119	-76.10631
303b54c7-2141-4e68-b3a9-e21ecf926299	TLH	Tallahassee International Airport	Tallahassee	FL	USA	30.39653	-84.35033
091bfd82-118c-40ca-bdf4-2fa418ed9817	TOL	Toledo Express Airport	Toledo	OH	USA	41.58681	-83.80783
bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	TPA	Tampa International Airport	Tampa	FL	USA	27.97547	-82.53325
8fcb39b0-1dbd-4493-932d-5bad72a73078	TRI	Tri-Cities Regional Airport	Bristol	TN	USA	36.47521	-82.40742
04c5b1df-8e47-42b7-820a-fa48713830bb	TTN	Trenton Mercer Airport	Trenton	NJ	USA	40.27669	-74.81347
09f62e52-b00e-4cbf-a66f-f1660cbf6c59	TUL	Tulsa International Airport	Tulsa	OK	USA	36.19837	-95.88824
524390fe-c1a1-4a81-a5a6-4e96d884a0ba	TUS	Tucson International Airport	Tucson	AZ	USA	32.11608	-110.94103
29212449-2911-4e0c-ae01-0c3d7a6eb0cc	TVC	Cherry Capital Airport	Traverse City	MI	USA	44.74144	-85.58224
08e27f04-a143-4d91-8e46-9fb5bf1ecf7b	TWF	Magic Valley Regional Airport (Joslin Field)	Twin Falls	ID	USA	42.4818	-114.48774
34de70f2-e58d-4605-ae23-b7359144e3a9	TXK	Texarkana Regional Airport (Webb Field)	Texarkana	AR	USA	33.45371	-93.99102
4e1d7633-0556-4357-bb38-cf74b4e0e149	TYR	Tyler Pounds Regional Airport	Tyler	TX	USA	32.35414	-95.40239
bc8617dd-fbb3-4254-99e4-8062f48a6913	TYS	McGhee Tyson Airport	Knoxville	TN	USA	35.81249	-83.99286
1d7accf4-dfef-403e-bcda-faf3db1e69b2	UST	Northeast Florida Regional Airport (St. Augustine Airport)	St. Augustine	FL	USA	29.954622367387426	-81.34288087330134
ab6324e0-647d-4204-aba2-df3f70f8c0b9	VEL	Valdez Airport	Vernal	UT	USA	40.4409	-109.50992
1fa02055-31e2-4bd2-8eeb-ce04fe1ea814	VLD	Valdosta Regional Airport	Valdosta	GA	USA	30.7825	-83.27672
1b8ab136-ce1c-4b4d-92b9-9dd5e162d2b8	VPS	Destin-Fort Walton Beach Airport/Eglin AFB	Valparaiso	FL	USA	30.48325	-86.5254
4b83a7f0-51f6-42ec-b645-c70ffc368bb8	WRG	Wrangell Airport	Wrangell	AK	USA	56.48433	-132.36982
27888e69-49d0-4f1c-9834-4a611e0617ca	WYS	Westerly State Airport	West Yellowstone	MT	USA	44.6884	-111.11764
d216ecd3-f5b9-4242-bd04-9d3533441471	XNA	Northwest Arkansas Regional Airport	Fayetteville/Springdale/Rogers	AR	USA	36.28187	-94.30681
4381e0ea-a22c-4647-9121-3b1befc41e9e	YAK	Yakutat Airport	Yakutat	AK	USA	59.50336	-139.66023
c2c9e1e2-f059-4ef3-b60d-3dfe8871736c	YUM	Yuma International Airport	Yuma	AZ	USA	32.65658	-114.60597
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flights (flight_id, airline_id, origin_airport_id, destination_airport_id, distance, scheduled_departure, scheduled_arrival, arrival_delay, status, cancellation_reason, air_system_delay, security_delay, airline_delay, late_aircraft_delay, weather_delay) FROM stdin;
ca1f9cee-ff57-4a4e-adc9-91b14cd7f54b	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 00:05:00	2015-01-01 04:30:00	-22	landed	\N	f	f	f	f	f
8ee06c33-5ae9-4a4d-8560-442ca7896de9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	55f76a81-76d7-45d4-965f-36aec15fdbb0	2330	2015-01-01 00:10:00	2015-01-01 07:50:00	-9	landed	\N	f	f	f	f	f
d9deec6c-9087-4ab9-a591-0e606ff35613	c2e13e71-01b7-44fe-b091-5f86ae80c023	482881a6-c848-490b-9565-22468e00c5d7	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	2296	2015-01-01 00:20:00	2015-01-01 08:06:00	5	landed	\N	f	f	f	f	f
dc871885-d2e5-411b-8f65-d3ed3af9d62a	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2342	2015-01-01 00:20:00	2015-01-01 08:05:00	-9	landed	\N	f	f	f	f	f
040c90c3-d2b7-4f1f-b2bd-0509453b3dfe	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	de24023d-db7f-4fcd-875b-edfcff42b5f5	1448	2015-01-01 00:25:00	2015-01-01 03:20:00	-21	landed	\N	f	f	f	f	f
21fa2170-5522-480c-b3b5-ee74eebf3dbb	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1589	2015-01-01 00:25:00	2015-01-01 06:02:00	8	landed	\N	f	f	f	f	f
272007e5-ef71-477b-a19d-1ab0fd1a34b7	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	ec27c849-ee4d-4f87-818d-5ebf2adab285	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1299	2015-01-01 00:25:00	2015-01-01 05:26:00	-17	landed	\N	f	f	f	f	f
f9ba23df-d181-4fa0-98a5-1a71a5e95562	c2e13e71-01b7-44fe-b091-5f86ae80c023	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	2125	2015-01-01 00:30:00	2015-01-01 08:03:00	-10	landed	\N	f	f	f	f	f
452a0f9c-224a-41e1-ad49-3c5099d6cf53	56e4aa48-75b2-4da0-9fe0-033ef7008a91	482881a6-c848-490b-9565-22468e00c5d7	e5772f8f-21ce-4944-bcd9-0123a312a113	1464	2015-01-01 00:30:00	2015-01-01 05:45:00	-13	landed	\N	f	f	f	f	f
e66decdd-38ad-4316-9afa-718d5d0f17a4	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ec27c849-ee4d-4f87-818d-5ebf2adab285	1a743a77-55e0-4c53-ab16-765667e2cc37	1747	2015-01-01 00:30:00	2015-01-01 07:11:00	-15	landed	\N	f	f	f	f	f
2b7d57b4-6dd7-4576-90ac-04c8342d0ced	c2c012a9-4bdf-4b04-ac83-714fbc93b289	39184e8c-153c-4f15-83b7-520dfc412682	1a743a77-55e0-4c53-ab16-765667e2cc37	1199	2015-01-01 00:30:00	2015-01-01 05:23:00	-30	landed	\N	f	f	f	f	f
0e7cbce4-414b-45cb-9d4c-7631bef34541	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ec27c849-ee4d-4f87-818d-5ebf2adab285	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2174	2015-01-01 00:35:00	2015-01-01 08:03:00	-10	landed	\N	f	f	f	f	f
e4639470-5c1e-4c35-9965-95bf857e8ef6	c2c012a9-4bdf-4b04-ac83-714fbc93b289	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1535	2015-01-01 00:35:00	2015-01-01 06:09:00	-4	landed	\N	f	f	f	f	f
9ac59a56-0c90-4849-a684-2a1035254ec6	c2c012a9-4bdf-4b04-ac83-714fbc93b289	cea35714-d52a-40da-9949-c5ba12469150	1a743a77-55e0-4c53-ab16-765667e2cc37	1590	2015-01-01 00:40:00	2015-01-01 06:15:00	-22	landed	\N	f	f	f	f	f
51b186df-db23-416e-bb67-0b01944fc485	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1399	2015-01-01 00:40:00	2015-01-01 05:49:00	8	landed	\N	f	f	f	f	f
0c4564fe-002b-4457-be7e-31f9073e2826	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 00:45:00	2015-01-01 05:09:00	-14	landed	\N	f	f	f	f	f
66244786-621a-451c-95d0-20fc3b883a57	c2c012a9-4bdf-4b04-ac83-714fbc93b289	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 00:45:00	2015-01-01 05:15:00	-24	landed	\N	f	f	f	f	f
b2435f16-1e56-47cd-9590-1ac18bc7a447	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	17c55660-12f7-499a-9f12-1b1e0d558d03	1635	2015-01-01 00:48:00	2015-01-01 06:26:00	-7	landed	\N	f	f	f	f	f
d24ff4f1-1e36-451d-96f8-fedbeda709bd	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	1542	2015-01-01 00:50:00	2015-01-01 05:25:00	-18	landed	\N	f	f	f	f	f
0b1ad64f-326b-4c8a-87a1-a8cd21b7eb34	c2c012a9-4bdf-4b04-ac83-714fbc93b289	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1426	2015-01-01 00:50:00	2015-01-01 06:03:00	-12	landed	\N	f	f	f	f	f
76a70e11-ff08-49a3-ba19-c16e9098cde0	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	ec27c849-ee4d-4f87-818d-5ebf2adab285	f2d678b1-8153-46e2-bf8e-aa197ce84aca	1139	2015-01-01 00:55:00	2015-01-01 05:37:00	6	landed	\N	f	f	f	f	f
77979437-2ae5-4d7b-8882-bd076f3a9ebd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2724	2015-01-01 01:00:00	2015-01-01 09:38:00	1	landed	\N	f	f	f	f	f
f3d24141-ab9a-40d2-9efe-44ae6453bacb	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	ec27c849-ee4d-4f87-818d-5ebf2adab285	e5772f8f-21ce-4944-bcd9-0123a312a113	1055	2015-01-01 01:03:00	2015-01-01 05:30:00	-1	landed	\N	f	f	f	f	f
e57c0300-d3eb-4c1d-b82c-a6ae8c1a946c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2342	2015-01-01 01:05:00	2015-01-01 08:51:00	-12	landed	\N	f	f	f	f	f
91cac7a8-441f-48a8-9132-30866a2c03ae	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ec27c849-ee4d-4f87-818d-5ebf2adab285	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1299	2015-01-01 01:05:00	2015-01-01 06:08:00	-23	landed	\N	f	f	f	f	f
81af2e36-7123-49f5-9d30-c98a539e7257	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	17c55660-12f7-499a-9f12-1b1e0d558d03	1379	2015-01-01 01:15:00	2015-01-01 06:18:00	-11	landed	\N	f	f	f	f	f
7b2c4985-9d1d-42bd-9d70-c03b98bf1b7f	94d86c52-5799-48f5-8693-1aea5b7c4d48	859644b5-0093-48fd-b43a-cdcf7efa06fb	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1533	2015-01-01 01:15:00	2015-01-01 05:48:00	-3	landed	\N	f	f	f	f	f
88ef5bbb-ef0b-4adc-93a2-10dbcb7e289f	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	8efb8902-1cf4-4798-a5be-cd86f011f7ed	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1487	2015-01-01 01:15:00	2015-01-01 05:42:00	25	landed	\N	t	f	f	f	f
948e7fbf-d944-44d1-b5bb-c80351b4f0fb	c2e13e71-01b7-44fe-b091-5f86ae80c023	ec27c849-ee4d-4f87-818d-5ebf2adab285	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	1916	2015-01-01 01:20:00	2015-01-01 08:25:00	-31	landed	\N	f	f	f	f	f
91832334-9845-4de5-9183-b4d8e7677bba	56e4aa48-75b2-4da0-9fe0-033ef7008a91	39184e8c-153c-4f15-83b7-520dfc412682	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1709	2015-01-01 01:20:00	2015-01-01 07:07:00	2	landed	\N	f	f	f	f	f
599dd083-985f-4919-9df7-5868babf4373	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	962de796-50ec-403e-90e7-dd8cbf8dd135	1440	2015-01-01 01:25:00	2015-01-01 05:49:00	43	landed	\N	t	f	f	f	f
a691e3e6-16fb-4439-a986-10f48c7d1f34	56e4aa48-75b2-4da0-9fe0-033ef7008a91	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1972	2015-01-01 01:27:00	2015-01-01 07:26:00	-16	landed	\N	f	f	f	f	f
dd2d24ed-94c7-45e3-ae82-557937809109	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 01:35:00	2015-01-01 06:00:00	0	cancelled	A	f	f	f	f	f
d97ee647-729f-4021-a754-be84a8545044	c2c012a9-4bdf-4b04-ac83-714fbc93b289	cea35714-d52a-40da-9949-c5ba12469150	1a743a77-55e0-4c53-ab16-765667e2cc37	1590	2015-01-01 01:40:00	2015-01-01 07:15:00	10	landed	\N	f	f	f	f	f
4cfdda0b-dd66-4e06-8192-1f944b5645a8	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	ec27c849-ee4d-4f87-818d-5ebf2adab285	17c55660-12f7-499a-9f12-1b1e0d558d03	1222	2015-01-01 01:44:00	2015-01-01 06:34:00	-4	landed	\N	f	f	f	f	f
0a9d0fbe-5ac0-46d3-be1b-dd2b69a63f78	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	ec27c849-ee4d-4f87-818d-5ebf2adab285	f1e978f1-35da-4540-827c-2817efca7f67	2762	2015-01-01 01:45:00	2015-01-01 05:55:00	15	landed	\N	f	f	t	f	f
a7eb7431-74b2-401a-bb5a-ddbf072d1c2d	c2e13e71-01b7-44fe-b091-5f86ae80c023	de24023d-db7f-4fcd-875b-edfcff42b5f5	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2552	2015-01-01 01:52:00	2015-01-01 09:15:00	-10	landed	\N	f	f	f	f	f
f6b84100-a0fc-479a-ac7d-5b196e279004	9ac91524-737f-47e4-bb51-365a3c0535a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	9b0fc777-7255-49f4-9d33-b1d5500e3298	1608	2015-01-01 01:54:00	2015-01-01 05:09:00	-11	landed	\N	f	f	f	f	f
10116319-887a-4d0b-95e4-573abb402883	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 01:55:00	2015-01-01 06:33:00	-35	landed	\N	f	f	f	f	f
c3b3f9e6-2d5c-41b0-84e8-6163cea9a394	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	a99f7a37-e7d1-4518-9900-0a21b2faae74	1598	2015-01-01 01:55:00	2015-01-01 04:50:00	11	landed	\N	f	f	f	f	f
180da29e-0e36-4f67-8687-49d3e7ca31c6	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	2a6057c7-22ce-46a7-ac2b-deb4f22cf7c8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1334	2015-01-01 01:55:00	2015-01-01 05:23:00	-33	landed	\N	f	f	f	f	f
8eeb59ec-3c7b-48cc-b5aa-6b9282570790	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	e5772f8f-21ce-4944-bcd9-0123a312a113	868	2015-01-01 01:59:00	2015-01-01 05:02:00	1	landed	\N	f	f	f	f	f
da18de82-301b-4a88-bbb5-0aa42ff04f44	56e4aa48-75b2-4da0-9fe0-033ef7008a91	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	e5772f8f-21ce-4944-bcd9-0123a312a113	868	2015-01-01 02:00:00	2015-01-01 05:00:00	0	cancelled	B	f	f	f	f	f
f8a58ddf-ce0d-4ebc-95ef-f1cdeab162b0	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	1542	2015-01-01 02:00:00	2015-01-01 06:30:00	-11	landed	\N	f	f	f	f	f
4b72d5a3-37fb-4bb1-b741-7e997cabf56a	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	fd5c96c8-610f-4727-9ba7-7f9b49bcbb52	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1176	2015-01-01 02:00:00	2015-01-01 05:04:00	-11	landed	\N	f	f	f	f	f
f72ba743-f28f-493f-8970-6efc476b6a98	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	9b0fc777-7255-49f4-9d33-b1d5500e3298	1608	2015-01-01 02:06:00	2015-01-01 05:12:00	4	landed	\N	f	f	f	f	f
4202df69-44b7-4507-b88c-b851786ca1e5	c2e13e71-01b7-44fe-b091-5f86ae80c023	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	1773	2015-01-01 02:20:00	2015-01-01 08:04:00	-36	landed	\N	f	f	f	f	f
98d162f0-535d-4706-ad41-e66fe5df8b8d	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 02:20:00	2015-01-01 06:40:00	-12	landed	\N	f	f	f	f	f
457ea613-0db4-4fbd-9de0-c626cba5960a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	f9e1cdce-28f5-4e36-9717-71ef3c667d83	761461d5-643f-4c65-8769-21d1ed2adc36	1179	2015-01-01 02:55:00	2015-01-01 05:00:00	-9	landed	\N	f	f	f	f	f
6d873d95-a9dc-4c8f-a7e1-2fe53cef7126	9ac91524-737f-47e4-bb51-365a3c0535a8	8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	9b0fc777-7255-49f4-9d33-b1d5500e3298	1585	2015-01-01 02:59:00	2015-01-01 05:59:00	6	landed	\N	f	f	f	f	f
c381e0f7-3183-42a1-9100-4be9d39a6eae	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	761461d5-643f-4c65-8769-21d1ed2adc36	1129	2015-01-01 03:07:00	2015-01-01 05:00:00	20	landed	\N	t	f	f	f	f
1bc926fc-ed13-4e8c-bfb1-bdd29514a365	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	30074e54-879b-4fbe-8a42-9b6d1690cec3	1674	2015-01-01 03:30:00	2015-01-01 06:35:00	-16	landed	\N	f	f	f	f	f
43b2d64e-ce93-4cc9-aa2a-5d150b03e166	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	761461d5-643f-4c65-8769-21d1ed2adc36	1189	2015-01-01 04:00:00	2015-01-01 06:05:00	85	landed	\N	f	f	t	f	f
c1e833c1-7ac8-4a1f-b143-3cc47e90f477	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	761461d5-643f-4c65-8769-21d1ed2adc36	1129	2015-01-01 04:19:00	2015-01-01 06:13:00	-7	landed	\N	f	f	f	f	f
7a123dd9-5c09-4c8c-8e1a-35148454ff4a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	f9e1cdce-28f5-4e36-9717-71ef3c667d83	761461d5-643f-4c65-8769-21d1ed2adc36	1179	2015-01-01 04:24:00	2015-01-01 06:30:00	-1	landed	\N	f	f	f	f	f
f4d5192e-09b1-4740-a744-bf9e52d3a743	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	9e6d748c-0887-402d-9c56-75882767f180	1666	2015-01-01 04:38:00	2015-01-01 07:39:00	89	landed	\N	t	f	t	f	f
a4665e49-c049-4965-a198-a9b8877b0f5e	c2e13e71-01b7-44fe-b091-5f86ae80c023	962de796-50ec-403e-90e7-dd8cbf8dd135	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1440	2015-01-01 05:00:00	2015-01-01 07:48:00	3	landed	\N	f	f	f	f	f
0bed4156-0ba5-4bdd-815a-98969ac4351c	94d86c52-5799-48f5-8693-1aea5b7c4d48	d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	224	2015-01-01 05:00:00	2015-01-01 06:10:00	0	landed	\N	f	f	f	f	f
9d45e4e9-8568-4212-931b-7211803491dc	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	c5970237-9d8a-46b7-a8b3-e051a8c2f06b	216	2015-01-01 05:00:00	2015-01-01 05:49:00	-6	landed	\N	f	f	f	f	f
95360777-60aa-4f58-93c0-5a2203b3c4ad	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	482881a6-c848-490b-9565-22468e00c5d7	363	2015-01-01 05:00:00	2015-01-01 06:29:00	9	landed	\N	f	f	f	f	f
3a11dcbe-fdf3-4ed5-992c-33a4139487e2	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	163	2015-01-01 05:02:00	2015-01-01 05:44:00	5	landed	\N	f	f	f	f	f
e5f99612-1e41-4693-aaf9-32e72861e9ab	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 05:05:00	2015-01-01 09:30:00	-14	landed	\N	f	f	f	f	f
ae52f3ab-6352-4c09-b3ae-e6ac62379e91	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	5c89a23c-37c7-4379-b07d-e40d325ef99a	100	2015-01-01 05:05:00	2015-01-01 05:41:00	-11	landed	\N	f	f	f	f	f
de055e78-94a1-4426-b58a-6ea13489ccd0	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	17c55660-12f7-499a-9f12-1b1e0d558d03	925	2015-01-01 05:10:00	2015-01-01 08:05:00	11	landed	\N	f	f	f	f	f
e946dd1b-d96f-4fc2-9064-9e9220b2756f	56e4aa48-75b2-4da0-9fe0-033ef7008a91	761461d5-643f-4c65-8769-21d1ed2adc36	9f7ac324-dbdd-48b7-b465-3f84b98ef945	192	2015-01-01 05:10:00	2015-01-01 06:13:00	-11	landed	\N	f	f	f	f	f
c0fc77d7-b2f9-4ac0-b76d-a611c9f4a75f	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	30074e54-879b-4fbe-8a42-9b6d1690cec3	094775f5-e4e3-4fca-b88a-b5c412548bdb	738	2015-01-01 05:10:00	2015-01-01 07:30:00	-10	landed	\N	f	f	f	f	f
d9e2013c-6622-4dc6-8976-4464f3508761	7d1ea82a-b408-4a79-afe6-313f0e01cc09	aaf9469b-d7a9-4aac-b033-d598e4527232	8efb8902-1cf4-4798-a5be-cd86f011f7ed	174	2015-01-01 05:10:00	2015-01-01 06:18:00	0	landed	\N	f	f	f	f	f
f15af884-8d8a-4027-9502-1dabfb8a2965	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0c1f2ca4-72c8-4065-9b83-f69ac4ac38c3	8efb8902-1cf4-4798-a5be-cd86f011f7ed	257	2015-01-01 05:10:00	2015-01-01 06:19:00	-4	landed	\N	f	f	f	f	f
00f17ca3-f8cb-4a67-994e-357e4412b297	7d1ea82a-b408-4a79-afe6-313f0e01cc09	45794771-7eea-47a1-b5ee-3de26801d071	17c55660-12f7-499a-9f12-1b1e0d558d03	429	2015-01-01 05:10:00	2015-01-01 06:37:00	0	cancelled	B	f	f	f	f	f
59715ea1-3bf0-4e1b-9aa8-cb21d78de6a1	c2e13e71-01b7-44fe-b091-5f86ae80c023	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1107	2015-01-01 05:15:00	2015-01-01 09:00:00	-2	landed	\N	f	f	f	f	f
0d12bca9-dfac-4e31-953e-f932e9cabca0	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1121	2015-01-01 05:15:00	2015-01-01 08:56:00	102	landed	\N	f	f	f	f	t
85ff6f35-fc26-466c-97e8-6b4394ff200e	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1258	2015-01-01 05:15:00	2015-01-01 08:43:00	2	landed	\N	f	f	f	f	f
0bef76bf-84fe-4c90-a8b0-bfce368512a5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	17c55660-12f7-499a-9f12-1b1e0d558d03	984	2015-01-01 05:15:00	2015-01-01 08:13:00	13	landed	\N	f	f	f	f	f
5838744e-f222-404d-9684-0031e0489311	c2e13e71-01b7-44fe-b091-5f86ae80c023	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1009	2015-01-01 05:20:00	2015-01-01 08:50:00	60	landed	\N	f	f	t	f	f
93c764b9-6dcc-495e-a2a2-941ea5e95d40	56e4aa48-75b2-4da0-9fe0-033ef7008a91	17c55660-12f7-499a-9f12-1b1e0d558d03	9f7ac324-dbdd-48b7-b465-3f84b98ef945	964	2015-01-01 05:20:00	2015-01-01 08:41:00	54	landed	\N	f	f	t	f	f
ae4ee37b-dab9-448e-8959-4f27b6106319	c2c012a9-4bdf-4b04-ac83-714fbc93b289	67e7149b-55f5-43f7-93f2-87921e81cb81	b334592c-f6aa-405f-b7a2-67d942e3b8ad	456	2015-01-01 05:20:00	2015-01-01 08:03:00	-6	landed	\N	f	f	f	f	f
29d9f742-6f87-4b51-8911-798be31b297e	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	720a0e7a-2938-4e87-9ba7-bc3d3d8aaaff	17c55660-12f7-499a-9f12-1b1e0d558d03	308	2015-01-01 05:20:00	2015-01-01 06:34:00	-5	landed	\N	f	f	f	f	f
f1024fc4-7695-42ae-a746-3449cd99b800	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	1b8ab136-ce1c-4b4d-92b9-9dd5e162d2b8	1a743a77-55e0-4c53-ab16-765667e2cc37	250	2015-01-01 05:20:00	2015-01-01 07:26:00	-15	landed	\N	f	f	f	f	f
a9b02251-066a-454c-9d1b-64f6b7a37c7a	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a91dbca0-d0c8-4846-9589-cb86ff1a3874	482881a6-c848-490b-9565-22468e00c5d7	522	2015-01-01 05:20:00	2015-01-01 06:12:00	3	landed	\N	f	f	f	f	f
5d1ff07a-acff-4411-a3ec-fdb97f8f82d1	7d1ea82a-b408-4a79-afe6-313f0e01cc09	6ed50361-d18c-4f8f-8e3f-47e9fdfe5ba1	8efb8902-1cf4-4798-a5be-cd86f011f7ed	199	2015-01-01 05:20:00	2015-01-01 06:20:00	9	landed	\N	f	f	f	f	f
d4935cef-cb68-4167-b9d8-556fec899d28	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	82057082-4f10-49c4-b6da-2661f289e6b7	102	2015-01-01 05:23:00	2015-01-01 06:00:00	-12	landed	\N	f	f	f	f	f
9cfa8f58-3fa2-40f5-87b2-77a1868f27f5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	67e7149b-55f5-43f7-93f2-87921e81cb81	1a743a77-55e0-4c53-ab16-765667e2cc37	214	2015-01-01 05:25:00	2015-01-01 07:30:00	5	landed	\N	f	f	f	f	f
b6ad46a4-e149-481b-be89-3510086566d9	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e5dafbf2-9081-4db8-83fb-4478c7685a70	e5772f8f-21ce-4944-bcd9-0123a312a113	364	2015-01-01 05:25:00	2015-01-01 07:00:00	0	cancelled	B	f	f	f	f	f
6ff3303a-1c18-4afc-8c9e-a3b0f4edb45f	9ac91524-737f-47e4-bb51-365a3c0535a8	3b85c138-79ba-401a-a5bd-82bcbfbb7813	17c55660-12f7-499a-9f12-1b1e0d558d03	1325	2015-01-01 05:30:00	2015-01-01 08:20:00	6	landed	\N	f	f	f	f	f
bc1e041f-31bb-4205-b580-412dbd397513	9ac91524-737f-47e4-bb51-365a3c0535a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	39184e8c-153c-4f15-83b7-520dfc412682	991	2015-01-01 05:30:00	2015-01-01 08:52:00	4	landed	\N	f	f	f	f	f
6637d1b2-e43f-4784-a57a-affd7c26c7e8	9ac91524-737f-47e4-bb51-365a3c0535a8	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	39184e8c-153c-4f15-83b7-520dfc412682	1024	2015-01-01 05:30:00	2015-01-01 09:07:00	-1	landed	\N	f	f	f	f	f
24ec68d9-d786-460f-9cc0-fa8e5ff93694	56e4aa48-75b2-4da0-9fe0-033ef7008a91	39184e8c-153c-4f15-83b7-520dfc412682	e5772f8f-21ce-4944-bcd9-0123a312a113	641	2015-01-01 05:30:00	2015-01-01 08:35:00	66	landed	\N	t	f	t	f	f
34b4c073-5ae4-45c6-b27a-e32f6a932baf	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	2e0f30ff-240a-4568-84c7-c5a66caa23d0	962de796-50ec-403e-90e7-dd8cbf8dd135	84	2015-01-01 05:30:00	2015-01-01 05:25:00	-14	landed	\N	f	f	f	f	f
9f1cfb3b-b831-4a6c-8356-0c950ad1abf1	9e7e7cfc-68ae-4c4f-9721-407f71db5155	3b85c138-79ba-401a-a5bd-82bcbfbb7813	761461d5-643f-4c65-8769-21d1ed2adc36	861	2015-01-01 05:30:00	2015-01-01 08:10:00	-18	landed	\N	f	f	f	f	f
c97be46f-2224-496a-859e-504dbbacb220	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	962de796-50ec-403e-90e7-dd8cbf8dd135	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1182	2015-01-01 05:30:00	2015-01-01 09:38:00	-25	landed	\N	f	f	f	f	f
b480b695-c2a6-42b0-be51-53804d502c91	7d1ea82a-b408-4a79-afe6-313f0e01cc09	39428470-63a9-400b-9cee-f850c18c1298	482881a6-c848-490b-9565-22468e00c5d7	199	2015-01-01 05:30:00	2015-01-01 07:00:00	0	cancelled	A	f	f	f	f	f
ea342ac5-1de1-4698-93a0-fc27ab7843e3	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a06592ee-27b6-49b6-baf2-2ba176d3ea9c	39184e8c-153c-4f15-83b7-520dfc412682	996	2015-01-01 05:30:00	2015-01-01 09:13:00	13	landed	\N	f	f	f	f	f
adc77be5-0346-4d4f-9ac2-13d64de524e0	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	39184e8c-153c-4f15-83b7-520dfc412682	967	2015-01-01 05:31:00	2015-01-01 08:57:00	26	landed	\N	t	f	t	f	f
38f755d5-7f26-467a-aead-addd9d5451ef	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	39184e8c-153c-4f15-83b7-520dfc412682	888	2015-01-01 05:33:00	2015-01-01 07:20:00	3	landed	\N	f	f	f	f	f
c4260453-dc91-4a1a-82ca-7c01e218bfc8	9ac91524-737f-47e4-bb51-365a3c0535a8	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	17c55660-12f7-499a-9f12-1b1e0d558d03	1190	2015-01-01 05:35:00	2015-01-01 08:02:00	14	landed	\N	f	f	f	f	f
b12d3d78-fee4-438f-b339-c04d618527d1	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	c0da7786-cefb-463a-a6d5-57260bfb6019	a99f7a37-e7d1-4518-9900-0a21b2faae74	301	2015-01-01 05:35:00	2015-01-01 07:03:00	-15	landed	\N	f	f	f	f	f
662cb0d3-b8b6-469c-b0b9-4c9342aed217	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	32677614-aec3-443b-8c32-ac8adcbb5634	a99f7a37-e7d1-4518-9900-0a21b2faae74	273	2015-01-01 05:35:00	2015-01-01 07:00:00	-25	landed	\N	f	f	f	f	f
7b419433-b2a0-4b2e-83ec-43d4c8ad4e7e	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	2252ada7-ca47-47a3-a183-de83d2aa3cd0	1598	2015-01-01 05:35:00	2015-01-01 10:20:00	19	landed	\N	f	f	t	f	f
fb501e7b-b76b-428f-92ab-893782585ec0	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0f9bb6c9-7437-4357-88ce-54353e6bf6a6	17c55660-12f7-499a-9f12-1b1e0d558d03	201	2015-01-01 05:35:00	2015-01-01 06:36:00	-21	landed	\N	f	f	f	f	f
73bde17d-f827-49e3-a2b6-26e91b0da2c1	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	eafaffaf-f7f7-42f1-bccb-2cada8cca167	b334592c-f6aa-405f-b7a2-67d942e3b8ad	346	2015-01-01 05:35:00	2015-01-01 08:03:00	-18	landed	\N	f	f	f	f	f
6fc90ff4-e36d-4271-a86a-6741d5ed09bc	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	962de796-50ec-403e-90e7-dd8cbf8dd135	b334592c-f6aa-405f-b7a2-67d942e3b8ad	235	2015-01-01 05:35:00	2015-01-01 08:00:00	-3	landed	\N	f	f	f	f	f
f31a6712-5f0a-411e-9da6-67d7434b9a7c	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	209	2015-01-01 05:35:00	2015-01-01 06:50:00	0	landed	\N	f	f	f	f	f
2f87a342-181f-46fa-963b-4d0fe7e1644f	9ac91524-737f-47e4-bb51-365a3c0535a8	5731f612-6da8-41cc-a5a4-af8a8d7689bc	39184e8c-153c-4f15-83b7-520dfc412682	909	2015-01-01 05:38:00	2015-01-01 09:00:00	78	landed	\N	t	f	t	f	f
91c3bfbf-80d6-4a19-b18c-b1cf70be5936	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1242	2015-01-01 05:38:00	2015-01-01 07:10:00	-16	landed	\N	f	f	f	f	f
0e746ccb-4761-4231-b4b4-b6355f3dd246	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	566b6db6-eefa-482b-a38b-9842c22c0136	369	2015-01-01 05:40:00	2015-01-01 07:21:00	-21	landed	\N	f	f	f	f	f
762ba3de-f8ed-4f3a-af32-ac415aae958d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	962de796-50ec-403e-90e7-dd8cbf8dd135	30074e54-879b-4fbe-8a42-9b6d1690cec3	867	2015-01-01 05:40:00	2015-01-01 08:56:00	-33	landed	\N	f	f	f	f	f
84272e6b-78f9-4e5c-848e-f70e11c842eb	c2c012a9-4bdf-4b04-ac83-714fbc93b289	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1671	2015-01-01 05:40:00	2015-01-01 11:23:00	128	landed	\N	f	f	f	f	t
9b92221a-bd6e-41b9-95e8-969eaede6bf9	c2c012a9-4bdf-4b04-ac83-714fbc93b289	f2d678b1-8153-46e2-bf8e-aa197ce84aca	1a743a77-55e0-4c53-ab16-765667e2cc37	692	2015-01-01 05:40:00	2015-01-01 08:42:00	-15	landed	\N	f	f	f	f	f
133e31b0-acd8-4772-ad29-9418b2dd7d17	c2c012a9-4bdf-4b04-ac83-714fbc93b289	30074e54-879b-4fbe-8a42-9b6d1690cec3	b334592c-f6aa-405f-b7a2-67d942e3b8ad	632	2015-01-01 05:40:00	2015-01-01 08:03:00	-21	landed	\N	f	f	f	f	f
56c7904f-996c-4237-884d-918b2eb5baa1	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	1a743a77-55e0-4c53-ab16-765667e2cc37	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	534	2015-01-01 05:40:00	2015-01-01 07:25:00	14	landed	\N	f	f	f	f	f
9430190e-7a1f-4abe-aa36-0a5edaf6cef5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	bb4a1f43-cd49-4548-9c40-68be992ecb81	9b0fc777-7255-49f4-9d33-b1d5500e3298	820	2015-01-01 05:40:00	2015-01-01 07:57:00	-14	landed	\N	f	f	f	f	f
6a4be469-4e2d-42c3-b90f-6f25587ee345	7d1ea82a-b408-4a79-afe6-313f0e01cc09	17c03644-1b2c-49ae-b6cd-8d0bde66f820	39184e8c-153c-4f15-83b7-520dfc412682	964	2015-01-01 05:40:00	2015-01-01 09:21:00	25	landed	\N	t	f	f	f	f
0c92f26a-5653-4070-b014-7ee9dfe8a4ff	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cea35714-d52a-40da-9949-c5ba12469150	17c55660-12f7-499a-9f12-1b1e0d558d03	1195	2015-01-01 05:40:00	2015-01-01 09:53:00	-16	landed	\N	f	f	f	f	f
b6eb138b-ad8d-4935-8528-3de7b4077290	7d1ea82a-b408-4a79-afe6-313f0e01cc09	fa7f28a1-7e68-4e6c-9726-0b0c5bc681b6	39184e8c-153c-4f15-83b7-520dfc412682	458	2015-01-01 05:41:00	2015-01-01 07:25:00	7	landed	\N	f	f	f	f	f
8f5a746e-16ef-47fe-a9ba-9cbed3d8b42b	9e7e7cfc-68ae-4c4f-9721-407f71db5155	0db05805-32e6-4ba0-8bca-331176bc84b3	39184e8c-153c-4f15-83b7-520dfc412682	826	2015-01-01 05:44:00	2015-01-01 07:09:00	-11	landed	\N	f	f	f	f	f
caa3ea97-b16a-4b1f-b4da-bc0964f489db	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	b334592c-f6aa-405f-b7a2-67d942e3b8ad	237	2015-01-01 05:45:00	2015-01-01 07:59:00	-21	landed	\N	f	f	f	f	f
f933c61b-f53c-4b6d-9365-5fecbed7f322	9ac91524-737f-47e4-bb51-365a3c0535a8	d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	39184e8c-153c-4f15-83b7-520dfc412682	836	2015-01-01 05:45:00	2015-01-01 09:04:00	-6	landed	\N	f	f	f	f	f
efb7a26c-ff2e-4d36-ac7c-c001eb181870	9ac91524-737f-47e4-bb51-365a3c0535a8	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	17c55660-12f7-499a-9f12-1b1e0d558d03	1874	2015-01-01 05:45:00	2015-01-01 11:56:00	11	landed	\N	f	f	f	f	f
2527b2bf-3560-4b65-8c12-f11fd64a18de	9ac91524-737f-47e4-bb51-365a3c0535a8	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	17c55660-12f7-499a-9f12-1b1e0d558d03	1208	2015-01-01 05:45:00	2015-01-01 08:14:00	-7	landed	\N	f	f	f	f	f
e76e26bd-0d80-4897-80a2-d5d8eb39403f	56e4aa48-75b2-4da0-9fe0-033ef7008a91	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	e5772f8f-21ce-4944-bcd9-0123a312a113	247	2015-01-01 05:45:00	2015-01-01 06:50:00	-12	landed	\N	f	f	f	f	f
79d5c5da-1589-49de-b83b-cf4adf7b3bb5	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a99f7a37-e7d1-4518-9900-0a21b2faae74	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1089	2015-01-01 05:45:00	2015-01-01 08:50:00	69	landed	\N	t	f	t	f	f
00905df8-7831-45ce-9676-006c2c22c12d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	55f76a81-76d7-45d4-965f-36aec15fdbb0	1197	2015-01-01 05:45:00	2015-01-01 09:10:00	-9	landed	\N	f	f	f	f	f
cce944ef-f48d-4a9a-ac51-6e5524434d57	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	a99f7a37-e7d1-4518-9900-0a21b2faae74	187	2015-01-01 05:45:00	2015-01-01 07:02:00	-13	landed	\N	f	f	f	f	f
1f02f464-d743-4152-8b6e-9168b7992b3a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	1576	2015-01-01 05:45:00	2015-01-01 10:26:00	-19	landed	\N	f	f	f	f	f
43639dc7-5397-4a3c-adfa-88d7a4c16d25	c2c012a9-4bdf-4b04-ac83-714fbc93b289	e5772f8f-21ce-4944-bcd9-0123a312a113	1a743a77-55e0-4c53-ab16-765667e2cc37	731	2015-01-01 05:45:00	2015-01-01 08:49:00	-2	landed	\N	f	f	f	f	f
bb2abe40-60f4-4e71-a0fd-604daa68007d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	c53ed55a-6259-43dd-a050-6288e2e5a045	9b0fc777-7255-49f4-9d33-b1d5500e3298	628	2015-01-01 05:45:00	2015-01-01 07:41:00	1	landed	\N	f	f	f	f	f
b0ab1a65-72ca-4066-81d7-7ccecfce2cb5	9e7e7cfc-68ae-4c4f-9721-407f71db5155	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	39184e8c-153c-4f15-83b7-520dfc412682	896	2015-01-01 05:45:00	2015-01-01 07:26:00	17	landed	\N	f	f	t	f	f
8dcb2530-82cc-45c5-9347-182710ec4c47	9e7e7cfc-68ae-4c4f-9721-407f71db5155	8efb8902-1cf4-4798-a5be-cd86f011f7ed	39184e8c-153c-4f15-83b7-520dfc412682	680	2015-01-01 05:45:00	2015-01-01 06:54:00	-8	landed	\N	f	f	f	f	f
df078c54-7dfe-44a9-9a82-f3d1ce018ad4	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	c53ed55a-6259-43dd-a050-6288e2e5a045	e5772f8f-21ce-4944-bcd9-0123a312a113	987	2015-01-01 05:45:00	2015-01-01 07:55:00	0	cancelled	B	f	f	f	f	f
eaae6b62-cf3d-4df8-af0b-c89b5cd8fcf3	7d1ea82a-b408-4a79-afe6-313f0e01cc09	39184e8c-153c-4f15-83b7-520dfc412682	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	862	2015-01-01 05:45:00	2015-01-01 07:15:00	56	landed	\N	f	f	t	f	f
fb80b580-1290-4685-b737-0eba8d429bb8	7d1ea82a-b408-4a79-afe6-313f0e01cc09	509444be-70dd-401a-a056-319e65f49b1c	39184e8c-153c-4f15-83b7-520dfc412682	916	2015-01-01 05:45:00	2015-01-01 09:19:00	10	landed	\N	f	f	f	f	f
cc96f1d1-ab06-4346-bf91-e068453ed062	7d1ea82a-b408-4a79-afe6-313f0e01cc09	627ad800-7325-4fb9-ab80-d277c6b4b8b2	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	134	2015-01-01 05:45:00	2015-01-01 06:51:00	0	cancelled	A	f	f	f	f	f
40577b5f-0053-4c66-bb1a-2e5d0d122ef2	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	163	2015-01-01 05:48:00	2015-01-01 06:30:00	-6	landed	\N	f	f	f	f	f
a282885a-0fbb-4f2f-beb6-7ea9fc87c74b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	c0da7786-cefb-463a-a6d5-57260bfb6019	395	2015-01-01 05:49:00	2015-01-01 07:25:00	-6	landed	\N	f	f	f	f	f
8e7fa0f5-2960-487a-8ac0-36081a3647bf	9ac91524-737f-47e4-bb51-365a3c0535a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	9b0fc777-7255-49f4-9d33-b1d5500e3298	2434	2015-01-01 05:50:00	2015-01-01 14:04:00	-35	landed	\N	f	f	f	f	f
beebbef3-2530-4b38-b08e-fff85c815492	c2e13e71-01b7-44fe-b091-5f86ae80c023	23cc1784-a84f-46af-ac01-7d2b1f2828cc	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1488	2015-01-01 05:50:00	2015-01-01 07:50:00	4	landed	\N	f	f	f	f	f
f49a481b-d435-4053-93ac-680e708ab579	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	39184e8c-153c-4f15-83b7-520dfc412682	862	2015-01-01 05:50:00	2015-01-01 09:15:00	-9	landed	\N	f	f	f	f	f
52b6df12-0e2e-43bc-9b33-4838efab7838	9ac91524-737f-47e4-bb51-365a3c0535a8	b37300fc-b095-4e23-b471-de894da310f9	17c55660-12f7-499a-9f12-1b1e0d558d03	1091	2015-01-01 05:50:00	2015-01-01 08:04:00	43	landed	\N	t	f	t	f	f
5baf8e26-49e2-41f0-b6b1-0d95b54c9421	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	9b0fc777-7255-49f4-9d33-b1d5500e3298	200	2015-01-01 05:50:00	2015-01-01 07:18:00	-19	landed	\N	f	f	f	f	f
7e9eab22-16cb-4542-a3cf-47ba80ab4772	c2e13e71-01b7-44fe-b091-5f86ae80c023	39184e8c-153c-4f15-83b7-520dfc412682	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	602	2015-01-01 05:50:00	2015-01-01 07:49:00	-10	landed	\N	f	f	f	f	f
1625774c-1166-4806-b0ae-5e9aef6803be	c2e13e71-01b7-44fe-b091-5f86ae80c023	f2d678b1-8153-46e2-bf8e-aa197ce84aca	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1044	2015-01-01 05:50:00	2015-01-01 07:48:00	-5	landed	\N	f	f	f	f	f
7b0656b2-64fa-47f4-acbb-2ec9857ff9f2	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	e5772f8f-21ce-4944-bcd9-0123a312a113	190	2015-01-01 05:50:00	2015-01-01 06:50:00	-1	landed	\N	f	f	f	f	f
5b5aee47-d801-46c7-8ca8-03792fa92355	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	e5772f8f-21ce-4944-bcd9-0123a312a113	1235	2015-01-01 05:50:00	2015-01-01 10:50:00	2	landed	\N	f	f	f	f	f
8975465f-c558-4631-aebd-8bb809302498	c2c012a9-4bdf-4b04-ac83-714fbc93b289	52ca9d97-f51a-4ed5-9e33-d81ff6752a5a	1a743a77-55e0-4c53-ab16-765667e2cc37	153	2015-01-01 05:50:00	2015-01-01 06:49:00	0	landed	\N	f	f	f	f	f
b667639e-ea04-4fe8-975c-d230be85d00b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	761461d5-643f-4c65-8769-21d1ed2adc36	9b0fc777-7255-49f4-9d33-b1d5500e3298	937	2015-01-01 05:50:00	2015-01-01 08:19:00	-7	landed	\N	f	f	f	f	f
2c52eb94-0d89-4704-bfee-4ee8123738da	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	f2d678b1-8153-46e2-bf8e-aa197ce84aca	17c55660-12f7-499a-9f12-1b1e0d558d03	643	2015-01-01 05:50:00	2015-01-01 08:05:00	1	landed	\N	f	f	f	f	f
b60de64f-c393-4014-ac3e-774e70f2bb60	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	9e6d748c-0887-402d-9c56-75882767f180	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	326	2015-01-01 05:50:00	2015-01-01 07:18:00	-19	landed	\N	f	f	f	f	f
531507ae-7177-4681-9ad0-8c70e9d4ba6e	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e1154404-f9a9-42ff-8bf9-4b6a19e0d580	e5772f8f-21ce-4944-bcd9-0123a312a113	158	2015-01-01 05:50:00	2015-01-01 06:45:00	0	cancelled	B	f	f	f	f	f
aa3a5011-9008-4999-b344-55170c436d17	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	17c55660-12f7-499a-9f12-1b1e0d558d03	1157	2015-01-01 05:50:00	2015-01-01 08:15:00	13	landed	\N	f	f	f	f	f
1d779940-6038-4e16-b89c-f305a4d7f5f6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	23dd7561-2551-4bf1-9274-493b57d1bbfe	39184e8c-153c-4f15-83b7-520dfc412682	845	2015-01-01 05:50:00	2015-01-01 09:20:00	20	landed	\N	t	f	t	f	f
613bac2a-9d1d-4922-a802-95bca5eedd30	7d1ea82a-b408-4a79-afe6-313f0e01cc09	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	482881a6-c848-490b-9565-22468e00c5d7	1482	2015-01-01 05:50:00	2015-01-01 07:59:00	-19	landed	\N	f	f	f	f	f
77bc4c79-0272-4277-ba85-05a36535b786	7d1ea82a-b408-4a79-afe6-313f0e01cc09	b1062708-791a-4d09-aade-7516111fd22d	17c55660-12f7-499a-9f12-1b1e0d558d03	781	2015-01-01 05:50:00	2015-01-01 08:10:00	21	landed	\N	t	f	t	f	f
f98c31f2-e386-4c7b-9fe0-c61dfe5f4dfd	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cf5967d7-257b-4f2f-9ca2-6ddd7d3bc0d4	39184e8c-153c-4f15-83b7-520dfc412682	898	2015-01-01 05:50:00	2015-01-01 09:13:00	6	landed	\N	f	f	f	f	f
aa5696a2-0c05-42a9-9720-d0c7098a702d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	9e6d748c-0887-402d-9c56-75882767f180	1173	2015-01-01 05:53:00	2015-01-01 08:39:00	9	landed	\N	f	f	f	f	f
6713492a-0400-442d-8be5-92d35ab85eb5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	05932e22-3166-458e-b741-1ca107a3cb29	1a743a77-55e0-4c53-ab16-765667e2cc37	694	2015-01-01 05:54:00	2015-01-01 09:05:00	-17	landed	\N	f	f	f	f	f
94d523d2-197f-4f51-bd8f-a627132b59d3	44d688b1-5f1b-41c3-b767-1526eca22fa7	482881a6-c848-490b-9565-22468e00c5d7	39184e8c-153c-4f15-83b7-520dfc412682	967	2015-01-01 05:55:00	2015-01-01 09:25:00	-2	landed	\N	f	f	f	f	f
75bcab20-9b27-49cf-9567-a36db98b43f3	9ac91524-737f-47e4-bb51-365a3c0535a8	761461d5-643f-4c65-8769-21d1ed2adc36	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2218	2015-01-01 05:55:00	2015-01-01 08:36:00	4	landed	\N	f	f	f	f	f
bd899714-6e38-4faf-aee2-b6c396692eca	9ac91524-737f-47e4-bb51-365a3c0535a8	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	9b0fc777-7255-49f4-9d33-b1d5500e3298	997	2015-01-01 05:55:00	2015-01-01 08:31:00	-13	landed	\N	f	f	f	f	f
aeff48b0-d2e4-463f-86c4-7ce8ed1bdedc	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	e5772f8f-21ce-4944-bcd9-0123a312a113	1660	2015-01-01 05:55:00	2015-01-01 11:50:00	16	landed	\N	t	f	f	f	f
cf198e0d-3949-4c41-af3c-3f6b5f447911	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	e5772f8f-21ce-4944-bcd9-0123a312a113	1562	2015-01-01 05:55:00	2015-01-01 09:30:00	-10	landed	\N	f	f	f	f	f
51817b9e-4559-413b-a7f0-aace41ca9640	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b84db205-3c6f-4721-85b9-a8d8aa4f23cd	a99f7a37-e7d1-4518-9900-0a21b2faae74	209	2015-01-01 05:55:00	2015-01-01 07:18:00	-13	landed	\N	f	f	f	f	f
882fbbc0-4519-4f5f-aa52-9ccd7acc0e5b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	dabdd0c5-e0a4-4a99-97ac-fcec7b9faf8d	a99f7a37-e7d1-4518-9900-0a21b2faae74	264	2015-01-01 05:55:00	2015-01-01 07:20:00	-17	landed	\N	f	f	f	f	f
25db476b-d260-4710-ac25-de3773d83a9a	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	4e1d7633-0556-4357-bb38-cf74b4e0e149	e5772f8f-21ce-4944-bcd9-0123a312a113	102	2015-01-01 05:55:00	2015-01-01 06:45:00	-9	landed	\N	f	f	f	f	f
5e31e191-1979-44d8-9d16-acd543f85261	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	f2d678b1-8153-46e2-bf8e-aa197ce84aca	962de796-50ec-403e-90e7-dd8cbf8dd135	403	2015-01-01 05:55:00	2015-01-01 07:29:00	-12	landed	\N	f	f	f	f	f
d61dc290-01b2-4fa8-8c13-2b2552646c21	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	d56ffc7a-af30-445d-a3b0-104c7dcc97a6	962de796-50ec-403e-90e7-dd8cbf8dd135	179	2015-01-01 05:55:00	2015-01-01 06:04:00	6	landed	\N	f	f	f	f	f
7663501c-b61d-4abe-8fe2-a83817352d4a	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	c0da7786-cefb-463a-a6d5-57260bfb6019	9b0fc777-7255-49f4-9d33-b1d5500e3298	282	2015-01-01 05:55:00	2015-01-01 07:15:00	226	landed	\N	t	f	f	f	t
7451a4a4-a92a-4349-9dee-53f803c20180	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d216ecd3-f5b9-4242-bd04-9d3533441471	e5772f8f-21ce-4944-bcd9-0123a312a113	280	2015-01-01 05:55:00	2015-01-01 07:10:00	0	cancelled	B	f	f	f	f	f
3b552969-a085-4892-8aa2-30a0f63e536b	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0b15631f-d083-4b76-8d70-75ab7dd2940c	9b0fc777-7255-49f4-9d33-b1d5500e3298	445	2015-01-01 05:56:00	2015-01-01 07:30:00	-22	landed	\N	f	f	f	f	f
f8a899fe-8bcd-420e-9d4a-2703ced56534	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	962de796-50ec-403e-90e7-dd8cbf8dd135	0b753b16-0eac-45df-8db5-70af8de58431	733	2015-01-01 05:56:00	2015-01-01 09:00:00	27	landed	\N	t	f	f	f	f
d719d050-a5a2-49d2-9918-edb8ac0bed0e	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	17c55660-12f7-499a-9f12-1b1e0d558d03	1379	2015-01-01 05:57:00	2015-01-01 11:09:00	-16	landed	\N	f	f	f	f	f
9e96879e-a027-4db7-be65-3a60057f1d40	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9b0fc777-7255-49f4-9d33-b1d5500e3298	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1085	2015-01-01 05:59:00	2015-01-01 09:02:00	-13	landed	\N	f	f	f	f	f
6afcde4b-a471-47d3-abdb-03ffb8ab71e6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	39184e8c-153c-4f15-83b7-520dfc412682	819	2015-01-01 05:59:00	2015-01-01 09:20:00	116	landed	\N	f	f	f	f	t
e313f337-c5c3-4754-bf66-4f6ad7c011db	9ac91524-737f-47e4-bb51-365a3c0535a8	8efb8902-1cf4-4798-a5be-cd86f011f7ed	39184e8c-153c-4f15-83b7-520dfc412682	680	2015-01-01 06:00:00	2015-01-01 07:19:00	-23	landed	\N	f	f	f	f	f
47f80c2b-49f2-402f-a217-cd5e7282461c	9ac91524-737f-47e4-bb51-365a3c0535a8	55f76a81-76d7-45d4-965f-36aec15fdbb0	17c55660-12f7-499a-9f12-1b1e0d558d03	956	2015-01-01 06:00:00	2015-01-01 07:50:00	-3	landed	\N	f	f	f	f	f
45992ea4-4335-4551-88f1-c41e7740fd37	9ac91524-737f-47e4-bb51-365a3c0535a8	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	17c55660-12f7-499a-9f12-1b1e0d558d03	1009	2015-01-01 06:00:00	2015-01-01 09:28:00	123	landed	\N	t	f	f	f	t
249036e7-3169-4b0d-925b-840d83431e6e	9ac91524-737f-47e4-bb51-365a3c0535a8	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	17c55660-12f7-499a-9f12-1b1e0d558d03	861	2015-01-01 06:00:00	2015-01-01 07:36:00	-1	landed	\N	f	f	f	f	f
a9c0f453-484a-450e-ab65-9d0630a5aa8f	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	761461d5-643f-4c65-8769-21d1ed2adc36	937	2015-01-01 06:00:00	2015-01-01 08:53:00	-18	landed	\N	f	f	f	f	f
9e83fe46-a32c-4bdb-93a5-4dee60aff3c6	9ac91524-737f-47e4-bb51-365a3c0535a8	b1062708-791a-4d09-aade-7516111fd22d	962de796-50ec-403e-90e7-dd8cbf8dd135	416	2015-01-01 06:00:00	2015-01-01 07:37:00	-6	landed	\N	f	f	f	f	f
ae8945fd-7438-4014-b8c8-1ca31118e73d	c2e13e71-01b7-44fe-b091-5f86ae80c023	5731f612-6da8-41cc-a5a4-af8a8d7689bc	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	647	2015-01-01 06:00:00	2015-01-01 08:50:00	12	landed	\N	f	f	f	f	f
d276a38f-a244-45a5-8477-67d59902ccb0	c2e13e71-01b7-44fe-b091-5f86ae80c023	220d76f8-307b-4240-9335-a0ac5eb6e0b5	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	646	2015-01-01 06:00:00	2015-01-01 08:55:00	8	landed	\N	f	f	f	f	f
4ba08865-7538-4f31-9a00-e894409aa69b	c2e13e71-01b7-44fe-b091-5f86ae80c023	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	683	2015-01-01 06:00:00	2015-01-01 08:19:00	-14	landed	\N	f	f	f	f	f
09eef623-4406-4e3c-84a1-a84e4c7b0cd0	9ac91524-737f-47e4-bb51-365a3c0535a8	04c81e3b-7621-4c9b-b978-e7123b287ce5	39184e8c-153c-4f15-83b7-520dfc412682	804	2015-01-01 06:00:00	2015-01-01 09:10:00	14	landed	\N	f	f	f	f	f
54d9565b-d7ba-4bc6-b980-01b36d063063	9ac91524-737f-47e4-bb51-365a3c0535a8	12d5c993-ac8c-4b1f-ba44-022a0387f073	17c55660-12f7-499a-9f12-1b1e0d558d03	1117	2015-01-01 06:00:00	2015-01-01 08:15:00	24	landed	\N	t	f	t	f	f
4453ab3e-1890-4b01-81bf-21d4eaff8135	9ac91524-737f-47e4-bb51-365a3c0535a8	39184e8c-153c-4f15-83b7-520dfc412682	17c55660-12f7-499a-9f12-1b1e0d558d03	862	2015-01-01 06:00:00	2015-01-01 09:22:00	-4	landed	\N	f	f	f	f	f
3384fe4c-cef1-4fdf-a530-73de02ba2e3e	44d688b1-5f1b-41c3-b767-1526eca22fa7	30074e54-879b-4fbe-8a42-9b6d1690cec3	566b6db6-eefa-482b-a38b-9842c22c0136	369	2015-01-01 06:00:00	2015-01-01 07:45:00	-26	landed	\N	f	f	f	f	f
f2e7b1cc-d663-41aa-ac52-1742ba0f8785	44d688b1-5f1b-41c3-b767-1526eca22fa7	ec27c849-ee4d-4f87-818d-5ebf2adab285	566b6db6-eefa-482b-a38b-9842c22c0136	2106	2015-01-01 06:00:00	2015-01-01 13:30:00	-25	landed	\N	f	f	f	f	f
36e8e6b0-d9db-49a6-a25b-9023a98c3ac6	44d688b1-5f1b-41c3-b767-1526eca22fa7	479c7b82-dae0-4b8f-9885-63acb8c8ac3d	30b529a2-d575-423d-908a-2c2f004c560c	759	2015-01-01 06:00:00	2015-01-01 09:00:00	22	landed	\N	t	f	t	f	f
d2435330-1c7b-476f-b119-f79e93f1f4a9	44d688b1-5f1b-41c3-b767-1526eca22fa7	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	cea35714-d52a-40da-9949-c5ba12469150	507	2015-01-01 06:00:00	2015-01-01 07:35:00	-6	landed	\N	f	f	f	f	f
34792246-a9fa-4bd0-9d6e-01f28de18816	44d688b1-5f1b-41c3-b767-1526eca22fa7	12d5c993-ac8c-4b1f-ba44-022a0387f073	b0bacb84-e58a-492c-a93a-0cd54194c0b1	994	2015-01-01 06:00:00	2015-01-01 08:50:00	-26	landed	\N	f	f	f	f	f
891203be-ce02-4805-82b9-9875c39b35a3	44d688b1-5f1b-41c3-b767-1526eca22fa7	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	566b6db6-eefa-482b-a38b-9842c22c0136	327	2015-01-01 06:00:00	2015-01-01 07:40:00	-13	landed	\N	f	f	f	f	f
9037a911-da91-467f-a331-719d1b181d58	44d688b1-5f1b-41c3-b767-1526eca22fa7	482881a6-c848-490b-9565-22468e00c5d7	1a743a77-55e0-4c53-ab16-765667e2cc37	2139	2015-01-01 06:00:00	2015-01-01 13:40:00	-16	landed	\N	f	f	f	f	f
b34a8aa9-9eb6-4f5c-9c8f-3081b34f5064	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	962de796-50ec-403e-90e7-dd8cbf8dd135	1846	2015-01-01 06:00:00	2015-01-01 12:17:00	-4	landed	\N	f	f	f	f	f
c7d1df59-d0c2-474c-8afe-a700799ac3e0	9ac91524-737f-47e4-bb51-365a3c0535a8	761461d5-643f-4c65-8769-21d1ed2adc36	9b0fc777-7255-49f4-9d33-b1d5500e3298	937	2015-01-01 06:00:00	2015-01-01 08:34:00	-18	landed	\N	f	f	f	f	f
b21058d9-5394-4fd7-aee1-6eaac38d9265	9ac91524-737f-47e4-bb51-365a3c0535a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	17c55660-12f7-499a-9f12-1b1e0d558d03	1825	2015-01-01 06:00:00	2015-01-01 12:04:00	11	landed	\N	f	f	f	f	f
9d20c035-4c13-4b9c-b2b2-d337d3847708	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	962de796-50ec-403e-90e7-dd8cbf8dd135	867	2015-01-01 06:00:00	2015-01-01 07:53:00	-11	landed	\N	f	f	f	f	f
b16f30bc-015d-40c5-b0d7-a96e3879cd2f	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	337	2015-01-01 06:00:00	2015-01-01 07:28:00	-11	landed	\N	f	f	f	f	f
3ff85c6e-bf9a-4488-8246-910bb99dd561	9ac91524-737f-47e4-bb51-365a3c0535a8	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1211	2015-01-01 06:00:00	2015-01-01 07:27:00	-3	landed	\N	f	f	f	f	f
9560b846-c714-4000-8c22-b2d7b16ae410	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2611	2015-01-01 06:00:00	2015-01-01 09:44:00	-5	landed	\N	f	f	f	f	f
deb65231-7efc-41c2-a057-60a418f04b1a	9ac91524-737f-47e4-bb51-365a3c0535a8	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	9b0fc777-7255-49f4-9d33-b1d5500e3298	2402	2015-01-01 06:00:00	2015-01-01 14:11:00	-14	landed	\N	f	f	f	f	f
a05af6a9-17af-4e55-95c3-6080d70fc3b1	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	962de796-50ec-403e-90e7-dd8cbf8dd135	1744	2015-01-01 06:00:00	2015-01-01 12:10:00	-16	landed	\N	f	f	f	f	f
5f1d614e-32f7-45bf-8d00-0e9a05ed2191	c2e13e71-01b7-44fe-b091-5f86ae80c023	17c55660-12f7-499a-9f12-1b1e0d558d03	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1009	2015-01-01 06:00:00	2015-01-01 07:50:00	-4	landed	\N	f	f	f	f	f
8a617d04-d02b-4bad-97e0-97076e6a328e	c2e13e71-01b7-44fe-b091-5f86ae80c023	761461d5-643f-4c65-8769-21d1ed2adc36	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1849	2015-01-01 06:00:00	2015-01-01 08:41:00	10	landed	\N	f	f	f	f	f
224f3b08-7b46-480e-8170-4bfb58d886fb	c2e13e71-01b7-44fe-b091-5f86ae80c023	482881a6-c848-490b-9565-22468e00c5d7	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	651	2015-01-01 06:00:00	2015-01-01 08:54:00	3	landed	\N	f	f	f	f	f
c4787a98-396a-431f-8069-2173dedb43a7	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	761461d5-643f-4c65-8769-21d1ed2adc36	985	2015-01-01 06:00:00	2015-01-01 09:25:00	3	landed	\N	f	f	f	f	f
196080a1-e724-4b10-b8de-fdf5ddb5414f	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	3b85c138-79ba-401a-a5bd-82bcbfbb7813	1013	2015-01-01 06:00:00	2015-01-01 08:44:00	14	landed	\N	f	f	f	f	f
a61f009e-a11a-4332-8f36-8b1058572fba	56e4aa48-75b2-4da0-9fe0-033ef7008a91	cea35714-d52a-40da-9949-c5ba12469150	e5772f8f-21ce-4944-bcd9-0123a312a113	989	2015-01-01 06:00:00	2015-01-01 09:50:00	12	landed	\N	f	f	f	f	f
f1b53374-efb8-4b9c-8254-63571ce0e7f8	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	e5772f8f-21ce-4944-bcd9-0123a312a113	1192	2015-01-01 06:00:00	2015-01-01 08:35:00	0	cancelled	B	f	f	f	f	f
6aa3895a-36eb-4243-bacb-b054ccbc7aa3	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	e5772f8f-21ce-4944-bcd9-0123a312a113	1121	2015-01-01 06:00:00	2015-01-01 08:14:00	-1	landed	\N	f	f	f	f	f
05ac53dd-61cc-4f7a-83c0-d64e657f5dc5	56e4aa48-75b2-4da0-9fe0-033ef7008a91	566b6db6-eefa-482b-a38b-9842c22c0136	9f7ac324-dbdd-48b7-b465-3f84b98ef945	946	2015-01-01 06:00:00	2015-01-01 08:43:00	31	landed	\N	f	f	t	f	f
905f6e1b-2840-4b94-b1f0-594a10daa706	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	0b753b16-0eac-45df-8db5-70af8de58431	1389	2015-01-01 06:00:00	2015-01-01 10:10:00	-5	landed	\N	f	f	f	f	f
c10918eb-68ce-4056-b328-533a5ddcff88	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0b753b16-0eac-45df-8db5-70af8de58431	e5772f8f-21ce-4944-bcd9-0123a312a113	1389	2015-01-01 06:00:00	2015-01-01 09:05:00	0	cancelled	B	f	f	f	f	f
6feb2c00-2f4d-4e51-98b7-e6ee466e5f31	56e4aa48-75b2-4da0-9fe0-033ef7008a91	39184e8c-153c-4f15-83b7-520dfc412682	962de796-50ec-403e-90e7-dd8cbf8dd135	888	2015-01-01 06:00:00	2015-01-01 09:35:00	-27	landed	\N	f	f	f	f	f
14f88446-e570-4401-b99f-b35fd590e24e	56e4aa48-75b2-4da0-9fe0-033ef7008a91	f2d678b1-8153-46e2-bf8e-aa197ce84aca	e5772f8f-21ce-4944-bcd9-0123a312a113	460	2015-01-01 06:00:00	2015-01-01 07:45:00	3	landed	\N	f	f	f	f	f
623a9b81-0b51-4fc9-8ce1-9f14aaa4d191	56e4aa48-75b2-4da0-9fe0-033ef7008a91	761461d5-643f-4c65-8769-21d1ed2adc36	e5772f8f-21ce-4944-bcd9-0123a312a113	985	2015-01-01 06:00:00	2015-01-01 08:05:00	0	cancelled	B	f	f	f	f	f
999882a0-0d9c-487a-a154-884be10e77ce	56e4aa48-75b2-4da0-9fe0-033ef7008a91	482881a6-c848-490b-9565-22468e00c5d7	e5772f8f-21ce-4944-bcd9-0123a312a113	1464	2015-01-01 06:00:00	2015-01-01 11:30:00	0	cancelled	B	f	f	f	f	f
8229536a-1732-458a-a20c-1f1ff2c3ddcd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	09f62e52-b00e-4cbf-a66f-f1660cbf6c59	e5772f8f-21ce-4944-bcd9-0123a312a113	237	2015-01-01 06:00:00	2015-01-01 07:15:00	-11	landed	\N	f	f	f	f	f
626ac198-0dcb-4274-92f4-a2ac1dd86faa	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0b753b16-0eac-45df-8db5-70af8de58431	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1096	2015-01-01 06:00:00	2015-01-01 09:12:00	50	landed	\N	f	f	t	f	f
b6ea5309-80d4-495c-9a31-a995c272d242	56e4aa48-75b2-4da0-9fe0-033ef7008a91	d60c22b9-7c54-4654-9094-79b67d756de4	e5772f8f-21ce-4944-bcd9-0123a312a113	304	2015-01-01 06:00:00	2015-01-01 07:20:00	-10	landed	\N	f	f	f	f	f
82523720-f8b6-4ca5-8592-44cfcbf34dfd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	0b753b16-0eac-45df-8db5-70af8de58431	1096	2015-01-01 06:00:00	2015-01-01 08:55:00	-9	landed	\N	f	f	f	f	f
3009b866-ed36-48c5-8fb4-b9ac95017458	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ec27c849-ee4d-4f87-818d-5ebf2adab285	e5772f8f-21ce-4944-bcd9-0123a312a113	1055	2015-01-01 06:00:00	2015-01-01 10:40:00	7	landed	\N	f	f	f	f	f
df6666c5-06ab-4ad7-9587-cf2780784144	56e4aa48-75b2-4da0-9fe0-033ef7008a91	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	e5772f8f-21ce-4944-bcd9-0123a312a113	1616	2015-01-01 06:00:00	2015-01-01 11:45:00	-3	landed	\N	f	f	f	f	f
8fe515ff-5ebb-451a-9849-4b0e4e86f880	56e4aa48-75b2-4da0-9fe0-033ef7008a91	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	e5772f8f-21ce-4944-bcd9-0123a312a113	929	2015-01-01 06:00:00	2015-01-01 07:50:00	-20	landed	\N	f	f	f	f	f
11e6d6a6-29ee-4012-a673-0da238a0af88	56e4aa48-75b2-4da0-9fe0-033ef7008a91	5731f612-6da8-41cc-a5a4-af8a8d7689bc	e5772f8f-21ce-4944-bcd9-0123a312a113	1431	2015-01-01 06:00:00	2015-01-01 11:30:00	31	landed	\N	t	f	t	f	f
cfb9cf0e-9ec9-42eb-acaf-2f8c997aaf8d	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ba586dec-e3f7-416b-be7c-7036176fa2a9	9f7ac324-dbdd-48b7-b465-3f84b98ef945	675	2015-01-01 06:00:00	2015-01-01 08:49:00	-13	landed	\N	f	f	f	f	f
41dd3110-92b6-4250-ac9d-1947dbd80821	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	962de796-50ec-403e-90e7-dd8cbf8dd135	1744	2015-01-01 06:00:00	2015-01-01 12:05:00	-26	landed	\N	f	f	f	f	f
33a1f0a9-d49c-48a3-b307-1bb3c2b5a9d3	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b1062708-791a-4d09-aade-7516111fd22d	e5772f8f-21ce-4944-bcd9-0123a312a113	583	2015-01-01 06:00:00	2015-01-01 08:00:00	5	landed	\N	f	f	f	f	f
fd9a313b-35cd-4909-9a45-366f37ba1633	56e4aa48-75b2-4da0-9fe0-033ef7008a91	6c03e7bd-a5b4-4123-a449-14ec67009bab	e5772f8f-21ce-4944-bcd9-0123a312a113	175	2015-01-01 06:00:00	2015-01-01 07:05:00	30	landed	\N	t	f	t	f	f
2bf25c2e-4b03-44d5-a5c5-ec205ebc3a79	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	de24023d-db7f-4fcd-875b-edfcff42b5f5	1448	2015-01-01 06:00:00	2015-01-01 08:54:00	-13	landed	\N	f	f	f	f	f
ea8e19de-0912-4cf2-b094-290b133ff047	94d86c52-5799-48f5-8693-1aea5b7c4d48	859644b5-0093-48fd-b43a-cdcf7efa06fb	de24023d-db7f-4fcd-875b-edfcff42b5f5	261	2015-01-01 06:00:00	2015-01-01 07:13:00	-9	landed	\N	f	f	f	f	f
5809838e-4614-4caf-98df-75ab5130a4c3	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	697	2015-01-01 06:00:00	2015-01-01 08:03:00	-9	landed	\N	f	f	f	f	f
ed033d1f-ea10-4eff-b0b0-3423816d7d2b	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	220d76f8-307b-4240-9335-a0ac5eb6e0b5	671	2015-01-01 06:00:00	2015-01-01 07:59:00	-16	landed	\N	f	f	f	f	f
d219b0dd-5552-4eb4-970d-fcc6f1de52b6	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	569	2015-01-01 06:00:00	2015-01-01 07:42:00	-13	landed	\N	f	f	f	f	f
298e1b44-ecac-45bd-840c-b4313484c202	94d86c52-5799-48f5-8693-1aea5b7c4d48	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	954	2015-01-01 06:00:00	2015-01-01 08:50:00	-9	landed	\N	f	f	f	f	f
655338b5-bbd9-4305-ab21-58e9a559e82a	94d86c52-5799-48f5-8693-1aea5b7c4d48	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1107	2015-01-01 06:00:00	2015-01-01 07:55:00	-12	landed	\N	f	f	f	f	f
4ba37df2-0160-46d0-990c-460bc3fd72ab	94d86c52-5799-48f5-8693-1aea5b7c4d48	39184e8c-153c-4f15-83b7-520dfc412682	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1024	2015-01-01 06:00:00	2015-01-01 08:10:00	-34	landed	\N	f	f	f	f	f
08f1ff9a-ff7d-4ae5-b88d-f5a74cee5898	94d86c52-5799-48f5-8693-1aea5b7c4d48	d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	224	2015-01-01 06:00:00	2015-01-01 07:15:00	3	landed	\N	f	f	f	f	f
179addfc-c0bf-4994-90f3-8b21a06d4a7a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	a99f7a37-e7d1-4518-9900-0a21b2faae74	1074	2015-01-01 06:00:00	2015-01-01 08:41:00	-2	landed	\N	f	f	f	f	f
7cbdf1aa-4e66-4211-9511-48c9852a70bf	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	55f76a81-76d7-45d4-965f-36aec15fdbb0	a99f7a37-e7d1-4518-9900-0a21b2faae74	1028	2015-01-01 06:00:00	2015-01-01 08:34:00	9	landed	\N	f	f	f	f	f
d1017550-f8fb-43ff-a707-6a8133be42fb	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	55f76a81-76d7-45d4-965f-36aec15fdbb0	1028	2015-01-01 06:00:00	2015-01-01 08:58:00	-22	landed	\N	f	f	f	f	f
0d941a15-3cb7-42fc-bfd9-567b08634e2b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	a99f7a37-e7d1-4518-9900-0a21b2faae74	1005	2015-01-01 06:00:00	2015-01-01 08:31:00	-5	landed	\N	f	f	f	f	f
35b92eba-99b8-4bcb-b246-5d8276ba1d1c	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	0b753b16-0eac-45df-8db5-70af8de58431	1076	2015-01-01 06:00:00	2015-01-01 08:41:00	2	landed	\N	f	f	f	f	f
9855cae3-cdeb-4efa-b345-eac3746922ae	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	220d76f8-307b-4240-9335-a0ac5eb6e0b5	b1cb37af-8ae5-43cb-8a89-701e233d582e	353	2015-01-01 06:00:00	2015-01-01 07:20:00	-10	landed	\N	f	f	f	f	f
a3ea0444-b78a-451a-bbcf-cfb097fc2fc4	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	0b753b16-0eac-45df-8db5-70af8de58431	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1076	2015-01-01 06:00:00	2015-01-01 09:03:00	-6	landed	\N	f	f	f	f	f
2761b810-cb30-4406-9e1f-206cf71c3b70	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	761461d5-643f-4c65-8769-21d1ed2adc36	944	2015-01-01 06:00:00	2015-01-01 08:51:00	-19	landed	\N	f	f	f	f	f
29b88e67-958f-41e6-83a4-d60caec764b9	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1065	2015-01-01 06:00:00	2015-01-01 09:00:00	-21	landed	\N	f	f	f	f	f
e0a8ff70-51f6-4ed3-a75e-03a838add06d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	1005	2015-01-01 06:00:00	2015-01-01 09:01:00	-1	landed	\N	f	f	f	f	f
95faf8cb-e3e2-4c5f-90d6-232fe36fed29	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	f9e1cdce-28f5-4e36-9717-71ef3c667d83	a99f7a37-e7d1-4518-9900-0a21b2faae74	1617	2015-01-01 06:00:00	2015-01-01 09:01:00	-5	landed	\N	f	f	f	f	f
45405125-2dcc-44b3-bdf4-da4ccd605f92	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	ba586dec-e3f7-416b-be7c-7036176fa2a9	a99f7a37-e7d1-4518-9900-0a21b2faae74	1182	2015-01-01 06:00:00	2015-01-01 09:48:00	-18	landed	\N	f	f	f	f	f
c47260e9-ba2e-4855-9c5d-7e83379fc289	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	a99f7a37-e7d1-4518-9900-0a21b2faae74	1521	2015-01-01 06:00:00	2015-01-01 10:23:00	-10	landed	\N	f	f	f	f	f
07aa54fd-afdf-4b81-b37d-0a708dc67d0c	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	8b6a15ec-5d97-40a5-b3fe-1a4138e4c3ef	a99f7a37-e7d1-4518-9900-0a21b2faae74	1576	2015-01-01 06:00:00	2015-01-01 08:52:00	15	landed	\N	t	f	t	f	f
71fa10cd-50f7-4ff6-b75a-d90f1ec88612	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	30074e54-879b-4fbe-8a42-9b6d1690cec3	1185	2015-01-01 06:00:00	2015-01-01 08:53:00	-12	landed	\N	f	f	f	f	f
525c9617-6d90-4721-9d84-fbca55071803	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	bb4a1f43-cd49-4548-9c40-68be992ecb81	a99f7a37-e7d1-4518-9900-0a21b2faae74	828	2015-01-01 06:00:00	2015-01-01 08:08:00	8	landed	\N	f	f	f	f	f
14c3077b-9c16-4a34-8e20-0c18e64168e0	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	30074e54-879b-4fbe-8a42-9b6d1690cec3	399	2015-01-01 06:00:00	2015-01-01 07:24:00	1	landed	\N	f	f	f	f	f
dce6d984-2b66-4ba2-8250-1e2002f25995	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a99f7a37-e7d1-4518-9900-0a21b2faae74	1a743a77-55e0-4c53-ab16-765667e2cc37	760	2015-01-01 06:00:00	2015-01-01 08:43:00	-19	landed	\N	f	f	f	f	f
fd279c40-c723-4fa7-a699-563a50651b02	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0b753b16-0eac-45df-8db5-70af8de58431	b334592c-f6aa-405f-b7a2-67d942e3b8ad	502	2015-01-01 06:00:00	2015-01-01 07:58:00	-1	landed	\N	f	f	f	f	f
1f1dadbc-7074-4273-86ca-479d90866074	c2c012a9-4bdf-4b04-ac83-714fbc93b289	04c81e3b-7621-4c9b-b978-e7123b287ce5	cea35714-d52a-40da-9949-c5ba12469150	422	2015-01-01 06:00:00	2015-01-01 08:40:00	18	landed	\N	t	f	f	f	f
feae6a89-0fca-4c79-a6bc-24ad9c9bb737	c2c012a9-4bdf-4b04-ac83-714fbc93b289	30074e54-879b-4fbe-8a42-9b6d1690cec3	a99f7a37-e7d1-4518-9900-0a21b2faae74	187	2015-01-01 06:00:00	2015-01-01 07:20:00	-8	landed	\N	f	f	f	f	f
fda683fa-3daf-4b19-9025-2d98172b5a29	c2c012a9-4bdf-4b04-ac83-714fbc93b289	30074e54-879b-4fbe-8a42-9b6d1690cec3	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1124	2015-01-01 06:00:00	2015-01-01 08:30:00	2	landed	\N	f	f	f	f	f
04babc5a-291b-45bb-8aee-bb1fff350eaa	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0b753b16-0eac-45df-8db5-70af8de58431	1a743a77-55e0-4c53-ab16-765667e2cc37	762	2015-01-01 06:00:00	2015-01-01 08:39:00	-32	landed	\N	f	f	f	f	f
b65e592b-9c99-4c11-95dc-30803decd19d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	962de796-50ec-403e-90e7-dd8cbf8dd135	1a743a77-55e0-4c53-ab16-765667e2cc37	606	2015-01-01 06:00:00	2015-01-01 09:07:00	-21	landed	\N	f	f	f	f	f
6c6688e8-7d55-4f4f-9302-a3f55b1de6fa	c2c012a9-4bdf-4b04-ac83-714fbc93b289	de24023d-db7f-4fcd-875b-edfcff42b5f5	8efb8902-1cf4-4798-a5be-cd86f011f7ed	2519	2015-01-01 06:00:00	2015-01-01 14:17:00	-40	landed	\N	f	f	f	f	f
f1fcd4f2-7567-4682-b0e6-e4bc6191e6e2	c2c012a9-4bdf-4b04-ac83-714fbc93b289	688d65c7-52b5-4d29-9fa9-f9b5cdd52ecf	1a743a77-55e0-4c53-ab16-765667e2cc37	765	2015-01-01 06:00:00	2015-01-01 09:23:00	-32	landed	\N	f	f	f	f	f
22c25963-6f8d-4517-afcc-162632e2941d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1a743a77-55e0-4c53-ab16-765667e2cc37	1587	2015-01-01 06:00:00	2015-01-01 11:27:00	107	landed	\N	f	f	f	f	t
90c47be4-4153-40eb-b53e-baa767831813	c2c012a9-4bdf-4b04-ac83-714fbc93b289	1c343bcf-bfcf-4b75-aa17-b17e0d7441b6	1a743a77-55e0-4c53-ab16-765667e2cc37	271	2015-01-01 06:00:00	2015-01-01 08:09:00	-20	landed	\N	f	f	f	f	f
b18d3f74-2469-4f78-a13d-9aad473938e6	c2c012a9-4bdf-4b04-ac83-714fbc93b289	761461d5-643f-4c65-8769-21d1ed2adc36	cea35714-d52a-40da-9949-c5ba12469150	1931	2015-01-01 06:00:00	2015-01-01 09:04:00	-10	landed	\N	f	f	f	f	f
33f61588-1072-4eef-b6c9-28ac59bbc179	56e4aa48-75b2-4da0-9fe0-033ef7008a91	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	e5772f8f-21ce-4944-bcd9-0123a312a113	1188	2015-01-01 06:00:00	2015-01-01 11:00:00	0	cancelled	B	f	f	f	f	f
dc917494-1616-471c-9ae3-fbf15a3ae80c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	9f7ac324-dbdd-48b7-b465-3f84b98ef945	919	2015-01-01 06:00:00	2015-01-01 08:37:00	-1	landed	\N	f	f	f	f	f
b1a48f20-3048-4875-be50-7576bbebe03b	c2c012a9-4bdf-4b04-ac83-714fbc93b289	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	1a743a77-55e0-4c53-ab16-765667e2cc37	481	2015-01-01 06:00:00	2015-01-01 07:53:00	-28	landed	\N	f	f	f	f	f
32c96259-5487-49c5-9011-abd915283a01	c2c012a9-4bdf-4b04-ac83-714fbc93b289	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1a743a77-55e0-4c53-ab16-765667e2cc37	1947	2015-01-01 06:00:00	2015-01-01 13:10:00	-20	landed	\N	f	f	f	f	f
a0c8caf5-a37e-4656-97e0-0a27c5f6acfc	c2c012a9-4bdf-4b04-ac83-714fbc93b289	30074e54-879b-4fbe-8a42-9b6d1690cec3	1a743a77-55e0-4c53-ab16-765667e2cc37	946	2015-01-01 06:00:00	2015-01-01 09:11:00	-22	landed	\N	f	f	f	f	f
fc21a7b4-f293-4630-87d6-c411ee822870	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ec27c849-ee4d-4f87-818d-5ebf2adab285	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1749	2015-01-01 06:00:00	2015-01-01 12:53:00	-22	landed	\N	f	f	f	f	f
0e06308c-d5b0-471e-8e5f-bb5969366578	c2c012a9-4bdf-4b04-ac83-714fbc93b289	6c03e7bd-a5b4-4123-a449-14ec67009bab	1a743a77-55e0-4c53-ab16-765667e2cc37	761	2015-01-01 06:00:00	2015-01-01 09:04:00	-3	landed	\N	f	f	f	f	f
36eb50ce-f5c9-487f-9dbd-0ec5a5aa4b48	c2c012a9-4bdf-4b04-ac83-714fbc93b289	761461d5-643f-4c65-8769-21d1ed2adc36	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1310	2015-01-01 06:00:00	2015-01-01 08:29:00	-7	landed	\N	f	f	f	f	f
bda485de-77a3-49a4-9760-773d6644086f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	bbf1438c-1470-4b17-8bf3-ec578b328900	1a743a77-55e0-4c53-ab16-765667e2cc37	332	2015-01-01 06:00:00	2015-01-01 08:22:00	-6	landed	\N	f	f	f	f	f
71509812-a368-4937-a0ae-0d697a3e7766	c2c012a9-4bdf-4b04-ac83-714fbc93b289	09f62e52-b00e-4cbf-a66f-f1660cbf6c59	1a743a77-55e0-4c53-ab16-765667e2cc37	674	2015-01-01 06:00:00	2015-01-01 08:58:00	-24	landed	\N	f	f	f	f	f
f713e98c-243f-43d7-971c-c60d90eef340	c2c012a9-4bdf-4b04-ac83-714fbc93b289	566b6db6-eefa-482b-a38b-9842c22c0136	b334592c-f6aa-405f-b7a2-67d942e3b8ad	409	2015-01-01 06:00:00	2015-01-01 07:42:00	-19	landed	\N	f	f	f	f	f
086eab8b-40ef-4814-91a3-a021844367c1	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	3b85c138-79ba-401a-a5bd-82bcbfbb7813	280	2015-01-01 06:00:00	2015-01-01 07:39:00	-21	landed	\N	f	f	f	f	f
6358b20a-dff6-49f7-a4ab-693cc56f196e	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	761461d5-643f-4c65-8769-21d1ed2adc36	0b753b16-0eac-45df-8db5-70af8de58431	950	2015-01-01 06:00:00	2015-01-01 08:25:00	2	landed	\N	f	f	f	f	f
ed331865-e8ac-4296-b57e-d44bfbda8d99	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	a99f7a37-e7d1-4518-9900-0a21b2faae74	1069	2015-01-01 06:00:00	2015-01-01 08:43:00	17	landed	\N	t	f	t	f	f
c48ceca2-b1b5-4efc-bf66-d5bfe3cb4625	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	a99f7a37-e7d1-4518-9900-0a21b2faae74	1598	2015-01-01 06:00:00	2015-01-01 09:02:00	59	landed	\N	t	f	t	f	f
1c82967e-f8ac-4f52-89be-a412d3d26f9a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	399	2015-01-01 06:00:00	2015-01-01 07:47:00	-23	landed	\N	f	f	f	f	f
4262dd74-81c3-497e-af96-fe16b9d0c9f8	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	bc8617dd-fbb3-4254-99e4-8062f48a6913	e5772f8f-21ce-4944-bcd9-0123a312a113	772	2015-01-01 06:00:00	2015-01-01 07:35:00	10	landed	\N	f	f	f	f	f
814abd82-86f0-4cc9-8567-edab19dbe229	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	f3b5244f-b651-4318-a086-bf0b13368c6e	962de796-50ec-403e-90e7-dd8cbf8dd135	843	2015-01-01 06:00:00	2015-01-01 07:53:00	-4	landed	\N	f	f	f	f	f
e8d2ef2f-308e-45d9-a027-e380d9e814b7	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	1cd64d19-7966-446e-bcd3-a02c56e70c12	9b0fc777-7255-49f4-9d33-b1d5500e3298	708	2015-01-01 06:00:00	2015-01-01 08:06:00	85	landed	\N	t	f	f	f	f
d7bce049-305b-4a6d-b10c-dbfbce237a22	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	bbf1438c-1470-4b17-8bf3-ec578b328900	9b0fc777-7255-49f4-9d33-b1d5500e3298	946	2015-01-01 06:00:00	2015-01-01 09:38:00	-20	landed	\N	f	f	f	f	f
e8c54411-44cd-4f37-869d-06246a7ea2a6	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	962de796-50ec-403e-90e7-dd8cbf8dd135	599	2015-01-01 06:00:00	2015-01-01 07:03:00	18	landed	\N	t	f	f	f	f
0afb9b51-9a5d-4270-b320-f3a62ee10e94	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	bc8617dd-fbb3-4254-99e4-8062f48a6913	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	419	2015-01-01 06:00:00	2015-01-01 07:25:00	-2	landed	\N	f	f	f	f	f
1565d550-cad8-4c92-a1ec-93bac277645d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	540e52ce-d36a-4ac1-8400-480bf9b3f095	962de796-50ec-403e-90e7-dd8cbf8dd135	173	2015-01-01 06:00:00	2015-01-01 07:03:00	-10	landed	\N	f	f	f	f	f
04dd6a64-5acc-41f0-9f68-f855fa7ffe17	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0d1af828-7db4-4470-b1ff-ee9d4865dc70	b334592c-f6aa-405f-b7a2-67d942e3b8ad	425	2015-01-01 06:00:00	2015-01-01 07:53:00	-20	landed	\N	f	f	f	f	f
dc42505b-4d65-4973-ab9f-a00164877420	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	dec3c374-7d0d-4aca-a519-60ce9bc79d79	1a743a77-55e0-4c53-ab16-765667e2cc37	341	2015-01-01 06:00:00	2015-01-01 08:19:00	-10	landed	\N	f	f	f	f	f
514e9115-e4a8-45ec-9297-f63c575e122d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	e23e10a4-9363-4f0b-8e90-c05fa6f58a4e	1a743a77-55e0-4c53-ab16-765667e2cc37	399	2015-01-01 06:00:00	2015-01-01 07:32:00	-3	landed	\N	f	f	f	f	f
5981120c-c83c-4518-813f-0738d166e23c	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	20a64773-c733-4a46-b546-488d01d3da98	962de796-50ec-403e-90e7-dd8cbf8dd135	557	2015-01-01 06:00:00	2015-01-01 08:03:00	0	landed	\N	f	f	f	f	f
ce97b4a4-2d76-4e74-b9f9-fa451bcd4fd8	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	dec3c374-7d0d-4aca-a519-60ce9bc79d79	962de796-50ec-403e-90e7-dd8cbf8dd135	677	2015-01-01 06:00:00	2015-01-01 08:14:00	-19	landed	\N	f	f	f	f	f
01f0e0a0-4ba2-410c-b4fd-9fbd8cc41735	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	b9e79daa-2e5b-4acd-a66f-23b1dd4dcace	962de796-50ec-403e-90e7-dd8cbf8dd135	398	2015-01-01 06:00:00	2015-01-01 06:32:00	19	landed	\N	t	f	t	f	f
65e8ac75-1e53-4201-beaa-8b518916ace5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	688d65c7-52b5-4d29-9fa9-f9b5cdd52ecf	962de796-50ec-403e-90e7-dd8cbf8dd135	160	2015-01-01 06:00:00	2015-01-01 07:03:00	0	landed	\N	f	f	f	f	f
8590091b-7c10-4ecb-a895-e4c961cd637b	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	d40a8354-2344-4cc2-8ddf-cdf45bb3c7eb	962de796-50ec-403e-90e7-dd8cbf8dd135	323	2015-01-01 06:00:00	2015-01-01 06:30:00	-11	landed	\N	f	f	f	f	f
c44dff8d-27e3-4db9-8dec-958f064ea0af	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	d1b1cd44-c082-4d96-9eef-1a7f77806293	962de796-50ec-403e-90e7-dd8cbf8dd135	212	2015-01-01 06:00:00	2015-01-01 07:16:00	-3	landed	\N	f	f	f	f	f
0b784b3b-c153-41b4-928e-44fe74c61f47	9e7e7cfc-68ae-4c4f-9721-407f71db5155	20b9da24-7eb2-4374-ba06-002f8475b1f5	39184e8c-153c-4f15-83b7-520dfc412682	679	2015-01-01 06:00:00	2015-01-01 08:00:00	0	cancelled	A	f	f	f	f	f
b7bdd192-4733-41d1-aad8-8aa1ab04abae	9e7e7cfc-68ae-4c4f-9721-407f71db5155	962de796-50ec-403e-90e7-dd8cbf8dd135	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1197	2015-01-01 06:00:00	2015-01-01 10:00:00	0	cancelled	A	f	f	f	f	f
af376f58-a0f8-4ce6-b68f-86ab6d68d5ff	9e7e7cfc-68ae-4c4f-9721-407f71db5155	b37300fc-b095-4e23-b471-de894da310f9	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1062	2015-01-01 06:00:00	2015-01-01 08:55:00	-22	landed	\N	f	f	f	f	f
d6378e3a-c100-4998-b4ae-dc7e2cb85eaf	9e7e7cfc-68ae-4c4f-9721-407f71db5155	17c55660-12f7-499a-9f12-1b1e0d558d03	482881a6-c848-490b-9565-22468e00c5d7	1635	2015-01-01 06:00:00	2015-01-01 08:20:00	-6	landed	\N	f	f	f	f	f
97120bff-276f-422e-8899-9ad47f318dde	9e7e7cfc-68ae-4c4f-9721-407f71db5155	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	39184e8c-153c-4f15-83b7-520dfc412682	1024	2015-01-01 06:00:00	2015-01-01 09:33:00	0	landed	\N	f	f	f	f	f
4a7ed63f-0509-4b1d-9277-6e272bb6125a	9e7e7cfc-68ae-4c4f-9721-407f71db5155	482881a6-c848-490b-9565-22468e00c5d7	17c55660-12f7-499a-9f12-1b1e0d558d03	1635	2015-01-01 06:00:00	2015-01-01 11:45:00	1	landed	\N	f	f	f	f	f
b86f3718-beb2-47b4-b4fd-3cf9e1d8025f	9e7e7cfc-68ae-4c4f-9721-407f71db5155	04c5b1df-8e47-42b7-820a-fa48713830bb	1a743a77-55e0-4c53-ab16-765667e2cc37	701	2015-01-01 06:00:00	2015-01-01 08:19:00	-11	landed	\N	f	f	f	f	f
a821df4a-be94-4691-bc41-660aeaf306fa	9e7e7cfc-68ae-4c4f-9721-407f71db5155	1a743a77-55e0-4c53-ab16-765667e2cc37	04c5b1df-8e47-42b7-820a-fa48713830bb	701	2015-01-01 06:00:00	2015-01-01 07:50:00	24	landed	\N	t	f	t	f	f
0dbd5906-b4d3-4407-a9aa-518ea3b38d9f	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	c5970237-9d8a-46b7-a8b3-e051a8c2f06b	216	2015-01-01 06:00:00	2015-01-01 06:50:00	-4	landed	\N	f	f	f	f	f
08eab4be-0ce2-4510-9125-ac43bdd3831b	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	45794771-7eea-47a1-b5ee-3de26801d071	e5772f8f-21ce-4944-bcd9-0123a312a113	309	2015-01-01 06:00:00	2015-01-01 07:10:00	0	cancelled	B	f	f	f	f	f
b9354461-57a4-46a8-ae2a-3cd5ea9a9b04	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	765ab0c4-cdb9-4cc4-9a53-6d69a669c90d	e5772f8f-21ce-4944-bcd9-0123a312a113	312	2015-01-01 06:00:00	2015-01-01 07:20:00	0	cancelled	B	f	f	f	f	f
5517ad9b-6de1-4089-992f-33ffe380aa5b	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	40a00d0c-5d52-4237-90ad-fafef48deb0b	e5772f8f-21ce-4944-bcd9-0123a312a113	164	2015-01-01 06:00:00	2015-01-01 07:00:00	0	cancelled	B	f	f	f	f	f
3f48a407-2806-471b-be6b-3bc25ff78357	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	30b529a2-d575-423d-908a-2c2f004c560c	e5772f8f-21ce-4944-bcd9-0123a312a113	247	2015-01-01 06:00:00	2015-01-01 07:10:00	0	cancelled	B	f	f	f	f	f
969dff46-c015-4e62-bcaa-659df7e4a80d	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e5772f8f-21ce-4944-bcd9-0123a312a113	84e0f5f0-0776-47b2-8cf0-ffe211e02bac	383	2015-01-01 06:00:00	2015-01-01 07:18:00	0	cancelled	B	f	f	f	f	f
d6e54e50-3236-41ed-bce7-6a91b520ebcf	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	b5855000-75f1-4b3a-a84b-cebfee95bbb2	e5772f8f-21ce-4944-bcd9-0123a312a113	327	2015-01-01 06:00:00	2015-01-01 07:20:00	0	cancelled	B	f	f	f	f	f
2cdc60c3-5408-4ca7-8d64-4602ed73818d	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	05932e22-3166-458e-b741-1ca107a3cb29	e5772f8f-21ce-4944-bcd9-0123a312a113	685	2015-01-01 06:00:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
479013d0-d034-4ca3-8c1b-18be22c260d8	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d32285f3-42ec-4493-8153-c9dc03905db2	e5772f8f-21ce-4944-bcd9-0123a312a113	691	2015-01-01 06:00:00	2015-01-01 08:25:00	0	cancelled	B	f	f	f	f	f
32af81c7-2bdc-4d51-a337-f83bec25e098	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	52ca9d97-f51a-4ed5-9e33-d81ff6752a5a	e5772f8f-21ce-4944-bcd9-0123a312a113	862	2015-01-01 06:00:00	2015-01-01 07:50:00	0	cancelled	B	f	f	f	f	f
4b2fcda4-b887-4efb-93d9-c77434cd8098	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	b6768101-d32f-46b4-ae06-78293040b7b5	a99f7a37-e7d1-4518-9900-0a21b2faae74	427	2015-01-01 06:00:00	2015-01-01 07:35:00	3	landed	\N	f	f	f	f	f
40f74b76-3f23-4bd9-bb7b-442cad1ceceb	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	93b4c991-3f50-4236-996c-4cebe0f962d3	9f7ac324-dbdd-48b7-b465-3f84b98ef945	948	2015-01-01 06:00:00	2015-01-01 08:33:00	-7	landed	\N	f	f	f	f	f
b2976407-53c6-4273-a8c2-cc8bc9ac4c6b	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	179ba040-9e0a-47d3-a863-ced12435fe1a	e5772f8f-21ce-4944-bcd9-0123a312a113	431	2015-01-01 06:00:00	2015-01-01 07:40:00	0	cancelled	B	f	f	f	f	f
5c850aa8-28fc-46e9-9e45-fef9156dc3fc	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e1da04dd-24a9-4aad-9795-bebd413ea88a	e5772f8f-21ce-4944-bcd9-0123a312a113	539	2015-01-01 06:00:00	2015-01-01 07:50:00	0	cancelled	B	f	f	f	f	f
76f1aad8-8cdc-4956-be8b-3da09dc538f5	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	303b54c7-2141-4e68-b3a9-e21ecf926299	e5772f8f-21ce-4944-bcd9-0123a312a113	767	2015-01-01 06:00:00	2015-01-01 07:30:00	0	cancelled	B	f	f	f	f	f
3205ebbd-eb16-4052-8694-4b40c76640c4	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	1c343bcf-bfcf-4b75-aa17-b17e0d7441b6	9f7ac324-dbdd-48b7-b465-3f84b98ef945	530	2015-01-01 06:00:00	2015-01-01 08:43:00	-12	landed	\N	f	f	f	f	f
13b44a6c-1d38-4811-a7f8-9f3675c19943	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	f07d6f3c-7656-45c6-8f0f-b23feea8be32	9f7ac324-dbdd-48b7-b465-3f84b98ef945	661	2015-01-01 06:00:00	2015-01-01 08:57:00	-5	landed	\N	f	f	f	f	f
e0664384-85f7-4f64-a6a2-ef605ce180fc	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	93b4c991-3f50-4236-996c-4cebe0f962d3	e5772f8f-21ce-4944-bcd9-0123a312a113	812	2015-01-01 06:00:00	2015-01-01 07:45:00	0	cancelled	B	f	f	f	f	f
5356d73a-33ac-47d9-b884-039080bc9b8f	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e6926d02-6676-405e-8dbc-fea02edfb321	e5772f8f-21ce-4944-bcd9-0123a312a113	922	2015-01-01 06:00:00	2015-01-01 08:05:00	0	cancelled	B	f	f	f	f	f
b8e3ead6-5cb4-42a3-a23f-e5211bd75789	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	34de70f2-e58d-4605-ae23-b7359144e3a9	e5772f8f-21ce-4944-bcd9-0123a312a113	181	2015-01-01 06:00:00	2015-01-01 07:00:00	0	cancelled	B	f	f	f	f	f
bc065b7f-45c0-4c43-b097-c67a04fc68a1	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	220d76f8-307b-4240-9335-a0ac5eb6e0b5	ec27c849-ee4d-4f87-818d-5ebf2adab285	407	2015-01-01 06:00:00	2015-01-01 07:23:00	-8	landed	\N	f	f	f	f	f
d724fba6-67be-40b3-8f24-a61052abe3d0	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	e5772f8f-21ce-4944-bcd9-0123a312a113	220d76f8-307b-4240-9335-a0ac5eb6e0b5	1457	2015-01-01 06:00:00	2015-01-01 07:58:00	-29	landed	\N	f	f	f	f	f
9dd146b2-c259-402a-b41b-a721b112209c	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	f12c8f72-384b-4d1c-9e3a-c032b411fa40	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	982	2015-01-01 06:00:00	2015-01-01 08:51:00	86	landed	\N	t	f	f	f	f
8680b8b3-c1b5-4f5c-91d8-3726a078152d	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b334592c-f6aa-405f-b7a2-67d942e3b8ad	0b753b16-0eac-45df-8db5-70af8de58431	502	2015-01-01 06:00:00	2015-01-01 07:38:00	58	landed	\N	t	f	f	f	f
9d1d4341-dda4-4686-80d9-fab23208e9bb	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	e5772f8f-21ce-4944-bcd9-0123a312a113	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1119	2015-01-01 06:00:00	2015-01-01 09:39:00	35	landed	\N	t	f	f	f	f
4cc39055-7128-4755-811b-9f43daec4b4a	7d1ea82a-b408-4a79-afe6-313f0e01cc09	5731f612-6da8-41cc-a5a4-af8a8d7689bc	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	373	2015-01-01 06:00:00	2015-01-01 07:30:00	-2	landed	\N	f	f	f	f	f
45fbd47b-ae75-499b-bfaa-086ad856392e	7d1ea82a-b408-4a79-afe6-313f0e01cc09	dab3127c-bcf9-4cbb-8428-2b7e4c0a2bb1	39184e8c-153c-4f15-83b7-520dfc412682	300	2015-01-01 06:00:00	2015-01-01 07:22:00	8	landed	\N	f	f	f	f	f
a4c287b6-f7f4-412f-a6e2-f7d08231fde0	7d1ea82a-b408-4a79-afe6-313f0e01cc09	524390fe-c1a1-4a81-a5a6-4e96d884a0ba	482881a6-c848-490b-9565-22468e00c5d7	751	2015-01-01 06:00:00	2015-01-01 07:14:00	6	landed	\N	f	f	f	f	f
bae47fad-ebcc-42b1-9242-c2c5b3422c8f	7d1ea82a-b408-4a79-afe6-313f0e01cc09	d2f95330-9e45-4c0d-8dba-ca6b8057bd65	962de796-50ec-403e-90e7-dd8cbf8dd135	268	2015-01-01 06:00:00	2015-01-01 07:19:00	-29	landed	\N	f	f	f	f	f
d84504e8-5c49-465d-abd6-da37209bf937	7d1ea82a-b408-4a79-afe6-313f0e01cc09	8da69c37-5a62-48c8-a7fd-815036e76ae4	962de796-50ec-403e-90e7-dd8cbf8dd135	397	2015-01-01 06:00:00	2015-01-01 07:36:00	-4	landed	\N	f	f	f	f	f
58dac438-05e7-4e20-bbc0-965d35a921fb	7d1ea82a-b408-4a79-afe6-313f0e01cc09	32b91b66-a0d0-422e-9ed2-35b540ac687f	962de796-50ec-403e-90e7-dd8cbf8dd135	462	2015-01-01 06:00:00	2015-01-01 07:36:00	2	landed	\N	f	f	f	f	f
30d91cfe-c3b7-49d9-895f-660f5b8cb020	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	482881a6-c848-490b-9565-22468e00c5d7	1504	2015-01-01 06:00:00	2015-01-01 08:09:00	-16	landed	\N	f	f	f	f	f
94979283-78b0-453f-a11a-51f167005ae6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	748	2015-01-01 06:00:00	2015-01-01 08:10:00	3	landed	\N	f	f	f	f	f
adf91ea6-c763-4b6a-ad14-e9f10bdd12f8	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	838	2015-01-01 06:00:00	2015-01-01 08:27:00	-19	landed	\N	f	f	f	f	f
41219e5f-4a58-4419-86f1-365df1d3c204	7d1ea82a-b408-4a79-afe6-313f0e01cc09	5b31756d-4774-4dd4-afc3-0a8afa3d5453	429a6721-5ce1-481e-845d-03a6cc7d4003	153	2015-01-01 06:00:00	2015-01-01 06:58:00	-3	landed	\N	f	f	f	f	f
53d6af5c-6f47-448d-a623-aca124504e7f	7d1ea82a-b408-4a79-afe6-313f0e01cc09	822b29b7-32f8-45ab-a84a-41efbbfbc0d3	962de796-50ec-403e-90e7-dd8cbf8dd135	359	2015-01-01 06:00:00	2015-01-01 06:27:00	0	cancelled	B	f	f	f	f	f
b791a593-1be4-4c6a-8117-340624e1dc80	7d1ea82a-b408-4a79-afe6-313f0e01cc09	5731f612-6da8-41cc-a5a4-af8a8d7689bc	482881a6-c848-490b-9565-22468e00c5d7	86	2015-01-01 06:00:00	2015-01-01 06:52:00	0	cancelled	A	f	f	f	f	f
a70ea08c-f03a-4906-ad47-257974e4302c	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a91dbca0-d0c8-4846-9589-cb86ff1a3874	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	674	2015-01-01 06:00:00	2015-01-01 07:10:00	30	landed	\N	f	f	t	f	f
f238127a-9f90-4ca6-ad09-2b5e16be72af	7d1ea82a-b408-4a79-afe6-313f0e01cc09	47f69410-d216-4249-b351-b26b82b2e9b9	962de796-50ec-403e-90e7-dd8cbf8dd135	174	2015-01-01 06:00:00	2015-01-01 07:04:00	5	landed	\N	f	f	f	f	f
c4c8a8df-7b3a-488b-b05d-31a6dc3c4a31	7d1ea82a-b408-4a79-afe6-313f0e01cc09	71ddb136-cb48-4319-a56b-1e6eb01de1c1	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	86	2015-01-01 06:00:00	2015-01-01 06:51:00	88	landed	\N	t	f	f	f	t
3130a1a3-a1d7-4465-bd2a-03ad2bb882c4	7d1ea82a-b408-4a79-afe6-313f0e01cc09	b47ce9f7-6489-4c48-a03e-52240d45235d	39184e8c-153c-4f15-83b7-520dfc412682	391	2015-01-01 06:00:00	2015-01-01 07:33:00	-1	landed	\N	f	f	f	f	f
fd812ff5-5574-4a8c-b613-b008a948d5aa	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	482881a6-c848-490b-9565-22468e00c5d7	158	2015-01-01 06:00:00	2015-01-01 07:14:00	7	landed	\N	f	f	f	f	f
5d5a9d69-ba15-4603-8edd-ae839ebb720a	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	83d464c6-d4f4-4d26-b638-139e1f71139e	9f7ac324-dbdd-48b7-b465-3f84b98ef945	990	2015-01-01 06:00:00	2015-01-01 08:46:00	-11	landed	\N	f	f	f	f	f
f34030cc-43ac-435d-b097-81d6dd0e7807	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	f71d97bb-4c71-47c5-aca5-616b531d69ee	e5772f8f-21ce-4944-bcd9-0123a312a113	396	2015-01-01 06:00:00	2015-01-01 07:20:00	0	cancelled	B	f	f	f	f	f
e8e28f12-3336-465b-bc5f-90859fd52b7f	7d1ea82a-b408-4a79-afe6-313f0e01cc09	02574c76-bc20-40c0-bd10-518352edbbae	39184e8c-153c-4f15-83b7-520dfc412682	852	2015-01-01 06:00:00	2015-01-01 09:22:00	4	landed	\N	f	f	f	f	f
ceea060d-8b3f-4be7-bbd3-59becb7a701d	7d1ea82a-b408-4a79-afe6-313f0e01cc09	74add686-3a76-4238-bbcf-52a969a17dad	39184e8c-153c-4f15-83b7-520dfc412682	230	2015-01-01 06:00:00	2015-01-01 07:12:00	9	landed	\N	f	f	f	f	f
57046974-d73a-44fb-83e7-fa8660013b01	7d1ea82a-b408-4a79-afe6-313f0e01cc09	190fcb81-39c3-437e-94ec-a0889cc47e9d	482881a6-c848-490b-9565-22468e00c5d7	250	2015-01-01 06:00:00	2015-01-01 07:23:00	10	landed	\N	f	f	f	f	f
5f38e878-3531-448d-93bb-85aa8ebc0bd5	7d1ea82a-b408-4a79-afe6-313f0e01cc09	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	17c55660-12f7-499a-9f12-1b1e0d558d03	216	2015-01-01 06:00:00	2015-01-01 07:08:00	12	landed	\N	f	f	f	f	f
c2ba7063-a8db-46ff-beeb-a3c4a3227ce9	7d1ea82a-b408-4a79-afe6-313f0e01cc09	5a82c79f-b96e-40bc-92be-698bdc9ea36f	962de796-50ec-403e-90e7-dd8cbf8dd135	342	2015-01-01 06:00:00	2015-01-01 07:33:00	-23	landed	\N	f	f	f	f	f
8f236a3f-91b9-4316-b19b-ecddf0d70220	7d1ea82a-b408-4a79-afe6-313f0e01cc09	02574c76-bc20-40c0-bd10-518352edbbae	482881a6-c848-490b-9565-22468e00c5d7	620	2015-01-01 06:00:00	2015-01-01 08:07:00	-1	landed	\N	f	f	f	f	f
a28e4fad-6e8a-479c-a823-13528ce39ccc	7d1ea82a-b408-4a79-afe6-313f0e01cc09	05932e22-3166-458e-b741-1ca107a3cb29	962de796-50ec-403e-90e7-dd8cbf8dd135	196	2015-01-01 06:00:00	2015-01-01 07:08:00	-1	landed	\N	f	f	f	f	f
8f0b7ced-58e8-44f6-bdd1-28b613187c21	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a06592ee-27b6-49b6-baf2-2ba176d3ea9c	482881a6-c848-490b-9565-22468e00c5d7	451	2015-01-01 06:00:00	2015-01-01 07:36:00	-7	landed	\N	f	f	f	f	f
40d39bee-6868-4ed6-84fb-41c1b9c57124	7d1ea82a-b408-4a79-afe6-313f0e01cc09	e5772f8f-21ce-4944-bcd9-0123a312a113	39184e8c-153c-4f15-83b7-520dfc412682	641	2015-01-01 06:00:00	2015-01-01 07:05:00	9	landed	\N	f	f	f	f	f
8743200e-80f1-45c9-957f-32172d21865f	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cca54640-41f3-4508-86e5-78faa9b0d4a2	482881a6-c848-490b-9565-22468e00c5d7	77	2015-01-01 06:00:00	2015-01-01 06:46:00	-12	landed	\N	f	f	f	f	f
1aaa3968-41c4-4c19-8e0f-69691aedae5c	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cea35714-d52a-40da-9949-c5ba12469150	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	590	2015-01-01 06:00:00	2015-01-01 07:12:00	-6	landed	\N	f	f	f	f	f
9823fa8c-769b-4b5f-bff7-dab2de69f726	7d1ea82a-b408-4a79-afe6-313f0e01cc09	652009ea-03c2-464a-b555-62282dd1a8e1	b334592c-f6aa-405f-b7a2-67d942e3b8ad	306	2015-01-01 06:00:00	2015-01-01 07:27:00	-21	landed	\N	f	f	f	f	f
4efa2513-e395-4eb8-bf64-98780f464cb1	7d1ea82a-b408-4a79-afe6-313f0e01cc09	17c03644-1b2c-49ae-b6cd-8d0bde66f820	482881a6-c848-490b-9565-22468e00c5d7	329	2015-01-01 06:00:00	2015-01-01 07:29:00	-6	landed	\N	f	f	f	f	f
9fca64b6-2c48-49ee-a37e-565f169283f4	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	39184e8c-153c-4f15-83b7-520dfc412682	844	2015-01-01 06:00:00	2015-01-01 09:25:00	33	landed	\N	t	f	f	f	f
024fe7c3-ef28-40b0-94f9-9610945b311b	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	9b0fc777-7255-49f4-9d33-b1d5500e3298	2565	2015-01-01 06:01:00	2015-01-01 14:32:00	-23	landed	\N	f	f	f	f	f
f6546d32-cf5e-4859-9a27-b0602bae9d75	9ac91524-737f-47e4-bb51-365a3c0535a8	ec27c849-ee4d-4f87-818d-5ebf2adab285	17c55660-12f7-499a-9f12-1b1e0d558d03	1222	2015-01-01 06:01:00	2015-01-01 10:56:00	-7	landed	\N	f	f	f	f	f
e4b35bc6-d662-4938-845c-308ca804dfe8	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	482881a6-c848-490b-9565-22468e00c5d7	2565	2015-01-01 06:01:00	2015-01-01 09:40:00	-20	landed	\N	f	f	f	f	f
bc37ce81-512e-4edd-b6ee-d58580f0f7ba	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	512aa2f3-0c56-4419-b182-afbc5bdfc6eb	39184e8c-153c-4f15-83b7-520dfc412682	576	2015-01-01 06:01:00	2015-01-01 07:10:00	-9	landed	\N	f	f	f	f	f
61f08202-a48a-4942-a12f-23cb09e6135a	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	82057082-4f10-49c4-b6da-2661f289e6b7	102	2015-01-01 06:01:00	2015-01-01 06:38:00	-2	landed	\N	f	f	f	f	f
0331bcbd-5b25-42cc-88b9-eb586e166ff7	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	482881a6-c848-490b-9565-22468e00c5d7	421	2015-01-01 06:01:00	2015-01-01 07:35:00	17	landed	\N	f	f	f	f	t
19afec5f-fb09-402f-821e-1668970042e2	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	39184e8c-153c-4f15-83b7-520dfc412682	776	2015-01-01 06:01:00	2015-01-01 09:12:00	144	landed	\N	t	f	f	f	t
3947ea94-cb84-4802-916f-3d5f1d26648b	9ac91524-737f-47e4-bb51-365a3c0535a8	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	17c55660-12f7-499a-9f12-1b1e0d558d03	191	2015-01-01 06:02:00	2015-01-01 07:00:00	0	landed	\N	f	f	f	f	f
f93b8cb0-bc15-4e7e-841c-5054ef16d2fd	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	9b0fc777-7255-49f4-9d33-b1d5500e3298	2454	2015-01-01 06:03:00	2015-01-01 14:22:00	-32	landed	\N	f	f	f	f	f
0cfa3271-7e75-43b0-b53c-9aef58947e21	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	482881a6-c848-490b-9565-22468e00c5d7	337	2015-01-01 06:03:00	2015-01-01 07:30:00	-14	landed	\N	f	f	f	f	f
95b682b9-8f9f-42f5-9122-a5f289687b97	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	b37300fc-b095-4e23-b471-de894da310f9	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	288	2015-01-01 06:03:00	2015-01-01 07:25:00	-1	landed	\N	f	f	f	f	f
1bbaeecb-eb00-4ea8-937f-222ce434ae34	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	e6926d02-6676-405e-8dbc-fea02edfb321	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	401	2015-01-01 06:03:00	2015-01-01 07:25:00	7	landed	\N	f	f	f	f	f
9022a57b-93cd-4023-9f64-af59e9f72cfe	9e7e7cfc-68ae-4c4f-9721-407f71db5155	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	39184e8c-153c-4f15-83b7-520dfc412682	602	2015-01-01 06:03:00	2015-01-01 07:50:00	4	landed	\N	f	f	f	f	f
1ee2423a-ae96-410b-898d-a11fb483c8cf	9ac91524-737f-47e4-bb51-365a3c0535a8	5731f612-6da8-41cc-a5a4-af8a8d7689bc	17c55660-12f7-499a-9f12-1b1e0d558d03	1609	2015-01-01 06:05:00	2015-01-01 11:41:00	19	landed	\N	t	f	t	f	f
b490a3a7-7d7b-4f00-bd2b-693c2721184c	9ac91524-737f-47e4-bb51-365a3c0535a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	482881a6-c848-490b-9565-22468e00c5d7	2586	2015-01-01 06:05:00	2015-01-01 09:49:00	-4	landed	\N	f	f	f	f	f
56494ff9-1710-4e47-b2a3-2ae9af49824a	c2e13e71-01b7-44fe-b091-5f86ae80c023	30074e54-879b-4fbe-8a42-9b6d1690cec3	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2300	2015-01-01 06:05:00	2015-01-01 10:14:00	13	landed	\N	f	f	f	f	f
75dbac51-41e2-46fa-8a05-c001f9180d4b	c2e13e71-01b7-44fe-b091-5f86ae80c023	30074e54-879b-4fbe-8a42-9b6d1690cec3	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	728	2015-01-01 06:05:00	2015-01-01 08:32:00	-3	landed	\N	f	f	f	f	f
4406dd70-3384-4c7d-ae64-4d66f78f40c2	c2e13e71-01b7-44fe-b091-5f86ae80c023	b334592c-f6aa-405f-b7a2-67d942e3b8ad	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1145	2015-01-01 06:05:00	2015-01-01 09:11:00	-26	landed	\N	f	f	f	f	f
d0331418-409e-40ba-868a-3d665bdc2439	9ac91524-737f-47e4-bb51-365a3c0535a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	9b0fc777-7255-49f4-9d33-b1d5500e3298	1065	2015-01-01 06:05:00	2015-01-01 08:59:00	-10	landed	\N	f	f	f	f	f
9112a59c-7cba-4594-9bfe-ce2f7c213c57	44d688b1-5f1b-41c3-b767-1526eca22fa7	d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	39184e8c-153c-4f15-83b7-520dfc412682	836	2015-01-01 06:05:00	2015-01-01 09:25:00	-9	landed	\N	f	f	f	f	f
14c50bcf-b14b-48d8-8ae9-e99721f389d8	44d688b1-5f1b-41c3-b767-1526eca22fa7	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	786	2015-01-01 06:05:00	2015-01-01 08:05:00	-22	landed	\N	f	f	f	f	f
2eac190b-fd04-46f0-9fa8-3c3c32e93780	44d688b1-5f1b-41c3-b767-1526eca22fa7	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	39184e8c-153c-4f15-83b7-520dfc412682	819	2015-01-01 06:05:00	2015-01-01 09:25:00	0	landed	\N	f	f	f	f	f
15f7d662-ad4d-489e-975c-bebf7a9d21ea	9ac91524-737f-47e4-bb51-365a3c0535a8	b37300fc-b095-4e23-b471-de894da310f9	9b0fc777-7255-49f4-9d33-b1d5500e3298	404	2015-01-01 06:05:00	2015-01-01 07:36:00	-21	landed	\N	f	f	f	f	f
46cce7c4-58f9-459f-9c40-d9028cc73917	c2e13e71-01b7-44fe-b091-5f86ae80c023	e5772f8f-21ce-4944-bcd9-0123a312a113	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	868	2015-01-01 06:05:00	2015-01-01 07:42:00	8	landed	\N	f	f	f	f	f
e59007b3-a3f4-4c3b-aba0-9dc617424ef8	56e4aa48-75b2-4da0-9fe0-033ef7008a91	31adb60d-b31f-4c27-804c-630d2782c2fd	e5772f8f-21ce-4944-bcd9-0123a312a113	469	2015-01-01 06:05:00	2015-01-01 07:40:00	0	cancelled	B	f	f	f	f	f
02d569eb-4a50-40ad-8945-27d384ce9dfb	56e4aa48-75b2-4da0-9fe0-033ef7008a91	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	e5772f8f-21ce-4944-bcd9-0123a312a113	550	2015-01-01 06:05:00	2015-01-01 08:05:00	-17	landed	\N	f	f	f	f	f
966adb7e-e560-4839-9451-12bca4db1bd9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	2252ada7-ca47-47a3-a183-de83d2aa3cd0	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1045	2015-01-01 06:05:00	2015-01-01 07:50:00	11	landed	\N	f	f	f	f	f
fa6ecd64-c181-4dcd-9a0e-78b170356eca	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	e5772f8f-21ce-4944-bcd9-0123a312a113	853	2015-01-01 06:05:00	2015-01-01 09:00:00	-11	landed	\N	f	f	f	f	f
90c0e2ec-53b9-401d-ae3b-34496962b68e	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	482881a6-c848-490b-9565-22468e00c5d7	679	2015-01-01 06:05:00	2015-01-01 08:10:00	-3	landed	\N	f	f	f	f	f
6927d1a6-43f0-4c7f-a855-4c0af21d69a6	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	ec27c849-ee4d-4f87-818d-5ebf2adab285	867	2015-01-01 06:05:00	2015-01-01 08:25:00	0	landed	\N	f	f	f	f	f
ffccfbe8-137e-4a45-8e36-6f1ea86350d2	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	7fadfa3c-e8a6-4511-8dea-609c2868e8fe	a99f7a37-e7d1-4518-9900-0a21b2faae74	266	2015-01-01 06:05:00	2015-01-01 07:33:00	-16	landed	\N	f	f	f	f	f
2b7024a6-0850-4d25-bbe2-79a838a0c259	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1069	2015-01-01 06:05:00	2015-01-01 09:13:00	-2	landed	\N	f	f	f	f	f
1389bf79-458e-42d6-84a9-a5acf83cf349	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	482881a6-c848-490b-9565-22468e00c5d7	b1cb37af-8ae5-43cb-8a89-701e233d582e	354	2015-01-01 06:05:00	2015-01-01 07:26:00	-14	landed	\N	f	f	f	f	f
c5a42a36-4843-404e-b488-edead5a2380b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	55f76a81-76d7-45d4-965f-36aec15fdbb0	30074e54-879b-4fbe-8a42-9b6d1690cec3	1197	2015-01-01 06:05:00	2015-01-01 08:57:00	28	landed	\N	t	f	t	f	f
bb38cf43-bbf6-4d08-8e7d-27a6200dc635	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	761461d5-643f-4c65-8769-21d1ed2adc36	a99f7a37-e7d1-4518-9900-0a21b2faae74	944	2015-01-01 06:05:00	2015-01-01 08:31:00	10	landed	\N	f	f	f	f	f
31eec915-2201-4d03-bfd4-04ee115c5117	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	761461d5-643f-4c65-8769-21d1ed2adc36	1189	2015-01-01 06:05:00	2015-01-01 08:13:00	88	landed	\N	f	f	f	t	f
93b488a6-96d4-4947-a6cc-59ce84e82229	c2c012a9-4bdf-4b04-ac83-714fbc93b289	9e6d748c-0887-402d-9c56-75882767f180	1a743a77-55e0-4c53-ab16-765667e2cc37	859	2015-01-01 06:05:00	2015-01-01 08:57:00	-26	landed	\N	f	f	f	f	f
a8f88332-b0d8-4adb-abc0-e406cb3871cc	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b6768101-d32f-46b4-ae06-78293040b7b5	1a743a77-55e0-4c53-ab16-765667e2cc37	356	2015-01-01 06:05:00	2015-01-01 07:35:00	39	landed	\N	f	f	t	f	f
02d680c7-d7e8-4b34-be3f-81263e8c5d9f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	cea35714-d52a-40da-9949-c5ba12469150	599	2015-01-01 06:05:00	2015-01-01 08:54:00	-2	landed	\N	f	f	f	f	f
c82fa09f-c0b7-4929-b2de-2fb56b3d479a	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	524390fe-c1a1-4a81-a5a6-4e96d884a0ba	17c55660-12f7-499a-9f12-1b1e0d558d03	936	2015-01-01 06:05:00	2015-01-01 09:27:00	19	landed	\N	t	f	t	f	f
21a80fbb-e501-4e6a-bd00-5780440b8db8	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	eafaffaf-f7f7-42f1-bccb-2cada8cca167	1a743a77-55e0-4c53-ab16-765667e2cc37	565	2015-01-01 06:05:00	2015-01-01 09:01:00	-24	landed	\N	f	f	f	f	f
deb9add8-172d-4a81-bb3e-899fd5d0ef8e	9e7e7cfc-68ae-4c4f-9721-407f71db5155	23cc1784-a84f-46af-ac01-7d2b1f2828cc	39184e8c-153c-4f15-83b7-520dfc412682	977	2015-01-01 06:05:00	2015-01-01 07:02:00	-19	landed	\N	f	f	f	f	f
8d1f5f1b-3f02-493b-99d8-191d2fd5b2cb	9e7e7cfc-68ae-4c4f-9721-407f71db5155	f2d678b1-8153-46e2-bf8e-aa197ce84aca	39184e8c-153c-4f15-83b7-520dfc412682	533	2015-01-01 06:05:00	2015-01-01 06:54:00	6	landed	\N	f	f	f	f	f
1e40687a-7163-4136-8b13-1451a4cd0730	9e7e7cfc-68ae-4c4f-9721-407f71db5155	e5772f8f-21ce-4944-bcd9-0123a312a113	39184e8c-153c-4f15-83b7-520dfc412682	641	2015-01-01 06:05:00	2015-01-01 07:07:00	52	landed	\N	f	f	t	f	f
2e627775-9855-48cb-94f8-a30f2a09be7e	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	aae0a2f1-7573-42fe-a860-02c2f57f7d0e	e5772f8f-21ce-4944-bcd9-0123a312a113	227	2015-01-01 06:05:00	2015-01-01 07:15:00	0	cancelled	B	f	f	f	f	f
0b5da13d-95af-48f5-a756-bd94ab54fec5	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	3ff1b391-99b4-4af9-92a6-594d83192846	e5772f8f-21ce-4944-bcd9-0123a312a113	285	2015-01-01 06:05:00	2015-01-01 07:25:00	0	cancelled	B	f	f	f	f	f
a5aaa2a3-5b79-414b-9381-bee0079a4464	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d8fedfb1-5f17-4f73-9ddd-277e814ec44f	e5772f8f-21ce-4944-bcd9-0123a312a113	113	2015-01-01 06:05:00	2015-01-01 06:50:00	0	cancelled	B	f	f	f	f	f
03031861-5a59-498a-ab67-50229c383ea6	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	921346ea-a085-494e-83d5-82a298dba109	e5772f8f-21ce-4944-bcd9-0123a312a113	89	2015-01-01 06:05:00	2015-01-01 06:50:00	0	cancelled	B	f	f	f	f	f
bf775dbb-f222-4785-9818-47790891dc41	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	eb2b576a-4b25-41a2-905f-e89b9392e040	e5772f8f-21ce-4944-bcd9-0123a312a113	229	2015-01-01 06:05:00	2015-01-01 07:05:00	0	cancelled	B	f	f	f	f	f
fa2b6d0d-7bc6-49c0-8824-00333ac789cc	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	dec3c374-7d0d-4aca-a519-60ce9bc79d79	e5772f8f-21ce-4944-bcd9-0123a312a113	408	2015-01-01 06:05:00	2015-01-01 07:45:00	0	cancelled	B	f	f	f	f	f
bbdb08b3-030c-4cb6-a305-b6881ef17f45	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	5c89a23c-37c7-4379-b07d-e40d325ef99a	100	2015-01-01 06:05:00	2015-01-01 06:41:00	-1	landed	\N	f	f	f	f	f
701232d2-e539-437c-96a6-2f455af53568	7d1ea82a-b408-4a79-afe6-313f0e01cc09	6c03e7bd-a5b4-4123-a449-14ec67009bab	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1187	2015-01-01 06:05:00	2015-01-01 07:24:00	9	landed	\N	f	f	f	f	f
1687301c-91d8-489b-83dc-4f05234098dd	7d1ea82a-b408-4a79-afe6-313f0e01cc09	20a64773-c733-4a46-b546-488d01d3da98	39184e8c-153c-4f15-83b7-520dfc412682	627	2015-01-01 06:05:00	2015-01-01 07:26:00	-3	landed	\N	f	f	f	f	f
2f78cddd-1777-4e57-9c6f-50a1b04d56cf	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	17c55660-12f7-499a-9f12-1b1e0d558d03	1635	2015-01-01 06:06:00	2015-01-01 11:59:00	-2	landed	\N	f	f	f	f	f
d47e1635-aca4-4529-9a39-739813c1af55	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1065	2015-01-01 06:06:00	2015-01-01 09:15:00	-37	landed	\N	f	f	f	f	f
7468d8f8-45ac-41d0-9a92-08d7c99ff0dc	7d1ea82a-b408-4a79-afe6-313f0e01cc09	258b4d56-7b05-432a-a32d-34df9ae32c74	39184e8c-153c-4f15-83b7-520dfc412682	196	2015-01-01 06:06:00	2015-01-01 07:15:00	2	landed	\N	f	f	f	f	f
58d456cb-be03-47f0-8db6-1fc1e01ef6ff	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1084	2015-01-01 06:07:00	2015-01-01 08:53:00	7	landed	\N	f	f	f	f	f
24a76826-9deb-4157-bdd9-6e766b3b4227	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1723b1fc-3769-431f-95e6-be67c2e70497	6f414fc3-f0b1-427d-876d-c554d5a044f0	261	2015-01-01 06:07:00	2015-01-01 07:24:00	-9	landed	\N	f	f	f	f	f
5b3a39d3-bb03-45fb-b362-3f918994dc4f	9ac91524-737f-47e4-bb51-365a3c0535a8	ba586dec-e3f7-416b-be7c-7036176fa2a9	9b0fc777-7255-49f4-9d33-b1d5500e3298	1167	2015-01-01 06:08:00	2015-01-01 10:00:00	-14	landed	\N	f	f	f	f	f
5e18fa0c-8f88-4ec1-8ad9-4e47cf43824c	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	761461d5-643f-4c65-8769-21d1ed2adc36	1005	2015-01-01 06:08:00	2015-01-01 09:51:00	-21	landed	\N	f	f	f	f	f
f0909414-6181-4017-ae6a-1c70b9e8a21b	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	962de796-50ec-403e-90e7-dd8cbf8dd135	642	2015-01-01 06:08:00	2015-01-01 07:25:00	4	landed	\N	f	f	f	f	f
678ca822-d559-4308-9219-dc617aa14dad	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cf5967d7-257b-4f2f-9ca2-6ddd7d3bc0d4	482881a6-c848-490b-9565-22468e00c5d7	462	2015-01-01 06:08:00	2015-01-01 07:50:00	-23	landed	\N	f	f	f	f	f
031fcf7d-f20f-4c70-87ed-0d8d8449befe	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	5c89a23c-37c7-4379-b07d-e40d325ef99a	f1e978f1-35da-4540-827c-2817efca7f67	100	2015-01-01 06:09:00	2015-01-01 06:41:00	-4	landed	\N	f	f	f	f	f
95e4b446-2735-4391-b296-c0056e6323ae	7d1ea82a-b408-4a79-afe6-313f0e01cc09	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	cea35714-d52a-40da-9949-c5ba12469150	584	2015-01-01 06:09:00	2015-01-01 09:11:00	12	landed	\N	f	f	f	f	f
bcc91df0-3f82-4e95-b530-c6c1383aae99	7d1ea82a-b408-4a79-afe6-313f0e01cc09	962de796-50ec-403e-90e7-dd8cbf8dd135	c6f3cb98-82f9-4bba-adc8-5b2d3dfe5739	222	2015-01-01 06:10:00	2015-01-01 08:16:00	-13	landed	\N	f	f	f	f	f
34ce6816-c300-4bdd-90d6-f4881d53c9e2	c2e13e71-01b7-44fe-b091-5f86ae80c023	9b0fc777-7255-49f4-9d33-b1d5500e3298	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	529	2015-01-01 06:10:00	2015-01-01 08:11:00	15	landed	\N	t	f	t	f	f
10b1e0e0-249a-4e1c-b7dd-bdd3e310873b	44d688b1-5f1b-41c3-b767-1526eca22fa7	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	566b6db6-eefa-482b-a38b-9842c22c0136	1999	2015-01-01 06:10:00	2015-01-01 12:20:00	-24	landed	\N	f	f	f	f	f
79880b86-fb61-49a7-810d-82e602f2bed4	9ac91524-737f-47e4-bb51-365a3c0535a8	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	2306	2015-01-01 06:10:00	2015-01-01 14:04:00	-29	landed	\N	f	f	f	f	f
51df354e-2838-426e-a614-c27bffbeac89	9ac91524-737f-47e4-bb51-365a3c0535a8	ec27c849-ee4d-4f87-818d-5ebf2adab285	482881a6-c848-490b-9565-22468e00c5d7	414	2015-01-01 06:10:00	2015-01-01 07:46:00	-20	landed	\N	f	f	f	f	f
45c303b9-d3a0-449c-9a65-53359b23ecd9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1121	2015-01-01 06:10:00	2015-01-01 09:53:00	-18	landed	\N	f	f	f	f	f
d1159566-17ae-47f3-be50-bb55cc67eaed	56e4aa48-75b2-4da0-9fe0-033ef7008a91	67e7149b-55f5-43f7-93f2-87921e81cb81	e5772f8f-21ce-4944-bcd9-0123a312a113	631	2015-01-01 06:10:00	2015-01-01 08:25:00	0	cancelled	B	f	f	f	f	f
d0d7c32e-a8ea-45db-92b0-8c2861372005	56e4aa48-75b2-4da0-9fe0-033ef7008a91	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	e5772f8f-21ce-4944-bcd9-0123a312a113	868	2015-01-01 06:10:00	2015-01-01 09:25:00	-6	landed	\N	f	f	f	f	f
ff705538-8630-490c-bec9-77f3040f5be4	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1258	2015-01-01 06:10:00	2015-01-01 09:46:00	-17	landed	\N	f	f	f	f	f
dca39d39-d775-474c-8b2f-326783ceb538	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	1592	2015-01-01 06:10:00	2015-01-01 11:45:00	-11	landed	\N	f	f	f	f	f
06e6a623-d01f-4dd1-8e89-af1e6d9e4111	94d86c52-5799-48f5-8693-1aea5b7c4d48	220d76f8-307b-4240-9335-a0ac5eb6e0b5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	671	2015-01-01 06:10:00	2015-01-01 08:09:00	-8	landed	\N	f	f	f	f	f
6e450617-1a6f-4920-ac21-b1beb7e1d30a	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	954	2015-01-01 06:10:00	2015-01-01 08:45:00	-4	landed	\N	f	f	f	f	f
fe4693c7-291e-4af1-bb14-0e6b266bcb05	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	413	2015-01-01 06:10:00	2015-01-01 08:01:00	-24	landed	\N	f	f	f	f	f
87807e16-c5ff-4ebb-9ae5-bf62f011a603	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	a99f7a37-e7d1-4518-9900-0a21b2faae74	2475	2015-01-01 06:10:00	2015-01-01 14:24:00	-11	landed	\N	f	f	f	f	f
1f59c021-3ada-4805-a355-4c4d8cf7d207	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	b0bacb84-e58a-492c-a93a-0cd54194c0b1	899	2015-01-01 06:10:00	2015-01-01 08:45:00	-14	landed	\N	f	f	f	f	f
9dcd4093-8c04-4ff5-ba43-737f22f80edc	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b334592c-f6aa-405f-b7a2-67d942e3b8ad	30074e54-879b-4fbe-8a42-9b6d1690cec3	632	2015-01-01 06:10:00	2015-01-01 08:08:00	-35	landed	\N	f	f	f	f	f
32b69435-3891-4fe6-b679-b624b91f38b6	56e4aa48-75b2-4da0-9fe0-033ef7008a91	67e7149b-55f5-43f7-93f2-87921e81cb81	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1797	2015-01-01 06:10:00	2015-01-01 08:55:00	-8	landed	\N	f	f	f	f	f
7a09225b-f8b4-4c81-be50-47017ef9a5b1	c2c012a9-4bdf-4b04-ac83-714fbc93b289	3b85c138-79ba-401a-a5bd-82bcbfbb7813	1a743a77-55e0-4c53-ab16-765667e2cc37	666	2015-01-01 06:10:00	2015-01-01 08:45:00	-31	landed	\N	f	f	f	f	f
3ef5686a-3a19-4b39-a5f6-ae0c0fb49cc3	c2c012a9-4bdf-4b04-ac83-714fbc93b289	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1276	2015-01-01 06:10:00	2015-01-01 10:16:00	93	landed	\N	f	f	f	f	t
3833faad-2a3e-433b-9609-c8024e165d1d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1046	2015-01-01 06:10:00	2015-01-01 07:53:00	19	landed	\N	t	f	t	f	f
4bcb36df-da11-47a4-a7e7-cba1518a235a	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	1b8ab136-ce1c-4b4d-92b9-9dd5e162d2b8	17c55660-12f7-499a-9f12-1b1e0d558d03	528	2015-01-01 06:10:00	2015-01-01 08:09:00	-3	landed	\N	f	f	f	f	f
5f8fc526-a4dc-41b6-ab82-b33eb5acf2ce	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	c5f11208-41b3-4eaf-9e99-2780f49cea86	39184e8c-153c-4f15-83b7-520dfc412682	152	2015-01-01 06:10:00	2015-01-01 07:09:00	12	landed	\N	f	f	f	f	f
045aaaad-6709-41dc-ad7d-dcaa5351b785	9e7e7cfc-68ae-4c4f-9721-407f71db5155	9f7ac324-dbdd-48b7-b465-3f84b98ef945	0b753b16-0eac-45df-8db5-70af8de58431	1096	2015-01-01 06:10:00	2015-01-01 09:05:00	40	landed	\N	t	f	t	f	f
5f17ac41-4e84-4fbd-8373-a34875b7a289	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	9f7ac324-dbdd-48b7-b465-3f84b98ef945	825	2015-01-01 06:10:00	2015-01-01 08:51:00	-15	landed	\N	f	f	f	f	f
71fc261f-abf2-46e3-b205-9fe4f104b726	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	b334592c-f6aa-405f-b7a2-67d942e3b8ad	0b753b16-0eac-45df-8db5-70af8de58431	502	2015-01-01 06:10:00	2015-01-01 07:55:00	-25	landed	\N	f	f	f	f	f
931a6828-0f6c-4132-bbe4-fcc563f78170	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	83514dc0-7e7a-4058-a13b-ae4b8168cd27	9f7ac324-dbdd-48b7-b465-3f84b98ef945	802	2015-01-01 06:10:00	2015-01-01 08:46:00	-4	landed	\N	f	f	f	f	f
d48799b9-c493-4772-b039-12b46aff0b42	7d1ea82a-b408-4a79-afe6-313f0e01cc09	e9fa394f-420d-4bc5-a251-67558f858b3f	39184e8c-153c-4f15-83b7-520dfc412682	604	2015-01-01 06:10:00	2015-01-01 07:23:00	-29	landed	\N	f	f	f	f	f
387a8797-75fb-4cf2-9edb-d717ad07e7b2	56e4aa48-75b2-4da0-9fe0-033ef7008a91	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1068	2015-01-01 06:11:00	2015-01-01 10:00:00	-28	landed	\N	f	f	f	f	f
66fef137-c5b6-42d0-b00b-e32abbc17bca	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1237	2015-01-01 06:11:00	2015-01-01 09:44:00	-20	landed	\N	f	f	f	f	f
1e9998cd-582c-42ee-8efc-dade50363f55	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	6d2a5bb6-4c68-4b97-bae2-b0fb46c23ae0	17c55660-12f7-499a-9f12-1b1e0d558d03	262	2015-01-01 06:12:00	2015-01-01 07:25:00	28	landed	\N	t	f	f	f	f
d5d8bde8-7c7f-4086-8c5b-4dee3c578e63	7d1ea82a-b408-4a79-afe6-313f0e01cc09	45794771-7eea-47a1-b5ee-3de26801d071	39184e8c-153c-4f15-83b7-520dfc412682	563	2015-01-01 06:12:00	2015-01-01 07:08:00	0	cancelled	B	f	f	f	f	f
1c3444da-c69a-4bbd-96f6-3c57fc8bebf9	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	ec27c849-ee4d-4f87-818d-5ebf2adab285	236	2015-01-01 06:13:00	2015-01-01 07:21:00	-9	landed	\N	f	f	f	f	f
a4159e24-ec71-46bd-9f38-06a6b482c115	9ac91524-737f-47e4-bb51-365a3c0535a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	962de796-50ec-403e-90e7-dd8cbf8dd135	1739	2015-01-01 06:14:00	2015-01-01 12:09:00	-13	landed	\N	f	f	f	f	f
42e451b8-bd7f-48b6-88e7-f6ae7d5baafa	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	2252ada7-ca47-47a3-a183-de83d2aa3cd0	1598	2015-01-01 06:14:00	2015-01-01 10:57:00	-23	landed	\N	f	f	f	f	f
81a0b6a6-ad6d-49f9-8cdf-ec35fbc247ea	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	f1e978f1-35da-4540-827c-2817efca7f67	163	2015-01-01 06:14:00	2015-01-01 06:56:00	11	landed	\N	f	f	f	f	f
f2ab1757-c204-4768-a035-b7b0e77fa6cc	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a06592ee-27b6-49b6-baf2-2ba176d3ea9c	cea35714-d52a-40da-9949-c5ba12469150	618	2015-01-01 06:14:00	2015-01-01 09:09:00	-10	landed	\N	f	f	f	f	f
805a0ff8-52d6-49b6-b1b4-2da40f4713cb	c2e13e71-01b7-44fe-b091-5f86ae80c023	04c81e3b-7621-4c9b-b978-e7123b287ce5	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	601	2015-01-01 06:15:00	2015-01-01 09:02:00	-5	landed	\N	f	f	f	f	f
7f39fbbe-6e71-4504-9bbf-4597b9f2a4a6	c2e13e71-01b7-44fe-b091-5f86ae80c023	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	1773	2015-01-01 06:15:00	2015-01-01 12:03:00	-7	landed	\N	f	f	f	f	f
0c903d40-c54b-4d3f-9a48-87ac32accddc	44d688b1-5f1b-41c3-b767-1526eca22fa7	83d464c6-d4f4-4d26-b638-139e1f71139e	1a743a77-55e0-4c53-ab16-765667e2cc37	447	2015-01-01 06:15:00	2015-01-01 08:05:00	116	landed	\N	f	f	t	f	f
89b512c2-56b0-4753-b919-d6aeeb8e4db4	44d688b1-5f1b-41c3-b767-1526eca22fa7	30b529a2-d575-423d-908a-2c2f004c560c	1a743a77-55e0-4c53-ab16-765667e2cc37	696	2015-01-01 06:15:00	2015-01-01 09:05:00	-7	landed	\N	f	f	f	f	f
11990575-cde1-48ab-a6ad-302769b80e28	44d688b1-5f1b-41c3-b767-1526eca22fa7	30b529a2-d575-423d-908a-2c2f004c560c	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1020	2015-01-01 06:15:00	2015-01-01 08:10:00	-4	landed	\N	f	f	f	f	f
5168b9d7-7ba0-4680-954b-2b0b297a0697	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b334592c-f6aa-405f-b7a2-67d942e3b8ad	e5772f8f-21ce-4944-bcd9-0123a312a113	986	2015-01-01 06:15:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
fde04948-2ac8-4220-bdbb-5c8edfc83f9b	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	a99f7a37-e7d1-4518-9900-0a21b2faae74	187	2015-01-01 06:15:00	2015-01-01 07:30:00	-13	landed	\N	f	f	f	f	f
0a38ff53-cbff-44cf-aa8b-9ccd7f1cee1c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	1192	2015-01-01 06:15:00	2015-01-01 09:59:00	0	cancelled	B	f	f	f	f	f
53702cc8-ab8a-4b06-80e3-3521f44ea736	56e4aa48-75b2-4da0-9fe0-033ef7008a91	8efb8902-1cf4-4798-a5be-cd86f011f7ed	e5772f8f-21ce-4944-bcd9-0123a312a113	852	2015-01-01 06:15:00	2015-01-01 09:00:00	-6	landed	\N	f	f	f	f	f
b60919db-56c9-423a-8f91-26689e3a59d3	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	6c3137e1-55f5-4a91-8ded-3918052a1cc2	978	2015-01-01 06:15:00	2015-01-01 08:50:00	-5	landed	\N	f	f	f	f	f
8e45c857-553b-4507-8fd7-26f4c39f4e60	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	9e6d748c-0887-402d-9c56-75882767f180	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	313	2015-01-01 06:15:00	2015-01-01 07:55:00	-23	landed	\N	f	f	f	f	f
da7e2f1d-a42f-4fdb-9320-21d64e446c8e	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	2252ada7-ca47-47a3-a183-de83d2aa3cd0	30074e54-879b-4fbe-8a42-9b6d1690cec3	1674	2015-01-01 06:15:00	2015-01-01 09:22:00	90	landed	\N	t	f	t	f	f
a17b3f5f-92c1-4e2b-b5c2-eb8c8ec499f5	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	9b0fc777-7255-49f4-9d33-b1d5500e3298	1065	2015-01-01 06:15:00	2015-01-01 09:00:00	8	landed	\N	f	f	f	f	f
8f943200-1105-4c0a-811d-e8afd1d65e2e	c2c012a9-4bdf-4b04-ac83-714fbc93b289	e1da04dd-24a9-4aad-9795-bebd413ea88a	1a743a77-55e0-4c53-ab16-765667e2cc37	302	2015-01-01 06:15:00	2015-01-01 08:23:00	-13	landed	\N	f	f	f	f	f
e3139c7b-8312-45ff-86ed-d7132f9f0846	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	cea35714-d52a-40da-9949-c5ba12469150	626	2015-01-01 06:15:00	2015-01-01 09:16:00	-10	landed	\N	f	f	f	f	f
580a610a-0aa3-4810-b530-f16d0896e285	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ec27c849-ee4d-4f87-818d-5ebf2adab285	cea35714-d52a-40da-9949-c5ba12469150	368	2015-01-01 06:15:00	2015-01-01 08:41:00	-13	landed	\N	f	f	f	f	f
226f7a78-c3c6-4634-a5ca-ab833047699f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	b334592c-f6aa-405f-b7a2-67d942e3b8ad	405	2015-01-01 06:15:00	2015-01-01 07:55:00	3	landed	\N	f	f	f	f	f
6db7148a-d68f-4b46-b36b-55365bce3391	c2c012a9-4bdf-4b04-ac83-714fbc93b289	5731f612-6da8-41cc-a5a4-af8a8d7689bc	cea35714-d52a-40da-9949-c5ba12469150	532	2015-01-01 06:15:00	2015-01-01 08:53:00	16	landed	\N	t	f	f	f	f
30aebd1f-803c-4427-9c6e-ae7878f79ae5	c2c012a9-4bdf-4b04-ac83-714fbc93b289	39184e8c-153c-4f15-83b7-520dfc412682	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1123	2015-01-01 06:15:00	2015-01-01 11:19:00	-44	landed	\N	f	f	f	f	f
6ad7182c-0d87-42bb-8552-04b793287efc	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	1a743a77-55e0-4c53-ab16-765667e2cc37	2139	2015-01-01 06:15:00	2015-01-01 13:45:00	-3	landed	\N	f	f	f	f	f
f9ce2d18-b1ab-4fb6-bdd3-fe9ba1ff245e	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0b753b16-0eac-45df-8db5-70af8de58431	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1020	2015-01-01 06:15:00	2015-01-01 08:24:00	-4	landed	\N	f	f	f	f	f
fbe164f2-86ee-4abb-9a0d-da7cf2d5735a	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	ff245f13-d27e-4dd0-9472-1cd88206e14c	e5772f8f-21ce-4944-bcd9-0123a312a113	140	2015-01-01 06:15:00	2015-01-01 07:10:00	376	landed	\N	t	f	t	f	f
5ed9580b-4d34-4611-a41c-9726ea67406d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	720a0e7a-2938-4e87-9ba7-bc3d3d8aaaff	e5772f8f-21ce-4944-bcd9-0123a312a113	482	2015-01-01 06:15:00	2015-01-01 07:50:00	-24	landed	\N	f	f	f	f	f
655142e3-2976-4d6f-ab51-e5aff009efb1	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	a811dfec-18db-40c5-8e1b-ff5da24e69ff	206104eb-761d-4b8b-aede-50875a9e52e5	69	2015-01-01 06:15:00	2015-01-01 07:00:00	-11	landed	\N	f	f	f	f	f
6582fb61-aff1-491b-9ffc-11999dfc4d89	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	c53ed55a-6259-43dd-a050-6288e2e5a045	17c55660-12f7-499a-9f12-1b1e0d558d03	925	2015-01-01 06:15:00	2015-01-01 08:07:00	36	landed	\N	t	f	t	f	f
f975f414-e695-4aef-970b-cbe1eae0fc87	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	bbf1438c-1470-4b17-8bf3-ec578b328900	17c55660-12f7-499a-9f12-1b1e0d558d03	468	2015-01-01 06:15:00	2015-01-01 08:05:00	9	landed	\N	f	f	f	f	f
0ea5195b-12a4-4090-a998-3089f8c8fe2b	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0a227934-9832-4e9d-84fb-a25775ba12fb	1a743a77-55e0-4c53-ab16-765667e2cc37	147	2015-01-01 06:15:00	2015-01-01 08:06:00	-12	landed	\N	f	f	f	f	f
778e7c25-6a1d-447a-9f0d-cb8209b09d1a	9e7e7cfc-68ae-4c4f-9721-407f71db5155	cea35714-d52a-40da-9949-c5ba12469150	39184e8c-153c-4f15-83b7-520dfc412682	391	2015-01-01 06:15:00	2015-01-01 07:47:00	14	landed	\N	f	f	f	f	f
6aeba259-920a-42e3-a539-81ff857afbee	9e7e7cfc-68ae-4c4f-9721-407f71db5155	b1062708-791a-4d09-aade-7516111fd22d	39184e8c-153c-4f15-83b7-520dfc412682	472	2015-01-01 06:15:00	2015-01-01 07:00:00	-12	landed	\N	f	f	f	f	f
2cdb1cc3-2b56-495f-b366-a83a277be068	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	20a64773-c733-4a46-b546-488d01d3da98	e5772f8f-21ce-4944-bcd9-0123a312a113	968	2015-01-01 06:15:00	2015-01-01 09:15:00	0	cancelled	B	f	f	f	f	f
119f7b0f-3499-4066-af7e-75bd5ade5046	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	a99f7a37-e7d1-4518-9900-0a21b2faae74	213	2015-01-01 06:15:00	2015-01-01 07:18:00	161	landed	\N	f	t	t	f	f
af4134f5-9edd-44f2-a3d1-ba9b7d613c7d	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	0db05805-32e6-4ba0-8bca-331176bc84b3	e5772f8f-21ce-4944-bcd9-0123a312a113	821	2015-01-01 06:15:00	2015-01-01 08:55:00	0	cancelled	B	f	f	f	f	f
3139696b-6db2-4f3c-8512-8722e6d39e47	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	83d464c6-d4f4-4d26-b638-139e1f71139e	0b753b16-0eac-45df-8db5-70af8de58431	479	2015-01-01 06:15:00	2015-01-01 07:50:00	-20	landed	\N	f	f	f	f	f
e09d9ae2-325b-415c-9bb2-33c3d0009bfa	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a7946155-316f-4605-9fba-aa1573f8be86	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	156	2015-01-01 06:15:00	2015-01-01 07:26:00	-9	landed	\N	f	f	f	f	f
62546d89-988f-47c4-a59b-f284dd794a09	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	17c55660-12f7-499a-9f12-1b1e0d558d03	809	2015-01-01 06:15:00	2015-01-01 09:34:00	13	landed	\N	f	f	f	f	f
26436505-9be4-4880-8b5f-4e2c0afa9525	7d1ea82a-b408-4a79-afe6-313f0e01cc09	220d76f8-307b-4240-9335-a0ac5eb6e0b5	cea35714-d52a-40da-9949-c5ba12469150	588	2015-01-01 06:15:00	2015-01-01 09:05:00	-1	landed	\N	f	f	f	f	f
45f86255-6398-4a15-b5e7-8f561599fd1f	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1f51d41f-c8eb-4fcc-afd0-1bbf4c2db7e1	39184e8c-153c-4f15-83b7-520dfc412682	113	2015-01-01 06:15:00	2015-01-01 07:08:00	11	landed	\N	f	f	f	f	f
a0fd5318-8753-4218-9fd4-848953b785ea	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	109	2015-01-01 06:15:00	2015-01-01 07:07:00	-5	landed	\N	f	f	f	f	f
0df68cd6-c177-4b14-a464-6952b31c1819	7d1ea82a-b408-4a79-afe6-313f0e01cc09	23dd7561-2551-4bf1-9274-493b57d1bbfe	482881a6-c848-490b-9565-22468e00c5d7	238	2015-01-01 06:15:00	2015-01-01 07:50:00	-10	landed	\N	f	f	f	f	f
32f819b5-f4a3-4952-83c0-cd4c33f2f462	7d1ea82a-b408-4a79-afe6-313f0e01cc09	16b0b050-f3b0-4368-81ff-0c483cdd7b06	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	351	2015-01-01 06:15:00	2015-01-01 07:39:00	56	landed	\N	t	f	f	f	t
76ea3c13-58d6-4442-9430-a2d067fcd98a	7d1ea82a-b408-4a79-afe6-313f0e01cc09	cca54640-41f3-4508-86e5-78faa9b0d4a2	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	598	2015-01-01 06:15:00	2015-01-01 09:01:00	-15	landed	\N	f	f	f	f	f
53200e90-8bea-42e2-9e2a-47498e117402	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	493	2015-01-01 06:15:00	2015-01-01 08:55:00	10	landed	\N	f	f	f	f	f
aefde89a-b0c4-4d86-81bd-ea3a73914eb5	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	8efb8902-1cf4-4798-a5be-cd86f011f7ed	962de796-50ec-403e-90e7-dd8cbf8dd135	334	2015-01-01 06:16:00	2015-01-01 07:45:00	-19	landed	\N	f	f	f	f	f
3079d953-9483-4497-ab7a-da70574bc9d1	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	e5772f8f-21ce-4944-bcd9-0123a312a113	962de796-50ec-403e-90e7-dd8cbf8dd135	802	2015-01-01 06:16:00	2015-01-01 08:35:00	-17	landed	\N	f	f	f	f	f
e3f725db-596f-4d5a-95f9-6690c5b1a5cd	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ed52e6fd-070d-458f-8f88-76e3835e2f83	39184e8c-153c-4f15-83b7-520dfc412682	516	2015-01-01 06:17:00	2015-01-01 07:17:00	-9	landed	\N	f	f	f	f	f
bd4c7485-fa91-470d-a748-7e1aa61a1883	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	c5970237-9d8a-46b7-a8b3-e051a8c2f06b	f1e978f1-35da-4540-827c-2817efca7f67	216	2015-01-01 06:18:00	2015-01-01 07:07:00	1	landed	\N	f	f	f	f	f
680ee786-e3fb-43f4-94f8-55820f00dccd	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	55f76a81-76d7-45d4-965f-36aec15fdbb0	0b753b16-0eac-45df-8db5-70af8de58431	1035	2015-01-01 06:19:00	2015-01-01 08:57:00	11	landed	\N	f	f	f	f	f
f36e264b-9856-4b38-b485-1adbefae1902	7d1ea82a-b408-4a79-afe6-313f0e01cc09	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	962de796-50ec-403e-90e7-dd8cbf8dd135	1041	2015-01-01 06:19:00	2015-01-01 09:11:00	-3	landed	\N	f	f	f	f	f
136c53b0-dea0-4985-a0f0-50fd615b824e	9ac91524-737f-47e4-bb51-365a3c0535a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	17c55660-12f7-499a-9f12-1b1e0d558d03	965	2015-01-01 06:20:00	2015-01-01 08:11:00	-5	landed	\N	f	f	f	f	f
645e951d-b65c-4ac7-81ba-764bc28618cd	c2e13e71-01b7-44fe-b091-5f86ae80c023	c0da7786-cefb-463a-a6d5-57260bfb6019	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	546	2015-01-01 06:20:00	2015-01-01 08:19:00	4	landed	\N	f	f	f	f	f
0964b460-3e37-49b8-ba29-129d562c052d	9ac91524-737f-47e4-bb51-365a3c0535a8	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	962de796-50ec-403e-90e7-dd8cbf8dd135	1721	2015-01-01 06:20:00	2015-01-01 12:16:00	-28	landed	\N	f	f	f	f	f
3a84b157-2124-4e62-83b3-51e00d6d299d	44d688b1-5f1b-41c3-b767-1526eca22fa7	83d464c6-d4f4-4d26-b638-139e1f71139e	b0bacb84-e58a-492c-a93a-0cd54194c0b1	973	2015-01-01 06:20:00	2015-01-01 09:10:00	-9	landed	\N	f	f	f	f	f
22123678-61cb-45b9-a966-5cb541613cfb	44d688b1-5f1b-41c3-b767-1526eca22fa7	ec27c849-ee4d-4f87-818d-5ebf2adab285	30b529a2-d575-423d-908a-2c2f004c560c	1235	2015-01-01 06:20:00	2015-01-01 11:10:00	-2	landed	\N	f	f	f	f	f
c1a5bcc5-aa4d-49aa-926e-443dddb87245	44d688b1-5f1b-41c3-b767-1526eca22fa7	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	761461d5-643f-4c65-8769-21d1ed2adc36	1072	2015-01-01 06:20:00	2015-01-01 09:30:00	-4	landed	\N	f	f	f	f	f
bc6224c8-17f7-46d4-8307-40ac196a257c	44d688b1-5f1b-41c3-b767-1526eca22fa7	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	566b6db6-eefa-482b-a38b-9842c22c0136	2295	2015-01-01 06:20:00	2015-01-01 14:15:00	-23	landed	\N	f	f	f	f	f
1bd3ef80-007a-4ae2-9c25-710a9ba2cf5a	44d688b1-5f1b-41c3-b767-1526eca22fa7	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	1728	2015-01-01 06:20:00	2015-01-01 12:30:00	-29	landed	\N	f	f	f	f	f
775a002c-3f63-4041-b5a5-4eb6f0199085	44d688b1-5f1b-41c3-b767-1526eca22fa7	5731f612-6da8-41cc-a5a4-af8a8d7689bc	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	647	2015-01-01 06:20:00	2015-01-01 09:20:00	-10	landed	\N	f	f	f	f	f
8f04d40f-9c15-4109-9c20-718a0c391803	9ac91524-737f-47e4-bb51-365a3c0535a8	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	39184e8c-153c-4f15-83b7-520dfc412682	853	2015-01-01 06:20:00	2015-01-01 09:45:00	-9	landed	\N	f	f	f	f	f
1855ddf1-9265-4d64-b6c4-6bf0596de527	9ac91524-737f-47e4-bb51-365a3c0535a8	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	9b0fc777-7255-49f4-9d33-b1d5500e3298	2425	2015-01-01 06:20:00	2015-01-01 14:40:00	-42	landed	\N	f	f	f	f	f
7ef13fc4-c6c7-4982-abf6-320265f13af7	c2e13e71-01b7-44fe-b091-5f86ae80c023	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	621	2015-01-01 06:20:00	2015-01-01 09:13:00	-9	landed	\N	f	f	f	f	f
1e9ad8fe-46ff-48ff-b0a6-589cc785e2de	56e4aa48-75b2-4da0-9fe0-033ef7008a91	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	e5772f8f-21ce-4944-bcd9-0123a312a113	1438	2015-01-01 06:20:00	2015-01-01 11:55:00	0	cancelled	B	f	f	f	f	f
600173a6-e183-4a97-8664-8db1ac9267db	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	30074e54-879b-4fbe-8a42-9b6d1690cec3	1562	2015-01-01 06:20:00	2015-01-01 10:45:00	-5	landed	\N	f	f	f	f	f
04d92914-4759-43b4-a9ab-21f646478a0d	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	e5772f8f-21ce-4944-bcd9-0123a312a113	1171	2015-01-01 06:20:00	2015-01-01 11:25:00	-24	landed	\N	f	f	f	f	f
580ed66a-eecf-457d-bd3a-f3b23d7826e5	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	e5772f8f-21ce-4944-bcd9-0123a312a113	1235	2015-01-01 06:20:00	2015-01-01 11:20:00	-1	landed	\N	f	f	f	f	f
c4560ad3-d82e-4535-a43f-9997e6e521d0	94d86c52-5799-48f5-8693-1aea5b7c4d48	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	956	2015-01-01 06:20:00	2015-01-01 09:00:00	-10	landed	\N	f	f	f	f	f
0522f3f8-0bd8-4e47-9069-cc513a2adc5c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b6768101-d32f-46b4-ae06-78293040b7b5	9f7ac324-dbdd-48b7-b465-3f84b98ef945	700	2015-01-01 06:20:00	2015-01-01 08:30:00	10	landed	\N	f	f	f	f	f
c6aa7399-60b0-439f-926b-197d62c12374	c2c012a9-4bdf-4b04-ac83-714fbc93b289	dabdd0c5-e0a4-4a99-97ac-fcec7b9faf8d	1a743a77-55e0-4c53-ab16-765667e2cc37	749	2015-01-01 06:20:00	2015-01-01 08:51:00	-10	landed	\N	f	f	f	f	f
9077d702-e756-4965-abf2-25bb19e64126	c2c012a9-4bdf-4b04-ac83-714fbc93b289	761461d5-643f-4c65-8769-21d1ed2adc36	1a743a77-55e0-4c53-ab16-765667e2cc37	404	2015-01-01 06:20:00	2015-01-01 07:51:00	-9	landed	\N	f	f	f	f	f
c309a782-a50b-4478-973b-93ff8a68849d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	8efb8902-1cf4-4798-a5be-cd86f011f7ed	931	2015-01-01 06:20:00	2015-01-01 08:05:00	6	landed	\N	f	f	f	f	f
3df81c95-45c1-40d2-9f9a-bc6aa87596f7	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	e6926d02-6676-405e-8dbc-fea02edfb321	17c55660-12f7-499a-9f12-1b1e0d558d03	878	2015-01-01 06:20:00	2015-01-01 08:01:00	24	landed	\N	t	f	t	f	f
613c5eec-7a27-4a94-8e37-8cd79f7c3ab9	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	84e0f5f0-0776-47b2-8cf0-ffe211e02bac	1a743a77-55e0-4c53-ab16-765667e2cc37	448	2015-01-01 06:20:00	2015-01-01 08:48:00	-14	landed	\N	f	f	f	f	f
5dd801ea-0ec7-461b-80ba-504b7364328e	9e7e7cfc-68ae-4c4f-9721-407f71db5155	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	8efb8902-1cf4-4798-a5be-cd86f011f7ed	908	2015-01-01 06:20:00	2015-01-01 08:05:00	-15	landed	\N	f	f	f	f	f
7d9d57a6-c936-4737-9a08-073d2b005761	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	1cd64d19-7966-446e-bcd3-a02c56e70c12	e5772f8f-21ce-4944-bcd9-0123a312a113	925	2015-01-01 06:20:00	2015-01-01 08:25:00	0	cancelled	B	f	f	f	f	f
6190be79-33e8-4e16-a363-fbb280a6ce13	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	2b4fcd88-145c-4b4b-a2d0-c2b5f8d82e49	e5772f8f-21ce-4944-bcd9-0123a312a113	561	2015-01-01 06:20:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
8cf74562-1943-4aeb-9f0e-b240b46801e1	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	933	2015-01-01 06:20:00	2015-01-01 08:40:00	-12	landed	\N	f	f	f	f	f
f754bfed-cfa7-4e10-aed4-874dab91cb86	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	e5772f8f-21ce-4944-bcd9-0123a312a113	8efb8902-1cf4-4798-a5be-cd86f011f7ed	852	2015-01-01 06:20:00	2015-01-01 08:39:00	-5	landed	\N	f	f	f	f	f
997f5d3d-85c4-41ae-bbb1-8fd66672e9e3	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	cea35714-d52a-40da-9949-c5ba12469150	541	2015-01-01 06:20:00	2015-01-01 09:06:00	9	landed	\N	f	f	f	f	f
4debf67d-28a3-418a-88f4-255a48b87575	7d1ea82a-b408-4a79-afe6-313f0e01cc09	512aa2f3-0c56-4419-b182-afbc5bdfc6eb	8efb8902-1cf4-4798-a5be-cd86f011f7ed	546	2015-01-01 06:20:00	2015-01-01 08:17:00	-7	landed	\N	f	f	f	f	f
8c820893-b1d4-4b48-b01a-2369d5b08313	7d1ea82a-b408-4a79-afe6-313f0e01cc09	8730d59f-9661-4df5-aaaf-5bc5caf97dad	39184e8c-153c-4f15-83b7-520dfc412682	594	2015-01-01 06:20:00	2015-01-01 08:18:00	3	landed	\N	f	f	f	f	f
351a38cb-b3e0-4b80-b2c0-b4d221459d03	9ac91524-737f-47e4-bb51-365a3c0535a8	761461d5-643f-4c65-8769-21d1ed2adc36	17c55660-12f7-499a-9f12-1b1e0d558d03	854	2015-01-01 06:21:00	2015-01-01 07:54:00	20	landed	\N	t	f	t	f	f
2244fb04-7a03-433b-a60a-fabece21d5fe	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	474	2015-01-01 06:21:00	2015-01-01 08:14:00	-11	landed	\N	f	f	f	f	f
266886b5-79a7-434a-aca8-1cfdd7ceb524	9e7e7cfc-68ae-4c4f-9721-407f71db5155	98bddb1c-570d-4ef0-8172-289c12db59d1	39184e8c-153c-4f15-83b7-520dfc412682	524	2015-01-01 06:22:00	2015-01-01 07:55:00	-12	landed	\N	f	f	f	f	f
6012028f-bb0f-408c-91ac-a22af2001463	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	cea35714-d52a-40da-9949-c5ba12469150	501	2015-01-01 06:22:00	2015-01-01 09:10:00	12	landed	\N	f	f	f	f	f
2a048ed2-311b-4a05-be2d-00cb0a1da78d	7d1ea82a-b408-4a79-afe6-313f0e01cc09	32b91b66-a0d0-422e-9ed2-35b540ac687f	39184e8c-153c-4f15-83b7-520dfc412682	483	2015-01-01 06:22:00	2015-01-01 07:12:00	-2	landed	\N	f	f	f	f	f
0441a4ab-16ca-41e9-a0d9-c3b26685f190	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	17c55660-12f7-499a-9f12-1b1e0d558d03	962de796-50ec-403e-90e7-dd8cbf8dd135	925	2015-01-01 06:23:00	2015-01-01 08:55:00	-15	landed	\N	f	f	f	f	f
14a290ec-b068-46ef-8e67-7fff385f19bf	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	17c55660-12f7-499a-9f12-1b1e0d558d03	1400	2015-01-01 06:24:00	2015-01-01 09:23:00	-3	landed	\N	f	f	f	f	f
330351d9-8098-4c45-bb3a-59c81843b46d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	12d5c993-ac8c-4b1f-ba44-022a0387f073	b334592c-f6aa-405f-b7a2-67d942e3b8ad	201	2015-01-01 06:24:00	2015-01-01 07:50:00	-31	landed	\N	f	f	f	f	f
76cf512e-370a-4eff-8acc-38324f47a91b	c2e13e71-01b7-44fe-b091-5f86ae80c023	b0bacb84-e58a-492c-a93a-0cd54194c0b1	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	631	2015-01-01 06:25:00	2015-01-01 08:22:00	-10	landed	\N	f	f	f	f	f
5438c41e-aff2-4e81-b82e-c10b2f1715fa	9ac91524-737f-47e4-bb51-365a3c0535a8	9f7ac324-dbdd-48b7-b465-3f84b98ef945	9b0fc777-7255-49f4-9d33-b1d5500e3298	1085	2015-01-01 06:25:00	2015-01-01 09:26:00	3	landed	\N	f	f	f	f	f
09a4a455-b6c0-45db-a961-4387fbf335f5	44d688b1-5f1b-41c3-b767-1526eca22fa7	39184e8c-153c-4f15-83b7-520dfc412682	1a743a77-55e0-4c53-ab16-765667e2cc37	1199	2015-01-01 06:25:00	2015-01-01 11:20:00	-19	landed	\N	f	f	f	f	f
b2199268-52fe-4ef3-ac6e-751ec6563e13	44d688b1-5f1b-41c3-b767-1526eca22fa7	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1444	2015-01-01 06:25:00	2015-01-01 09:25:00	11	landed	\N	f	f	f	f	f
e404cb02-b77e-4b58-86b4-c587ca25f923	c2e13e71-01b7-44fe-b091-5f86ae80c023	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	3b85c138-79ba-401a-a5bd-82bcbfbb7813	2402	2015-01-01 06:25:00	2015-01-01 14:24:00	-17	landed	\N	f	f	f	f	f
9a970c37-3567-4a42-bf0f-29427f05a5ed	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	e5772f8f-21ce-4944-bcd9-0123a312a113	1172	2015-01-01 06:25:00	2015-01-01 08:55:00	17	landed	\N	t	f	f	f	f
cc2957fc-4316-4902-853a-ed7206979cfe	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	1242	2015-01-01 06:25:00	2015-01-01 11:20:00	0	cancelled	A	f	f	f	f	f
3afdc09a-a043-476c-8b24-729f0a0e2cb3	56e4aa48-75b2-4da0-9fe0-033ef7008a91	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	e5772f8f-21ce-4944-bcd9-0123a312a113	936	2015-01-01 06:25:00	2015-01-01 08:20:00	7	landed	\N	f	f	f	f	f
ced57a23-eb14-477a-8428-eb5930fcc1a9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	3b85c138-79ba-401a-a5bd-82bcbfbb7813	e5772f8f-21ce-4944-bcd9-0123a312a113	1303	2015-01-01 06:25:00	2015-01-01 09:20:00	167	landed	\N	t	f	t	f	f
cb4bf826-4f78-4fd3-ac31-4c94ad229a53	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	936	2015-01-01 06:25:00	2015-01-01 09:45:00	-18	landed	\N	f	f	f	f	f
366a2b6a-e6af-4c97-9c9e-922eda3b477e	56e4aa48-75b2-4da0-9fe0-033ef7008a91	1a743a77-55e0-4c53-ab16-765667e2cc37	e5772f8f-21ce-4944-bcd9-0123a312a113	731	2015-01-01 06:25:00	2015-01-01 07:55:00	0	cancelled	B	f	f	f	f	f
8cdd2105-1ab2-4572-835f-96936c8f2aa4	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b6768101-d32f-46b4-ae06-78293040b7b5	e5772f8f-21ce-4944-bcd9-0123a312a113	1061	2015-01-01 06:25:00	2015-01-01 08:40:00	5	landed	\N	f	f	f	f	f
5690b63c-9799-4506-b875-9441684c6591	56e4aa48-75b2-4da0-9fe0-033ef7008a91	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	e5772f8f-21ce-4944-bcd9-0123a312a113	247	2015-01-01 06:25:00	2015-01-01 07:35:00	-22	landed	\N	f	f	f	f	f
91085106-e790-4d82-a6d8-b4a5b7ffc9e1	94d86c52-5799-48f5-8693-1aea5b7c4d48	859644b5-0093-48fd-b43a-cdcf7efa06fb	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1533	2015-01-01 06:25:00	2015-01-01 10:50:00	4	landed	\N	f	f	f	f	f
5b0070fe-2284-4367-aec7-bcd4f58b0138	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	30074e54-879b-4fbe-8a42-9b6d1690cec3	1237	2015-01-01 06:25:00	2015-01-01 09:25:00	5	landed	\N	f	f	f	f	f
3d39ab63-9edc-49f5-bf99-1ecb9cc3612b	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	30074e54-879b-4fbe-8a42-9b6d1690cec3	1249	2015-01-01 06:25:00	2015-01-01 09:23:00	3	landed	\N	f	f	f	f	f
735cb2ec-afb0-4730-9374-37771cc22861	c2c012a9-4bdf-4b04-ac83-714fbc93b289	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1a743a77-55e0-4c53-ab16-765667e2cc37	594	2015-01-01 06:25:00	2015-01-01 08:25:00	-19	landed	\N	f	f	f	f	f
43c948ae-e7e6-4dc9-8471-f1ac4d856cf7	c2c012a9-4bdf-4b04-ac83-714fbc93b289	566b6db6-eefa-482b-a38b-9842c22c0136	8efb8902-1cf4-4798-a5be-cd86f011f7ed	936	2015-01-01 06:25:00	2015-01-01 08:16:00	36	landed	\N	f	f	t	f	f
51a5f152-e951-4ccd-94d3-a5554d5b074e	c2c012a9-4bdf-4b04-ac83-714fbc93b289	2eb593b9-ce84-445a-8f29-43ca50011299	1a743a77-55e0-4c53-ab16-765667e2cc37	620	2015-01-01 06:25:00	2015-01-01 08:51:00	-35	landed	\N	f	f	f	f	f
1ead7b90-3094-4d2a-8162-7fcacffdfd8f	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	30074e54-879b-4fbe-8a42-9b6d1690cec3	200	2015-01-01 06:25:00	2015-01-01 07:33:00	-11	landed	\N	f	f	f	f	f
6d4762d0-9e76-48c7-b91b-dd6f56f97d93	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	2d0c2680-6ca2-481d-b4cf-9600455afd6b	b334592c-f6aa-405f-b7a2-67d942e3b8ad	301	2015-01-01 06:25:00	2015-01-01 07:52:00	-25	landed	\N	f	f	f	f	f
929832f2-7dee-4f2b-a7b4-088b0b4f4522	9e7e7cfc-68ae-4c4f-9721-407f71db5155	d72a8b54-64ed-4da1-be3b-22bc25ac5ed2	39184e8c-153c-4f15-83b7-520dfc412682	836	2015-01-01 06:25:00	2015-01-01 09:37:00	-6	landed	\N	f	f	f	f	f
b0066337-6382-495c-bcd4-9aa7c5df5c52	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d40a8354-2344-4cc2-8ddf-cdf45bb3c7eb	e5772f8f-21ce-4944-bcd9-0123a312a113	785	2015-01-01 06:25:00	2015-01-01 08:05:00	0	cancelled	B	f	f	f	f	f
3b3f3a65-46a5-4a97-8507-abb4152503cb	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	1b8ab136-ce1c-4b4d-92b9-9dd5e162d2b8	e5772f8f-21ce-4944-bcd9-0123a312a113	641	2015-01-01 06:25:00	2015-01-01 08:40:00	0	cancelled	B	f	f	f	f	f
2bf8a4bd-90f0-4e88-b4da-d8d77e3f1806	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	566b6db6-eefa-482b-a38b-9842c22c0136	962de796-50ec-403e-90e7-dd8cbf8dd135	622	2015-01-01 06:25:00	2015-01-01 07:34:00	4	landed	\N	f	f	f	f	f
6026a8fe-0ac8-4c2c-a6a2-fe02de597aa2	7d1ea82a-b408-4a79-afe6-313f0e01cc09	509444be-70dd-401a-a056-319e65f49b1c	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	455	2015-01-01 06:25:00	2015-01-01 08:55:00	12	landed	\N	f	f	f	f	f
aff37b1b-5286-4263-8990-90c104390220	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a7946155-316f-4605-9fba-aa1573f8be86	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	509	2015-01-01 06:25:00	2015-01-01 09:06:00	-11	landed	\N	f	f	f	f	f
a3f941d6-ae19-443f-9eca-b76cae8baed4	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	1c343bcf-bfcf-4b75-aa17-b17e0d7441b6	17c55660-12f7-499a-9f12-1b1e0d558d03	489	2015-01-01 06:26:00	2015-01-01 08:12:00	-4	landed	\N	f	f	f	f	f
d74a35c5-cc0e-47ea-93ce-bd2b39e79220	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	39184e8c-153c-4f15-83b7-520dfc412682	73	2015-01-01 06:26:00	2015-01-01 07:19:00	-9	landed	\N	f	f	f	f	f
34df42d6-eaaf-41a5-bb8b-f8bd5f7291c8	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	b37300fc-b095-4e23-b471-de894da310f9	962de796-50ec-403e-90e7-dd8cbf8dd135	315	2015-01-01 06:27:00	2015-01-01 06:54:00	-10	landed	\N	f	f	f	f	f
a3dc7d20-460b-451d-bc97-79fb06c2d90e	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	82057082-4f10-49c4-b6da-2661f289e6b7	f1e978f1-35da-4540-827c-2817efca7f67	102	2015-01-01 06:28:00	2015-01-01 07:00:00	-9	landed	\N	f	f	f	f	f
896dec22-df27-4a94-be79-d53f5031e8b6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	08e27f04-a143-4d91-8e46-9fb5bf1ecf7b	cea35714-d52a-40da-9949-c5ba12469150	175	2015-01-01 06:28:00	2015-01-01 07:20:00	1	landed	\N	f	f	f	f	f
08949adf-728a-4dd7-a30a-5d61a8b1f34f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	1a743a77-55e0-4c53-ab16-765667e2cc37	1892	2015-01-01 06:29:00	2015-01-01 13:30:00	-19	landed	\N	f	f	f	f	f
7a783eb1-5836-4230-9ba1-07f0eda641d7	9ac91524-737f-47e4-bb51-365a3c0535a8	9e6d748c-0887-402d-9c56-75882767f180	962de796-50ec-403e-90e7-dd8cbf8dd135	783	2015-01-01 06:30:00	2015-01-01 08:09:00	5	landed	\N	f	f	f	f	f
1d87bb65-b125-4b2e-91cb-156adf439de0	c2e13e71-01b7-44fe-b091-5f86ae80c023	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	370	2015-01-01 06:30:00	2015-01-01 08:49:00	4	landed	\N	f	f	f	f	f
d133f676-8510-4755-a3d8-0d09fa7947fd	c2e13e71-01b7-44fe-b091-5f86ae80c023	9b0fc777-7255-49f4-9d33-b1d5500e3298	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2133	2015-01-01 06:30:00	2015-01-01 10:11:00	22	landed	\N	t	f	f	f	f
bb74ec7e-d6fd-4221-8b8e-b080375328af	c2e13e71-01b7-44fe-b091-5f86ae80c023	3b85c138-79ba-401a-a5bd-82bcbfbb7813	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	449	2015-01-01 06:30:00	2015-01-01 08:14:00	-2	landed	\N	f	f	f	f	f
0adda9d8-37d4-4880-acd3-d77c99a3fe0a	9ac91524-737f-47e4-bb51-365a3c0535a8	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	17c55660-12f7-499a-9f12-1b1e0d558d03	140	2015-01-01 06:30:00	2015-01-01 07:31:00	20	landed	\N	f	f	t	f	f
ed59e0e0-110a-47af-b8ef-822fef245b6f	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	9b0fc777-7255-49f4-9d33-b1d5500e3298	2565	2015-01-01 06:30:00	2015-01-01 14:59:00	55	landed	\N	f	f	t	f	f
942d852c-c814-40ae-97db-9458a45245d4	7d1ea82a-b408-4a79-afe6-313f0e01cc09	04c81e3b-7621-4c9b-b978-e7123b287ce5	482881a6-c848-490b-9565-22468e00c5d7	192	2015-01-01 06:30:00	2015-01-01 07:43:00	-6	landed	\N	f	f	f	f	f
14ef0760-8358-4312-b1e8-e509cde0b042	44d688b1-5f1b-41c3-b767-1526eca22fa7	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	1733	2015-01-01 06:30:00	2015-01-01 12:30:00	-9	landed	\N	f	f	f	f	f
8538ee55-e4de-49a5-af27-c43f3727b5ee	44d688b1-5f1b-41c3-b767-1526eca22fa7	2252ada7-ca47-47a3-a183-de83d2aa3cd0	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	1237	2015-01-01 06:30:00	2015-01-01 08:40:00	3	landed	\N	f	f	f	f	f
534b1c1a-2e04-48fc-a32a-c33aed599aef	9ac91524-737f-47e4-bb51-365a3c0535a8	f1e978f1-35da-4540-827c-2817efca7f67	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2556	2015-01-01 06:30:00	2015-01-01 14:08:00	-15	landed	\N	f	f	f	f	f
006af944-8a31-4824-a838-e1ecb6d017f6	c2e13e71-01b7-44fe-b091-5f86ae80c023	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	3b85c138-79ba-401a-a5bd-82bcbfbb7813	449	2015-01-01 06:30:00	2015-01-01 08:03:00	-1	landed	\N	f	f	f	f	f
33aeef2f-4a03-4de2-9e74-9bac14dd24d1	c2e13e71-01b7-44fe-b091-5f86ae80c023	a99f7a37-e7d1-4518-9900-0a21b2faae74	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2153	2015-01-01 06:30:00	2015-01-01 10:18:00	5	landed	\N	f	f	f	f	f
e2fb9b8b-685e-4e8c-9f9a-308afa550975	c2e13e71-01b7-44fe-b091-5f86ae80c023	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	304	2015-01-01 06:30:00	2015-01-01 08:53:00	7	landed	\N	f	f	f	f	f
eb498c7a-c180-4bd3-9791-b81a8ddb07ed	c2e13e71-01b7-44fe-b091-5f86ae80c023	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	325	2015-01-01 06:30:00	2015-01-01 08:44:00	156	landed	\N	f	f	f	f	t
3ce2b19a-d5b8-43f5-8d95-c33115895857	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	650	2015-01-01 06:30:00	2015-01-01 08:35:00	-11	landed	\N	f	f	f	f	f
1397baec-4c4e-4aac-b76f-4d3aafdd440e	56e4aa48-75b2-4da0-9fe0-033ef7008a91	55f76a81-76d7-45d4-965f-36aec15fdbb0	962de796-50ec-403e-90e7-dd8cbf8dd135	1144	2015-01-01 06:30:00	2015-01-01 08:40:00	8	landed	\N	f	f	f	f	f
8a525ded-e8d6-4450-a233-9df070d4b819	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9b0fc777-7255-49f4-9d33-b1d5500e3298	e5772f8f-21ce-4944-bcd9-0123a312a113	1372	2015-01-01 06:30:00	2015-01-01 09:35:00	10	landed	\N	f	f	f	f	f
fb15e4e8-4762-464a-90a5-917ddacda295	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	b664eb7f-b715-4ccf-ac71-99d8e352cdf7	548	2015-01-01 06:30:00	2015-01-01 08:12:00	-10	landed	\N	f	f	f	f	f
be6ae510-0ce6-4a61-a3e8-10625c3da6a5	94d86c52-5799-48f5-8693-1aea5b7c4d48	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1050	2015-01-01 06:30:00	2015-01-01 09:30:00	-9	landed	\N	f	f	f	f	f
6e1bc850-0707-499b-abbb-23745eaa8f1e	94d86c52-5799-48f5-8693-1aea5b7c4d48	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	933	2015-01-01 06:30:00	2015-01-01 09:10:00	-8	landed	\N	f	f	f	f	f
7c52443c-96d0-4071-a940-f4d9ee5ac088	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2475	2015-01-01 06:30:00	2015-01-01 09:47:00	4	landed	\N	f	f	f	f	f
a5886de6-1d4a-453b-9066-d77183ae78ed	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	0b753b16-0eac-45df-8db5-70af8de58431	761461d5-643f-4c65-8769-21d1ed2adc36	950	2015-01-01 06:30:00	2015-01-01 09:31:00	-30	landed	\N	f	f	f	f	f
ca300497-d651-4b94-b5de-fcef8e3e04d9	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	1074	2015-01-01 06:30:00	2015-01-01 09:45:00	-17	landed	\N	f	f	f	f	f
220bb171-d729-470e-b816-ddfbd83d07d7	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	12d5c993-ac8c-4b1f-ba44-022a0387f073	496	2015-01-01 06:30:00	2015-01-01 08:28:00	2	landed	\N	f	f	f	f	f
429e0b3a-71aa-4678-ae31-594641ee2d05	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	a99f7a37-e7d1-4518-9900-0a21b2faae74	2586	2015-01-01 06:30:00	2015-01-01 14:55:00	-20	landed	\N	f	f	f	f	f
80705801-b451-447e-820e-445c7b7bae23	c2c012a9-4bdf-4b04-ac83-714fbc93b289	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1a743a77-55e0-4c53-ab16-765667e2cc37	907	2015-01-01 06:30:00	2015-01-01 10:08:00	-16	landed	\N	f	f	f	f	f
2c1531d7-19b9-4f0a-adbb-fd2133db460d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	1a743a77-55e0-4c53-ab16-765667e2cc37	813	2015-01-01 06:30:00	2015-01-01 09:37:00	-22	landed	\N	f	f	f	f	f
4fd752c8-1b43-431c-97c7-8e878cea49d6	c2c012a9-4bdf-4b04-ac83-714fbc93b289	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	1a743a77-55e0-4c53-ab16-765667e2cc37	1184	2015-01-01 06:30:00	2015-01-01 11:25:00	-7	landed	\N	f	f	f	f	f
0f52a8dc-f6f8-48b8-90fe-ecbc86b08ff7	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1a743a77-55e0-4c53-ab16-765667e2cc37	594	2015-01-01 06:30:00	2015-01-01 08:45:00	-31	landed	\N	f	f	f	f	f
eb787345-f281-429e-be40-fcf640f50cda	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ba586dec-e3f7-416b-be7c-7036176fa2a9	0b753b16-0eac-45df-8db5-70af8de58431	1183	2015-01-01 06:30:00	2015-01-01 10:18:00	-3	landed	\N	f	f	f	f	f
f1829f4d-e570-4074-8a65-91a0566128e0	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1a743a77-55e0-4c53-ab16-765667e2cc37	2182	2015-01-01 06:30:00	2015-01-01 14:05:00	13	landed	\N	f	f	f	f	f
13e8737a-b407-4005-97ab-d568dbf2613d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	9b0fc777-7255-49f4-9d33-b1d5500e3298	1a743a77-55e0-4c53-ab16-765667e2cc37	746	2015-01-01 06:30:00	2015-01-01 09:17:00	-38	landed	\N	f	f	f	f	f
070ca96f-6080-4bed-b810-b01ac10bd6b7	c2c012a9-4bdf-4b04-ac83-714fbc93b289	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	1a743a77-55e0-4c53-ab16-765667e2cc37	406	2015-01-01 06:30:00	2015-01-01 07:58:00	-15	landed	\N	f	f	f	f	f
adeef749-a31a-42fa-9c0d-02c9780175cb	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	9e74d204-1f26-4a59-b9ca-208f2c579075	e5772f8f-21ce-4944-bcd9-0123a312a113	270	2015-01-01 06:30:00	2015-01-01 07:40:00	1	landed	\N	f	f	f	f	f
9df8f3aa-ad42-478d-be5f-a7bef0ae3007	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	100	2015-01-01 06:30:00	2015-01-01 07:27:00	-7	landed	\N	f	f	f	f	f
90388d5d-9256-45fd-a665-7a169751a74e	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	9b0fc777-7255-49f4-9d33-b1d5500e3298	bb4a1f43-cd49-4548-9c40-68be992ecb81	820	2015-01-01 06:30:00	2015-01-01 09:09:00	-13	landed	\N	f	f	f	f	f
4addba7d-bec3-4b05-874e-be926bd5a842	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	b55b8136-9a81-4e22-b2b8-b54ea6695d72	17c55660-12f7-499a-9f12-1b1e0d558d03	376	2015-01-01 06:30:00	2015-01-01 07:57:00	-5	landed	\N	f	f	f	f	f
ae87f32a-c7d6-4d44-bb4e-fe1a44feb554	9e7e7cfc-68ae-4c4f-9721-407f71db5155	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	39184e8c-153c-4f15-83b7-520dfc412682	1506	2015-01-01 06:30:00	2015-01-01 08:35:00	69	landed	\N	f	f	t	f	f
f0a3b62a-cca6-4655-a7b3-fcb2f14f1a5e	9e7e7cfc-68ae-4c4f-9721-407f71db5155	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	39184e8c-153c-4f15-83b7-520dfc412682	1607	2015-01-01 06:30:00	2015-01-01 08:44:00	9	landed	\N	f	f	f	f	f
ac07d37a-ae1a-478d-a2e2-3a8acf95bf84	9e7e7cfc-68ae-4c4f-9721-407f71db5155	39184e8c-153c-4f15-83b7-520dfc412682	e5772f8f-21ce-4944-bcd9-0123a312a113	641	2015-01-01 06:30:00	2015-01-01 09:20:00	17	landed	\N	t	f	f	f	t
b403d866-acce-470f-8c77-9adfa57f7711	9e7e7cfc-68ae-4c4f-9721-407f71db5155	b37300fc-b095-4e23-b471-de894da310f9	761461d5-643f-4c65-8769-21d1ed2adc36	895	2015-01-01 06:30:00	2015-01-01 08:50:00	-6	landed	\N	f	f	f	f	f
be9a9841-afa1-4f83-b6ed-e166338b10d9	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	b55b8136-9a81-4e22-b2b8-b54ea6695d72	e5772f8f-21ce-4944-bcd9-0123a312a113	500	2015-01-01 06:30:00	2015-01-01 08:25:00	0	cancelled	B	f	f	f	f	f
5dfa5fa9-66ef-4954-98d2-c5f9a89a297e	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	0a227934-9832-4e9d-84fb-a25775ba12fb	e5772f8f-21ce-4944-bcd9-0123a312a113	622	2015-01-01 06:30:00	2015-01-01 08:45:00	0	cancelled	B	f	f	f	f	f
d4f3c065-1ce2-461d-8915-22edc5e97e65	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	109	2015-01-01 06:30:00	2015-01-01 07:25:00	-16	landed	\N	f	f	f	f	f
f75a48d5-8eee-4d1b-ad12-e7ab59940e7f	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	f12c8f72-384b-4d1c-9e3a-c032b411fa40	094775f5-e4e3-4fca-b88a-b5c412548bdb	466	2015-01-01 06:30:00	2015-01-01 08:05:00	10	landed	\N	f	f	f	f	f
8e03493f-590f-4e8c-bfac-5e330ffc2467	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ea064464-19c6-4c3b-962e-e0128f900e9a	962de796-50ec-403e-90e7-dd8cbf8dd135	394	2015-01-01 06:30:00	2015-01-01 07:56:00	7	landed	\N	f	f	f	f	f
8a80f8b9-4b8f-4997-84c8-3c8e5ae441a6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a91dbca0-d0c8-4846-9589-cb86ff1a3874	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	674	2015-01-01 06:30:00	2015-01-01 07:40:00	-9	landed	\N	f	f	f	f	f
fe5ed0c5-c6a1-4488-ad52-68d1e00535af	7d1ea82a-b408-4a79-afe6-313f0e01cc09	482881a6-c848-490b-9565-22468e00c5d7	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	447	2015-01-01 06:30:00	2015-01-01 08:02:00	-4	landed	\N	f	f	f	f	f
6158001a-2344-4a9a-9ab1-d58cd1807cd7	7d1ea82a-b408-4a79-afe6-313f0e01cc09	8efb8902-1cf4-4798-a5be-cd86f011f7ed	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1535	2015-01-01 06:30:00	2015-01-01 08:30:00	12	landed	\N	f	f	f	f	f
4d4ee76c-db4c-4804-84be-dc409053fca9	7d1ea82a-b408-4a79-afe6-313f0e01cc09	23dd7561-2551-4bf1-9274-493b57d1bbfe	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	425	2015-01-01 06:30:00	2015-01-01 09:03:00	-1	landed	\N	f	f	f	f	f
5f9729ec-a185-4fb8-94f7-651e80b12fa6	9ac91524-737f-47e4-bb51-365a3c0535a8	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	962de796-50ec-403e-90e7-dd8cbf8dd135	1012	2015-01-01 06:31:00	2015-01-01 08:19:00	-5	landed	\N	f	f	f	f	f
ada4faef-8c3e-43fd-8e7b-44f4b01ed18d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	962de796-50ec-403e-90e7-dd8cbf8dd135	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	589	2015-01-01 06:32:00	2015-01-01 09:24:00	-17	landed	\N	f	f	f	f	f
ab85b5f2-d23a-43c9-85f2-36322f903f86	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	5c89a23c-37c7-4379-b07d-e40d325ef99a	100	2015-01-01 06:32:00	2015-01-01 07:08:00	-6	landed	\N	f	f	f	f	f
dd657771-8f2b-45b5-8dac-f41fd4db8ea3	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	ba586dec-e3f7-416b-be7c-7036176fa2a9	1182	2015-01-01 06:33:00	2015-01-01 09:04:00	2	landed	\N	f	f	f	f	f
f43c92fc-57f1-43fa-89cd-fa5641681bbd	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	962de796-50ec-403e-90e7-dd8cbf8dd135	67	2015-01-01 06:33:00	2015-01-01 07:27:00	-25	landed	\N	f	f	f	f	f
06a71c79-d0a2-486a-892d-3354d12bb3d8	9ac91524-737f-47e4-bb51-365a3c0535a8	9f7ac324-dbdd-48b7-b465-3f84b98ef945	962de796-50ec-403e-90e7-dd8cbf8dd135	1197	2015-01-01 06:35:00	2015-01-01 08:55:00	19	landed	\N	t	f	f	f	f
3fd0b31e-cc79-404e-83f9-dbea480d9209	c2e13e71-01b7-44fe-b091-5f86ae80c023	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	3b85c138-79ba-401a-a5bd-82bcbfbb7813	2378	2015-01-01 06:35:00	2015-01-01 14:36:00	-23	landed	\N	f	f	f	f	f
5dc3c8bd-f7e5-475f-a70e-c34479c5748a	44d688b1-5f1b-41c3-b767-1526eca22fa7	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	1a743a77-55e0-4c53-ab16-765667e2cc37	874	2015-01-01 06:35:00	2015-01-01 09:50:00	-10	landed	\N	f	f	f	f	f
21fa17b7-1aab-4093-b687-45023cf40fa4	44d688b1-5f1b-41c3-b767-1526eca22fa7	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	1751	2015-01-01 06:35:00	2015-01-01 12:30:00	-6	landed	\N	f	f	f	f	f
81bb1b72-64a9-45cb-8e78-5668765ce7f7	c2e13e71-01b7-44fe-b091-5f86ae80c023	ec27c849-ee4d-4f87-818d-5ebf2adab285	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	255	2015-01-01 06:35:00	2015-01-01 08:46:00	-13	landed	\N	f	f	f	f	f
d001a8b7-1512-478a-bc7c-894b56ac7d57	56e4aa48-75b2-4da0-9fe0-033ef7008a91	bb4a1f43-cd49-4548-9c40-68be992ecb81	e5772f8f-21ce-4944-bcd9-0123a312a113	918	2015-01-01 06:35:00	2015-01-01 08:25:00	8	landed	\N	f	f	f	f	f
b2009d54-6378-4787-bbc0-91352121bcb1	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ba586dec-e3f7-416b-be7c-7036176fa2a9	e5772f8f-21ce-4944-bcd9-0123a312a113	447	2015-01-01 06:35:00	2015-01-01 08:15:00	0	cancelled	B	f	f	f	f	f
af1ec196-0ab8-44b5-a43c-d14ed079dee0	56e4aa48-75b2-4da0-9fe0-033ef7008a91	12d5c993-ac8c-4b1f-ba44-022a0387f073	e5772f8f-21ce-4944-bcd9-0123a312a113	1067	2015-01-01 06:35:00	2015-01-01 08:55:00	-27	landed	\N	f	f	f	f	f
d81d239c-01bd-499f-bb29-b7c65a8a8ea5	56e4aa48-75b2-4da0-9fe0-033ef7008a91	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	e5772f8f-21ce-4944-bcd9-0123a312a113	592	2015-01-01 06:35:00	2015-01-01 09:35:00	-9	landed	\N	f	f	f	f	f
c001cf37-2000-43bf-87f1-ce7113531166	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	1050	2015-01-01 06:35:00	2015-01-01 09:18:00	-8	landed	\N	f	f	f	f	f
0f54994e-75f5-460a-89a7-54633866b77e	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	933	2015-01-01 06:35:00	2015-01-01 08:54:00	-12	landed	\N	f	f	f	f	f
b7a5fe93-5511-4e9a-9185-e9b6c36eadea	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	cea35714-d52a-40da-9949-c5ba12469150	689	2015-01-01 06:35:00	2015-01-01 09:36:00	-10	landed	\N	f	f	f	f	f
fdcd1a59-6e4c-4b7a-bfa6-5f78d419c442	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	761461d5-643f-4c65-8769-21d1ed2adc36	1072	2015-01-01 06:35:00	2015-01-01 09:45:00	8	landed	\N	f	f	f	f	f
64bc9cbe-1e09-4368-ba72-bf353e99f575	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	9ee36afd-3a79-45a2-a7f4-e20c72958a90	55f76a81-76d7-45d4-965f-36aec15fdbb0	1056	2015-01-01 06:35:00	2015-01-01 09:31:00	-26	landed	\N	f	f	f	f	f
3d39dbe2-bbc9-4dcb-8fc4-edfe7eb00d90	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a99f7a37-e7d1-4518-9900-0a21b2faae74	ec27c849-ee4d-4f87-818d-5ebf2adab285	2248	2015-01-01 06:35:00	2015-01-01 09:25:00	45	landed	\N	t	f	t	f	f
11ff100b-784d-4299-ba8b-36a6a42f8a98	c2c012a9-4bdf-4b04-ac83-714fbc93b289	5630d9d0-abd7-4031-803a-b1a9107d0bbe	1a743a77-55e0-4c53-ab16-765667e2cc37	442	2015-01-01 06:35:00	2015-01-01 08:10:00	-17	landed	\N	f	f	f	f	f
6d539b55-4376-4c7c-a3ea-ef38bb5f88b4	c2c012a9-4bdf-4b04-ac83-714fbc93b289	12d5c993-ac8c-4b1f-ba44-022a0387f073	1a743a77-55e0-4c53-ab16-765667e2cc37	526	2015-01-01 06:35:00	2015-01-01 08:44:00	-41	landed	\N	f	f	f	f	f
8353428c-5a9c-4254-8e9a-2c6950059bda	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1532	2015-01-01 06:35:00	2015-01-01 12:19:00	-10	landed	\N	f	f	f	f	f
0f50b650-19f7-4eef-98f2-567bb540f60d	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0d1af828-7db4-4470-b1ff-ee9d4865dc70	1a743a77-55e0-4c53-ab16-765667e2cc37	692	2015-01-01 06:35:00	2015-01-01 08:54:00	-20	landed	\N	f	f	f	f	f
d2e6ae9c-78b5-4905-b0e0-5e049f335de2	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	47f69410-d216-4249-b351-b26b82b2e9b9	e5772f8f-21ce-4944-bcd9-0123a312a113	630	2015-01-01 06:35:00	2015-01-01 08:50:00	0	cancelled	B	f	f	f	f	f
46dafc3c-6269-408b-b8d6-28a53f52367d	7d1ea82a-b408-4a79-afe6-313f0e01cc09	e26808f6-bfd7-45e2-8566-a4e0fa51bd8c	b334592c-f6aa-405f-b7a2-67d942e3b8ad	243	2015-01-01 06:35:00	2015-01-01 07:54:00	-1	landed	\N	f	f	f	f	f
ea699d83-d4d7-4042-95b6-b60de3501305	7d1ea82a-b408-4a79-afe6-313f0e01cc09	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	4c0796a6-84d6-43eb-8ba0-be3eb277da6d	838	2015-01-01 06:35:00	2015-01-01 08:49:00	-13	landed	\N	f	f	f	f	f
5151320c-6a29-4f69-bca0-c4a1321d55bf	9ac91524-737f-47e4-bb51-365a3c0535a8	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	9b0fc777-7255-49f4-9d33-b1d5500e3298	1068	2015-01-01 06:38:00	2015-01-01 09:30:00	-15	landed	\N	f	f	f	f	f
50fd055a-5751-4dae-8e06-29e68480c96d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1576	2015-01-01 06:39:00	2015-01-01 12:30:00	-2	landed	\N	f	f	f	f	f
a0aa8674-129f-415c-8a2c-c038a4a75bd5	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ddf91df2-f024-47e6-a94c-bd42591a92f9	b334592c-f6aa-405f-b7a2-67d942e3b8ad	284	2015-01-01 06:40:00	2015-01-01 08:04:00	-17	landed	\N	f	f	f	f	f
34153e69-62e8-4257-950e-5a876525ae2a	c2e13e71-01b7-44fe-b091-5f86ae80c023	761461d5-643f-4c65-8769-21d1ed2adc36	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	468	2015-01-01 06:40:00	2015-01-01 08:16:00	-8	landed	\N	f	f	f	f	f
49a50f9f-6696-47e1-9ba3-9a54c9dfe92b	c2e13e71-01b7-44fe-b091-5f86ae80c023	566b6db6-eefa-482b-a38b-9842c22c0136	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	361	2015-01-01 06:40:00	2015-01-01 08:14:00	-2	landed	\N	f	f	f	f	f
409adebf-5477-449a-a73a-cda993cf232b	c2e13e71-01b7-44fe-b091-5f86ae80c023	9b0fc777-7255-49f4-9d33-b1d5500e3298	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	529	2015-01-01 06:40:00	2015-01-01 08:41:00	-9	landed	\N	f	f	f	f	f
a57dab24-9b3f-499c-b7a3-b57c014533cf	44d688b1-5f1b-41c3-b767-1526eca22fa7	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	1a743a77-55e0-4c53-ab16-765667e2cc37	813	2015-01-01 06:40:00	2015-01-01 09:50:00	-19	landed	\N	f	f	f	f	f
c4d141d2-96d4-40d5-9f5c-1969c380b76d	44d688b1-5f1b-41c3-b767-1526eca22fa7	8d29330d-f93e-4f00-a95c-8c5463e2bd4a	761461d5-643f-4c65-8769-21d1ed2adc36	861	2015-01-01 06:40:00	2015-01-01 09:10:00	-16	landed	\N	f	f	f	f	f
973f7bff-f8b9-4460-bbb1-e2e8d338121a	44d688b1-5f1b-41c3-b767-1526eca22fa7	b0bacb84-e58a-492c-a93a-0cd54194c0b1	ec27c849-ee4d-4f87-818d-5ebf2adab285	2173	2015-01-01 06:40:00	2015-01-01 09:10:00	-15	landed	\N	f	f	f	f	f
06c381a4-2561-4657-b6ea-871ef59f1e25	44d688b1-5f1b-41c3-b767-1526eca22fa7	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	ec27c849-ee4d-4f87-818d-5ebf2adab285	1524	2015-01-01 06:40:00	2015-01-01 08:45:00	-12	landed	\N	f	f	f	f	f
6938ff57-61bb-4e3a-8298-567d40d076a8	44d688b1-5f1b-41c3-b767-1526eca22fa7	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	1444	2015-01-01 06:40:00	2015-01-01 10:55:00	-16	landed	\N	f	f	f	f	f
7e6c0964-9d23-4cd4-ade9-3f4319e3f997	44d688b1-5f1b-41c3-b767-1526eca22fa7	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	ec27c849-ee4d-4f87-818d-5ebf2adab285	386	2015-01-01 06:40:00	2015-01-01 08:05:00	-5	landed	\N	f	f	f	f	f
66a320da-6aa3-4df9-a9d7-5bf4a1dde7d8	9ac91524-737f-47e4-bb51-365a3c0535a8	ec27c849-ee4d-4f87-818d-5ebf2adab285	9b0fc777-7255-49f4-9d33-b1d5500e3298	2227	2015-01-01 06:40:00	2015-01-01 14:29:00	-37	landed	\N	f	f	f	f	f
81f596cb-e724-4c6d-857b-7ad9facbe251	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	9b0fc777-7255-49f4-9d33-b1d5500e3298	719	2015-01-01 06:40:00	2015-01-01 09:45:00	2	landed	\N	f	f	f	f	f
7ab636a2-953b-4d96-8286-65750f41ae0d	56e4aa48-75b2-4da0-9fe0-033ef7008a91	c9e7dcc1-795a-4b7a-a528-07064fece36f	e5772f8f-21ce-4944-bcd9-0123a312a113	624	2015-01-01 06:40:00	2015-01-01 09:00:00	-3	landed	\N	f	f	f	f	f
8647645c-30bb-4ebe-a67f-c8c790c385f3	56e4aa48-75b2-4da0-9fe0-033ef7008a91	17c55660-12f7-499a-9f12-1b1e0d558d03	e5772f8f-21ce-4944-bcd9-0123a312a113	224	2015-01-01 06:40:00	2015-01-01 07:50:00	0	cancelled	B	f	f	f	f	f
6073b4c6-b204-4e45-83eb-882d44b89cb1	56e4aa48-75b2-4da0-9fe0-033ef7008a91	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	e5772f8f-21ce-4944-bcd9-0123a312a113	1158	2015-01-01 06:40:00	2015-01-01 09:20:00	-7	landed	\N	f	f	f	f	f
063c958d-2b93-43ff-ac30-2ae902ed680a	94d86c52-5799-48f5-8693-1aea5b7c4d48	24bccc02-ba34-4371-94a1-093c6ca19197	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	93	2015-01-01 06:40:00	2015-01-01 07:17:00	14	landed	\N	f	f	f	f	f
ca00bd04-5025-4044-be28-e9eabd8a8ade	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	834	2015-01-01 06:40:00	2015-01-01 09:04:00	-5	landed	\N	f	f	f	f	f
3f0599f4-a280-4d67-be9b-39094a465637	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	987	2015-01-01 06:40:00	2015-01-01 09:12:00	-16	landed	\N	f	f	f	f	f
e37e5577-0ba0-4663-ab53-bf19bcb08c66	94d86c52-5799-48f5-8693-1aea5b7c4d48	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	834	2015-01-01 06:40:00	2015-01-01 09:10:00	-7	landed	\N	f	f	f	f	f
acfe79ce-3cff-428a-824d-772c2389d834	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	e5772f8f-21ce-4944-bcd9-0123a312a113	1660	2015-01-01 06:40:00	2015-01-01 12:22:00	10	landed	\N	f	f	f	f	f
f0f8f4d7-4939-4233-8288-2c898bcb9726	94d86c52-5799-48f5-8693-1aea5b7c4d48	cea35714-d52a-40da-9949-c5ba12469150	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	584	2015-01-01 06:40:00	2015-01-01 07:43:00	50	landed	\N	f	f	f	f	t
883c9d8f-ef5e-409d-87d1-0e6a90908a37	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9e6d748c-0887-402d-9c56-75882767f180	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1194	2015-01-01 06:40:00	2015-01-01 10:06:00	20	landed	\N	t	f	f	f	f
d0156287-405f-403c-9484-3708d339b480	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	1a743a77-55e0-4c53-ab16-765667e2cc37	515	2015-01-01 06:40:00	2015-01-01 08:28:00	-8	landed	\N	f	f	f	f	f
2f47a598-d168-4e25-b1e9-931c0533f5da	c2c012a9-4bdf-4b04-ac83-714fbc93b289	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	0b753b16-0eac-45df-8db5-70af8de58431	1010	2015-01-01 06:40:00	2015-01-01 09:14:00	-11	landed	\N	f	f	f	f	f
26e8faa2-fd54-458d-9546-957998eb65d1	c2c012a9-4bdf-4b04-ac83-714fbc93b289	761461d5-643f-4c65-8769-21d1ed2adc36	0b753b16-0eac-45df-8db5-70af8de58431	950	2015-01-01 06:40:00	2015-01-01 09:13:00	-7	landed	\N	f	f	f	f	f
2f1eae5d-4761-4d6c-b7aa-32106656d3ce	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1589	2015-01-01 06:40:00	2015-01-01 12:28:00	-5	landed	\N	f	f	f	f	f
27c6c53d-0c9b-49cd-a913-ceb989149680	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	0f9bb6c9-7437-4357-88ce-54353e6bf6a6	e5772f8f-21ce-4944-bcd9-0123a312a113	354	2015-01-01 06:40:00	2015-01-01 08:00:00	-11	landed	\N	f	f	f	f	f
2a949b28-c4fb-4a8a-a274-b6a3ba8a039e	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	668f0890-489b-437d-b22d-20ddfa71bdd0	e5772f8f-21ce-4944-bcd9-0123a312a113	190	2015-01-01 06:40:00	2015-01-01 07:45:00	14	landed	\N	f	f	f	f	f
b5ad4f13-eecb-4268-b92a-6f36cab1cba5	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	84e0f5f0-0776-47b2-8cf0-ffe211e02bac	e5772f8f-21ce-4944-bcd9-0123a312a113	383	2015-01-01 06:40:00	2015-01-01 08:05:00	8	landed	\N	f	f	f	f	f
d70bd044-787e-48a3-9d93-8894d8b1ccbc	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	6d2a5bb6-4c68-4b97-bae2-b0fb46c23ae0	e5772f8f-21ce-4944-bcd9-0123a312a113	293	2015-01-01 06:40:00	2015-01-01 08:00:00	-10	landed	\N	f	f	f	f	f
e317930e-de61-48fc-add3-9242d2a80483	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	eafaffaf-f7f7-42f1-bccb-2cada8cca167	e5772f8f-21ce-4944-bcd9-0123a312a113	672	2015-01-01 06:40:00	2015-01-01 09:05:00	0	cancelled	B	f	f	f	f	f
99482675-79c0-4a34-bd1e-36c95bdfca9e	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	b25b37da-f344-4cbc-a38b-7fec377535b8	e5772f8f-21ce-4944-bcd9-0123a312a113	435	2015-01-01 06:40:00	2015-01-01 09:05:00	0	cancelled	B	f	f	f	f	f
25cf0fa5-5004-49ff-98a8-28ad4db1918a	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	0dea4eb5-4bec-4fc2-839a-68068c4a59b5	e5772f8f-21ce-4944-bcd9-0123a312a113	859	2015-01-01 06:40:00	2015-01-01 08:30:00	0	cancelled	B	f	f	f	f	f
261a4be7-d57f-444c-9b9f-61207804f8c0	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	c53ed55a-6259-43dd-a050-6288e2e5a045	9f7ac324-dbdd-48b7-b465-3f84b98ef945	489	2015-01-01 06:40:00	2015-01-01 08:20:00	11	landed	\N	f	f	f	f	f
9b216883-c3bb-4dd2-912e-cd618bad0d12	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	0b15631f-d083-4b76-8d70-75ab7dd2940c	9f7ac324-dbdd-48b7-b465-3f84b98ef945	710	2015-01-01 06:40:00	2015-01-01 08:56:00	-1	landed	\N	f	f	f	f	f
8c6f7ac7-ca72-4387-aa85-33419ca72eaf	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	0b753b16-0eac-45df-8db5-70af8de58431	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1076	2015-01-01 06:40:00	2015-01-01 09:46:00	97	landed	\N	t	f	f	f	f
6858ef69-45ae-4d2f-9da6-13e8d1c31393	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1a743a77-55e0-4c53-ab16-765667e2cc37	594	2015-01-01 06:40:00	2015-01-01 08:34:00	-11	landed	\N	f	f	f	f	f
e8aed8cc-857f-490c-a869-37fb548396f7	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b334592c-f6aa-405f-b7a2-67d942e3b8ad	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1127	2015-01-01 06:40:00	2015-01-01 09:46:00	-16	landed	\N	f	f	f	f	f
8f4f92b0-c48a-46dc-b1dd-af629fbbd6b7	7d1ea82a-b408-4a79-afe6-313f0e01cc09	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	aa136adc-9c55-40c2-9758-93042a0a26ac	817	2015-01-01 06:40:00	2015-01-01 08:50:00	-3	landed	\N	f	f	f	f	f
1efb2eac-7160-43a9-9355-cd09493fc542	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0db05805-32e6-4ba0-8bca-331176bc84b3	962de796-50ec-403e-90e7-dd8cbf8dd135	108	2015-01-01 06:40:00	2015-01-01 07:37:00	17	landed	\N	t	f	t	f	f
29f4664f-8a47-4f6e-88fb-7ce359f457c0	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	833	2015-01-01 06:40:00	2015-01-01 08:25:00	-20	landed	\N	f	f	f	f	f
57e916da-e10f-49df-84ba-e2142f11a120	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1723b1fc-3769-431f-95e6-be67c2e70497	39184e8c-153c-4f15-83b7-520dfc412682	313	2015-01-01 06:42:00	2015-01-01 08:29:00	-16	landed	\N	f	f	f	f	f
9ef23179-1c43-46ad-bc6d-8f1e5b2b017c	9ac91524-737f-47e4-bb51-365a3c0535a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	17c55660-12f7-499a-9f12-1b1e0d558d03	1379	2015-01-01 06:44:00	2015-01-01 12:01:00	-22	landed	\N	f	f	f	f	f
b17b8509-f8e4-4b7d-a9de-c7bde9e34303	9ac91524-737f-47e4-bb51-365a3c0535a8	6c3137e1-55f5-4a91-8ded-3918052a1cc2	17c55660-12f7-499a-9f12-1b1e0d558d03	1346	2015-01-01 06:45:00	2015-01-01 12:05:00	-15	landed	\N	f	f	f	f	f
3beb2e0e-71c7-4551-b183-cd32fb0d1ab8	9ac91524-737f-47e4-bb51-365a3c0535a8	c0da7786-cefb-463a-a6d5-57260bfb6019	962de796-50ec-403e-90e7-dd8cbf8dd135	473	2015-01-01 06:45:00	2015-01-01 07:31:00	37	landed	\N	t	f	t	f	f
ad10f943-2010-4aa6-85ac-62553d8f1288	c76d7bf1-637b-40bf-a13b-750d4b75362d	482881a6-c848-490b-9565-22468e00c5d7	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	337	2015-01-01 06:45:00	2015-01-01 08:05:00	-16	landed	\N	f	f	f	f	f
4a2e0612-22da-4055-81a3-05e83f879f08	44d688b1-5f1b-41c3-b767-1526eca22fa7	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	793	2015-01-01 06:45:00	2015-01-01 09:05:00	-26	landed	\N	f	f	f	f	f
da7b741e-bf08-4b5c-b66a-a8ccf7f55f63	44d688b1-5f1b-41c3-b767-1526eca22fa7	d60c22b9-7c54-4654-9094-79b67d756de4	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	296	2015-01-01 06:45:00	2015-01-01 08:00:00	-2	landed	\N	f	f	f	f	f
810ce02e-bb4a-4ac5-a709-9fbb86ffe120	44d688b1-5f1b-41c3-b767-1526eca22fa7	f3b5244f-b651-4318-a086-bf0b13368c6e	761461d5-643f-4c65-8769-21d1ed2adc36	1142	2015-01-01 06:45:00	2015-01-01 10:10:00	-18	landed	\N	f	f	f	f	f
9aa23d7f-c61d-4081-95b9-c98f1455b8a8	44d688b1-5f1b-41c3-b767-1526eca22fa7	b523dd4a-95db-4639-af15-d888e967c3fc	761461d5-643f-4c65-8769-21d1ed2adc36	1073	2015-01-01 06:45:00	2015-01-01 10:00:00	-29	landed	\N	f	f	f	f	f
8535d2dc-8520-4bbe-a545-b0610220c2cb	44d688b1-5f1b-41c3-b767-1526eca22fa7	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	566b6db6-eefa-482b-a38b-9842c22c0136	1407	2015-01-01 06:45:00	2015-01-01 10:50:00	-25	landed	\N	f	f	f	f	f
13744d96-bccf-4148-9efc-6e769e8c8ddf	44d688b1-5f1b-41c3-b767-1526eca22fa7	6c03e7bd-a5b4-4123-a449-14ec67009bab	1a743a77-55e0-4c53-ab16-765667e2cc37	761	2015-01-01 06:45:00	2015-01-01 09:50:00	2	landed	\N	f	f	f	f	f
1a023d27-31ff-41df-9298-5bb4de5847a4	c2e13e71-01b7-44fe-b091-5f86ae80c023	6c3137e1-55f5-4a91-8ded-3918052a1cc2	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	338	2015-01-01 06:45:00	2015-01-01 09:11:00	-12	landed	\N	f	f	f	f	f
7711a8df-2f87-45ca-8ea6-1fa5f691157b	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	550	2015-01-01 06:45:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
1a50f331-ed73-4828-93af-7ccaeedf2270	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0b753b16-0eac-45df-8db5-70af8de58431	e5772f8f-21ce-4944-bcd9-0123a312a113	1389	2015-01-01 06:45:00	2015-01-01 10:00:00	-3	landed	\N	f	f	f	f	f
6c212829-394a-4021-b5e9-c120978710b4	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ec27c849-ee4d-4f87-818d-5ebf2adab285	962de796-50ec-403e-90e7-dd8cbf8dd135	1514	2015-01-01 06:45:00	2015-01-01 12:15:00	-18	landed	\N	f	f	f	f	f
44b93c53-31a8-4873-8101-1df074484568	56e4aa48-75b2-4da0-9fe0-033ef7008a91	67e7149b-55f5-43f7-93f2-87921e81cb81	9f7ac324-dbdd-48b7-b465-3f84b98ef945	806	2015-01-01 06:45:00	2015-01-01 10:05:00	-12	landed	\N	f	f	f	f	f
6640a8b4-690b-4657-9dfa-186d3a1d04a3	56e4aa48-75b2-4da0-9fe0-033ef7008a91	8efb8902-1cf4-4798-a5be-cd86f011f7ed	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1501	2015-01-01 06:45:00	2015-01-01 11:30:00	16	landed	\N	f	f	t	f	f
c1fc536b-dc50-4ff9-8439-45f97cec7158	56e4aa48-75b2-4da0-9fe0-033ef7008a91	6c3137e1-55f5-4a91-8ded-3918052a1cc2	e5772f8f-21ce-4944-bcd9-0123a312a113	1205	2015-01-01 06:45:00	2015-01-01 11:50:00	-14	landed	\N	f	f	f	f	f
5af660c8-068d-46a6-995d-bb8cfb5e22ec	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	919	2015-01-01 06:45:00	2015-01-01 09:15:00	31	landed	\N	f	f	f	t	f
b10683bd-a9c0-4d2d-94eb-4d26285c5d8d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	30074e54-879b-4fbe-8a42-9b6d1690cec3	187	2015-01-01 06:45:00	2015-01-01 07:56:00	-12	landed	\N	f	f	f	f	f
391be073-f512-47fa-b71a-652efb71e00d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	b334592c-f6aa-405f-b7a2-67d942e3b8ad	632	2015-01-01 06:45:00	2015-01-01 09:10:00	-12	landed	\N	f	f	f	f	f
654329bb-8556-454a-b82d-814f236362aa	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b1062708-791a-4d09-aade-7516111fd22d	1a743a77-55e0-4c53-ab16-765667e2cc37	821	2015-01-01 06:45:00	2015-01-01 10:09:00	0	diverted	\N	f	f	f	f	f
ad453011-03a7-4617-b8fb-6c836dd14760	c2c012a9-4bdf-4b04-ac83-714fbc93b289	12d5c993-ac8c-4b1f-ba44-022a0387f073	8efb8902-1cf4-4798-a5be-cd86f011f7ed	726	2015-01-01 06:45:00	2015-01-01 08:19:00	-23	landed	\N	f	f	f	f	f
d6bf945a-195b-4f01-a970-69781ef86dd3	c2c012a9-4bdf-4b04-ac83-714fbc93b289	6c3137e1-55f5-4a91-8ded-3918052a1cc2	1a743a77-55e0-4c53-ab16-765667e2cc37	1919	2015-01-01 06:45:00	2015-01-01 14:01:00	-21	landed	\N	f	f	f	f	f
bf9d07b1-4bf2-40e8-83d4-2777e54a2190	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1a743a77-55e0-4c53-ab16-765667e2cc37	581	2015-01-01 06:45:00	2015-01-01 08:39:00	-19	landed	\N	f	f	f	f	f
2d2d5f6c-4b54-4a89-9cd9-29235e64cf1d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	6c3137e1-55f5-4a91-8ded-3918052a1cc2	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1522	2015-01-01 06:45:00	2015-01-01 12:30:00	-8	landed	\N	f	f	f	f	f
7fb4fdb1-2274-4393-842f-17027c987a54	c2c012a9-4bdf-4b04-ac83-714fbc93b289	1a743a77-55e0-4c53-ab16-765667e2cc37	0b753b16-0eac-45df-8db5-70af8de58431	762	2015-01-01 06:45:00	2015-01-01 08:53:00	8	landed	\N	f	f	f	f	f
4276ab11-dcb3-44a3-ba6b-e40eb54588e7	c2c012a9-4bdf-4b04-ac83-714fbc93b289	f07d6f3c-7656-45c6-8f0f-b23feea8be32	1a743a77-55e0-4c53-ab16-765667e2cc37	134	2015-01-01 06:45:00	2015-01-01 08:54:00	-26	landed	\N	f	f	f	f	f
e0f6feca-4207-4c59-9b4b-6705d381fa2e	c2c012a9-4bdf-4b04-ac83-714fbc93b289	67e7149b-55f5-43f7-93f2-87921e81cb81	1a743a77-55e0-4c53-ab16-765667e2cc37	214	2015-01-01 06:45:00	2015-01-01 08:59:00	-20	landed	\N	f	f	f	f	f
45f06bab-221a-4464-8c10-2ea16022a934	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b0bacb84-e58a-492c-a93a-0cd54194c0b1	e5772f8f-21ce-4944-bcd9-0123a312a113	1119	2015-01-01 06:45:00	2015-01-01 09:00:00	0	cancelled	B	f	f	f	f	f
27783dd8-5dac-4a46-b7dd-0ce5eb89df11	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	a99f7a37-e7d1-4518-9900-0a21b2faae74	2446	2015-01-01 06:45:00	2015-01-01 14:59:00	-31	landed	\N	f	f	f	f	f
3ea98fd8-87c1-4745-baae-a34860d8b536	56e4aa48-75b2-4da0-9fe0-033ef7008a91	f07d6f3c-7656-45c6-8f0f-b23feea8be32	e5772f8f-21ce-4944-bcd9-0123a312a113	597	2015-01-01 06:45:00	2015-01-01 09:00:00	-5	landed	\N	f	f	f	f	f
7be3bb4b-6c54-4eed-8ee4-eac450d770e0	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	4da96129-bb33-4b93-ba2e-8ea1b7d96a3f	17c55660-12f7-499a-9f12-1b1e0d558d03	501	2015-01-01 06:45:00	2015-01-01 09:22:00	0	cancelled	B	f	f	f	f	f
89fd8c63-caba-4101-a31e-a8a62ba61f00	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	88179592-3866-42e0-b805-9979bcbe0fad	39184e8c-153c-4f15-83b7-520dfc412682	423	2015-01-01 06:45:00	2015-01-01 07:24:00	28	landed	\N	f	f	f	f	t
4ef4d753-2653-46d4-b1dd-83eac069a1a5	9e7e7cfc-68ae-4c4f-9721-407f71db5155	39184e8c-153c-4f15-83b7-520dfc412682	8efb8902-1cf4-4798-a5be-cd86f011f7ed	680	2015-01-01 06:45:00	2015-01-01 09:40:00	16	landed	\N	f	f	t	f	f
98927bc4-e03f-45a4-8bad-200d1830c29e	9e7e7cfc-68ae-4c4f-9721-407f71db5155	ec27c849-ee4d-4f87-818d-5ebf2adab285	39184e8c-153c-4f15-83b7-520dfc412682	628	2015-01-01 06:45:00	2015-01-01 09:34:00	8	landed	\N	f	f	f	f	f
6c137853-a818-4be6-806f-b60b705e2cdc	9e7e7cfc-68ae-4c4f-9721-407f71db5155	6c3137e1-55f5-4a91-8ded-3918052a1cc2	39184e8c-153c-4f15-83b7-520dfc412682	846	2015-01-01 06:45:00	2015-01-01 10:10:00	-8	landed	\N	f	f	f	f	f
c43d35d7-e646-48af-916a-e3519027cc97	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e5dafbf2-9081-4db8-83fb-4478c7685a70	e5772f8f-21ce-4944-bcd9-0123a312a113	364	2015-01-01 06:45:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
f875bd4f-fff2-4dda-becc-980383988cf4	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	51077fb2-296f-4eab-8f66-e6b2e4fca641	e5772f8f-21ce-4944-bcd9-0123a312a113	693	2015-01-01 06:45:00	2015-01-01 09:10:00	-9	landed	\N	f	f	f	f	f
b12e0a47-998f-4915-b2a9-ba7a54926df2	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	745168c1-c6c5-415d-8a5f-31d97ab927b1	e5772f8f-21ce-4944-bcd9-0123a312a113	489	2015-01-01 06:45:00	2015-01-01 08:45:00	0	cancelled	B	f	f	f	f	f
5a077f81-8fbc-42aa-a4f1-8b93aec63be3	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	566b6db6-eefa-482b-a38b-9842c22c0136	b0bacb84-e58a-492c-a93a-0cd54194c0b1	925	2015-01-01 06:45:00	2015-01-01 09:22:00	-11	landed	\N	f	f	f	f	f
d8f4c5f3-a0ab-47b6-8fd7-ab57d65250cc	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	f2d678b1-8153-46e2-bf8e-aa197ce84aca	17c55660-12f7-499a-9f12-1b1e0d558d03	643	2015-01-01 06:45:00	2015-01-01 08:35:00	8	landed	\N	f	f	f	f	f
2a857289-7c1d-4617-95b0-b8b781d67404	7d1ea82a-b408-4a79-afe6-313f0e01cc09	70840ecc-bcff-4e0b-bffa-49d4088679cf	39184e8c-153c-4f15-83b7-520dfc412682	624	2015-01-01 06:45:00	2015-01-01 08:42:00	-11	landed	\N	f	f	f	f	f
de6fe91d-6d1e-4424-9ad2-3cfa31c00454	7d1ea82a-b408-4a79-afe6-313f0e01cc09	67e7149b-55f5-43f7-93f2-87921e81cb81	93b4c991-3f50-4236-996c-4cebe0f962d3	230	2015-01-01 06:45:00	2015-01-01 08:57:00	-14	landed	\N	f	f	f	f	f
2a5e4fbd-7ef6-4229-9391-07d36e6c8f07	7d1ea82a-b408-4a79-afe6-313f0e01cc09	6c3137e1-55f5-4a91-8ded-3918052a1cc2	482881a6-c848-490b-9565-22468e00c5d7	372	2015-01-01 06:45:00	2015-01-01 08:20:00	-1	landed	\N	f	f	f	f	f
2abffb5b-61be-49da-aaf9-e2f331e84de7	7d1ea82a-b408-4a79-afe6-313f0e01cc09	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	370	2015-01-01 06:45:00	2015-01-01 07:21:00	2	landed	\N	f	f	f	f	f
00fd4437-abc2-4ced-81ee-e787e24f014d	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1a743a77-55e0-4c53-ab16-765667e2cc37	17c55660-12f7-499a-9f12-1b1e0d558d03	689	2015-01-01 06:46:00	2015-01-01 08:02:00	7	landed	\N	f	f	f	f	f
82339fac-8001-406f-a854-580e282c959c	7d1ea82a-b408-4a79-afe6-313f0e01cc09	92f97891-a230-46be-946f-158d7b257d73	cea35714-d52a-40da-9949-c5ba12469150	200	2015-01-01 06:46:00	2015-01-01 08:50:00	7	landed	\N	f	f	f	f	f
bea14a56-28bd-4fce-88ea-304a57e333e9	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a46aae93-4cb4-4e4a-a37f-80a2c5147f37	a99f7a37-e7d1-4518-9900-0a21b2faae74	228	2015-01-01 06:47:00	2015-01-01 08:00:00	1	landed	\N	f	f	f	f	f
9203e6cc-b7d0-49d5-a480-a93dc55acfea	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	163	2015-01-01 06:47:00	2015-01-01 07:29:00	-6	landed	\N	f	f	f	f	f
62e3a5cb-fccc-494d-9945-84cccc2ef5f8	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1c676ed7-9306-4850-8809-0ebfe0c59de9	482881a6-c848-490b-9565-22468e00c5d7	158	2015-01-01 06:48:00	2015-01-01 07:55:00	-7	landed	\N	f	f	f	f	f
ff529fd4-6882-4c09-82e4-300416bebb1d	c2c012a9-4bdf-4b04-ac83-714fbc93b289	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1535	2015-01-01 06:49:00	2015-01-01 12:27:00	-9	landed	\N	f	f	f	f	f
df3740da-09d6-4f7d-b0c3-0540d49f46b2	9ac91524-737f-47e4-bb51-365a3c0535a8	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	482881a6-c848-490b-9565-22468e00c5d7	651	2015-01-01 06:50:00	2015-01-01 08:04:00	48	landed	\N	f	f	f	f	t
c09c2754-6aa5-4737-a40a-935913730f82	c2e13e71-01b7-44fe-b091-5f86ae80c023	12d5c993-ac8c-4b1f-ba44-022a0387f073	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	366	2015-01-01 06:50:00	2015-01-01 08:29:00	-9	landed	\N	f	f	f	f	f
f36f91b6-8c36-44c2-8733-6ad6afa010c4	c2e13e71-01b7-44fe-b091-5f86ae80c023	8efb8902-1cf4-4798-a5be-cd86f011f7ed	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	930	2015-01-01 06:50:00	2015-01-01 10:30:00	-13	landed	\N	f	f	f	f	f
3e6f98d7-7a46-408b-afa2-8f6b504b556f	44d688b1-5f1b-41c3-b767-1526eca22fa7	566b6db6-eefa-482b-a38b-9842c22c0136	761461d5-643f-4c65-8769-21d1ed2adc36	787	2015-01-01 06:50:00	2015-01-01 09:30:00	-34	landed	\N	f	f	f	f	f
977ed207-5d00-4851-ad17-c7b24c28c362	44d688b1-5f1b-41c3-b767-1526eca22fa7	ba586dec-e3f7-416b-be7c-7036176fa2a9	1a743a77-55e0-4c53-ab16-765667e2cc37	425	2015-01-01 06:50:00	2015-01-01 09:15:00	-16	landed	\N	f	f	f	f	f
9aff468e-c530-4566-bfc5-0e3a7d17c586	44d688b1-5f1b-41c3-b767-1526eca22fa7	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	879	2015-01-01 06:50:00	2015-01-01 10:00:00	4	landed	\N	f	f	f	f	f
399299f5-4efc-477e-80ca-c83f14306086	9ac91524-737f-47e4-bb51-365a3c0535a8	b0bacb84-e58a-492c-a93a-0cd54194c0b1	962de796-50ec-403e-90e7-dd8cbf8dd135	1182	2015-01-01 06:50:00	2015-01-01 09:12:00	0	landed	\N	f	f	f	f	f
063830b1-f12d-4a31-bdb3-477c8798650d	c2e13e71-01b7-44fe-b091-5f86ae80c023	3b85c138-79ba-401a-a5bd-82bcbfbb7813	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	2075	2015-01-01 06:50:00	2015-01-01 10:15:00	16	landed	\N	t	f	f	f	f
6e194f0d-4832-4e52-ab8a-f4eb757ed368	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	482881a6-c848-490b-9565-22468e00c5d7	337	2015-01-01 06:50:00	2015-01-01 08:10:00	-7	landed	\N	f	f	f	f	f
9221fbdd-d36c-4b3e-b31d-8c71bb28dc12	56e4aa48-75b2-4da0-9fe0-033ef7008a91	bbf1438c-1470-4b17-8bf3-ec578b328900	e5772f8f-21ce-4944-bcd9-0123a312a113	432	2015-01-01 06:50:00	2015-01-01 08:35:00	-13	landed	\N	f	f	f	f	f
4a405bed-a09e-40c6-adaf-23e5d899911a	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	e5772f8f-21ce-4944-bcd9-0123a312a113	1562	2015-01-01 06:50:00	2015-01-01 10:30:00	2	landed	\N	f	f	f	f	f
08210fa8-9851-414e-a788-60b5622a4198	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	e5772f8f-21ce-4944-bcd9-0123a312a113	190	2015-01-01 06:50:00	2015-01-01 07:55:00	-15	landed	\N	f	f	f	f	f
baee3095-c1b0-419d-a667-45b942ec94fd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	929	2015-01-01 06:50:00	2015-01-01 10:05:00	70	landed	\N	f	f	t	f	f
cd404f70-3947-405c-bbab-843637c785d9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	b37300fc-b095-4e23-b471-de894da310f9	e5772f8f-21ce-4944-bcd9-0123a312a113	1021	2015-01-01 06:50:00	2015-01-01 09:05:00	-15	landed	\N	f	f	f	f	f
0ce465eb-b1e0-4ce0-8ed7-039357f24e38	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	e5772f8f-21ce-4944-bcd9-0123a312a113	1235	2015-01-01 06:50:00	2015-01-01 11:50:00	-1	landed	\N	f	f	f	f	f
2766aa6d-231f-4960-94ee-669e7449e710	94d86c52-5799-48f5-8693-1aea5b7c4d48	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	697	2015-01-01 06:50:00	2015-01-01 08:54:00	-14	landed	\N	f	f	f	f	f
8808921a-89a6-45d7-b964-dc262c238f07	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	6c3137e1-55f5-4a91-8ded-3918052a1cc2	859	2015-01-01 06:50:00	2015-01-01 09:09:00	-10	landed	\N	f	f	f	f	f
2d200ba1-9b37-425f-85d6-9297d84f555a	94d86c52-5799-48f5-8693-1aea5b7c4d48	ec27c849-ee4d-4f87-818d-5ebf2adab285	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	763	2015-01-01 06:50:00	2015-01-01 09:06:00	-18	landed	\N	f	f	f	f	f
d21fbd26-39df-4e0b-a3fc-250d3f34586f	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	5731f612-6da8-41cc-a5a4-af8a8d7689bc	605	2015-01-01 06:50:00	2015-01-01 08:40:00	-14	landed	\N	f	f	f	f	f
163b0cab-2625-452d-8c93-142bb7d7a3f5	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b1cb37af-8ae5-43cb-8a89-701e233d582e	220d76f8-307b-4240-9335-a0ac5eb6e0b5	353	2015-01-01 06:50:00	2015-01-01 08:12:00	-9	landed	\N	f	f	f	f	f
47e20909-9b8c-44be-abf2-da2b52f24120	c2c012a9-4bdf-4b04-ac83-714fbc93b289	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	a99f7a37-e7d1-4518-9900-0a21b2faae74	2475	2015-01-01 06:50:00	2015-01-01 15:09:00	-11	landed	\N	f	f	f	f	f
03aa12cd-03b2-400e-bb50-d73a8ca325c7	c2c012a9-4bdf-4b04-ac83-714fbc93b289	5c65c9ef-e1c5-4e0c-b98e-68735a7a8731	1a743a77-55e0-4c53-ab16-765667e2cc37	164	2015-01-01 06:50:00	2015-01-01 07:55:00	-1	landed	\N	f	f	f	f	f
edd4e7f7-257f-40eb-9478-1c8789c97c42	c2c012a9-4bdf-4b04-ac83-714fbc93b289	911ef503-1dd7-47c0-bdd0-ae7648b2fbf4	1a743a77-55e0-4c53-ab16-765667e2cc37	151	2015-01-01 06:50:00	2015-01-01 08:58:00	-8	landed	\N	f	f	f	f	f
61831ee7-c608-422e-8e2d-e2200fbb9bf1	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	67e7149b-55f5-43f7-93f2-87921e81cb81	962de796-50ec-403e-90e7-dd8cbf8dd135	409	2015-01-01 06:50:00	2015-01-01 08:40:00	-5	landed	\N	f	f	f	f	f
7667f9dd-8b53-4b9f-8820-d06424bae399	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	55bfac26-cfa1-420a-9ef9-70048d2326e8	e5772f8f-21ce-4944-bcd9-0123a312a113	551	2015-01-01 06:50:00	2015-01-01 09:25:00	0	cancelled	B	f	f	f	f	f
eb1effe1-3f37-4c74-a37f-d3c943a9288f	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	9c814fe7-98e4-4170-9b1c-abe28b10d5ba	e5772f8f-21ce-4944-bcd9-0123a312a113	931	2015-01-01 06:50:00	2015-01-01 09:05:00	0	cancelled	B	f	f	f	f	f
6ff1e08f-75ec-4424-9ff6-80e3519bccdb	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d216ecd3-f5b9-4242-bd04-9d3533441471	962de796-50ec-403e-90e7-dd8cbf8dd135	522	2015-01-01 06:50:00	2015-01-01 08:40:00	-10	landed	\N	f	f	f	f	f
7acf7823-846d-48bb-a9ce-ef8bc45687f5	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	d63b6ecd-d32a-44e4-8882-ffecfa6343da	962de796-50ec-403e-90e7-dd8cbf8dd135	436	2015-01-01 06:50:00	2015-01-01 08:30:00	-5	landed	\N	f	f	f	f	f
10dc6afd-e646-40ed-840d-c488bdc51aac	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e21456b7-9ba4-4f73-94b5-9702a1c01aea	e5772f8f-21ce-4944-bcd9-0123a312a113	351	2015-01-01 06:50:00	2015-01-01 08:15:00	0	cancelled	B	f	f	f	f	f
b51c4045-8c1c-403b-b4a8-4112b452c6d8	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	962de796-50ec-403e-90e7-dd8cbf8dd135	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	1012	2015-01-01 06:50:00	2015-01-01 10:33:00	14	landed	\N	f	f	f	f	f
9428870d-6c2d-4b8c-a62e-abbc5978d274	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	17c55660-12f7-499a-9f12-1b1e0d558d03	1269	2015-01-01 06:50:00	2015-01-01 11:48:00	55	landed	\N	f	f	f	f	t
1a37de29-dc14-49e6-bab6-4fa53a2983c2	7d1ea82a-b408-4a79-afe6-313f0e01cc09	1b29e169-2c3e-4e97-8ed6-21afbfdd2925	39184e8c-153c-4f15-83b7-520dfc412682	298	2015-01-01 06:50:00	2015-01-01 07:04:00	11	landed	\N	f	f	f	f	f
c80b5fdc-3734-45f4-9a78-e60780623214	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	9b0fc777-7255-49f4-9d33-b1d5500e3298	200	2015-01-01 06:51:00	2015-01-01 08:17:00	-16	landed	\N	f	f	f	f	f
1d680915-4bcf-46fb-82e0-43b4d98cad2e	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	f1e978f1-35da-4540-827c-2817efca7f67	c5970237-9d8a-46b7-a8b3-e051a8c2f06b	216	2015-01-01 06:51:00	2015-01-01 07:41:00	53	landed	\N	f	f	t	f	f
44c005e6-6c82-4664-bc28-e0a55d89b42c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a99f7a37-e7d1-4518-9900-0a21b2faae74	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1089	2015-01-01 06:52:00	2015-01-01 10:10:00	-7	landed	\N	f	f	f	f	f
fad967a3-7a1a-4321-9a8f-7b8b0e84ba38	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b334592c-f6aa-405f-b7a2-67d942e3b8ad	ec27c849-ee4d-4f87-818d-5ebf2adab285	1749	2015-01-01 06:52:00	2015-01-01 08:25:00	26	landed	\N	t	f	f	f	f
f1b837cb-de57-4c11-91f6-c105addf1e53	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1085	2015-01-01 06:53:00	2015-01-01 09:51:00	-15	landed	\N	f	f	f	f	f
7c74a56e-4110-4af9-9abc-cc1b691dc8b2	9ac91524-737f-47e4-bb51-365a3c0535a8	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	17c55660-12f7-499a-9f12-1b1e0d558d03	1303	2015-01-01 06:53:00	2015-01-01 12:01:00	-10	landed	\N	f	f	f	f	f
a4cdfae6-d38b-479a-87c3-da735bfff271	9ac91524-737f-47e4-bb51-365a3c0535a8	e5772f8f-21ce-4944-bcd9-0123a312a113	17c55660-12f7-499a-9f12-1b1e0d558d03	224	2015-01-01 06:54:00	2015-01-01 08:03:00	-1	landed	\N	f	f	f	f	f
15adec8d-5e7e-4fec-a1af-c5fc78d6da96	c2e13e71-01b7-44fe-b091-5f86ae80c023	537cfb55-8f6d-49d0-a3d1-71ac4e0e4413	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	257	2015-01-01 06:55:00	2015-01-01 08:12:00	-13	landed	\N	f	f	f	f	f
3674ec14-336a-4dc2-b738-f4b91db96dd4	c2e13e71-01b7-44fe-b091-5f86ae80c023	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	507	2015-01-01 06:55:00	2015-01-01 08:35:00	-7	landed	\N	f	f	f	f	f
4138a3c2-9468-4266-a7b4-fa3085bb54ee	9ac91524-737f-47e4-bb51-365a3c0535a8	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	9b0fc777-7255-49f4-9d33-b1d5500e3298	997	2015-01-01 06:55:00	2015-01-01 09:30:00	-1	landed	\N	f	f	f	f	f
cf8855a4-85ce-465c-9dcb-035fa10f08f6	44d688b1-5f1b-41c3-b767-1526eca22fa7	8d29330d-f93e-4f00-a95c-8c5463e2bd4a	1a743a77-55e0-4c53-ab16-765667e2cc37	528	2015-01-01 06:55:00	2015-01-01 08:55:00	-30	landed	\N	f	f	f	f	f
ecf26b83-c3e9-4b7d-90f9-7f7c1ed2e0c6	44d688b1-5f1b-41c3-b767-1526eca22fa7	761461d5-643f-4c65-8769-21d1ed2adc36	1a743a77-55e0-4c53-ab16-765667e2cc37	404	2015-01-01 06:55:00	2015-01-01 08:30:00	-4	landed	\N	f	f	f	f	f
fc925044-defa-4d26-a8ad-326aabd729f2	44d688b1-5f1b-41c3-b767-1526eca22fa7	479c7b82-dae0-4b8f-9885-63acb8c8ac3d	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	580	2015-01-01 06:55:00	2015-01-01 09:40:00	3	landed	\N	f	f	f	f	f
8f0dacda-bc2e-4488-89b9-182820d2160b	44d688b1-5f1b-41c3-b767-1526eca22fa7	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1188	2015-01-01 06:55:00	2015-01-01 10:15:00	-20	landed	\N	f	f	f	f	f
56bd63e9-7a67-402d-a81b-8d0fd856459f	44d688b1-5f1b-41c3-b767-1526eca22fa7	3b85c138-79ba-401a-a5bd-82bcbfbb7813	b0bacb84-e58a-492c-a93a-0cd54194c0b1	992	2015-01-01 06:55:00	2015-01-01 09:45:00	-24	landed	\N	f	f	f	f	f
04f6263c-1bb6-464a-af52-b4a47d6b5c3e	44d688b1-5f1b-41c3-b767-1526eca22fa7	3b85c138-79ba-401a-a5bd-82bcbfbb7813	ec27c849-ee4d-4f87-818d-5ebf2adab285	2176	2015-01-01 06:55:00	2015-01-01 09:40:00	-8	landed	\N	f	f	f	f	f
e5de7071-0943-464a-a447-1b773dc686dd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	39184e8c-153c-4f15-83b7-520dfc412682	1709	2015-01-01 06:55:00	2015-01-01 09:22:00	1	landed	\N	f	f	f	f	f
855bc040-3b13-4657-be8b-88758f86d6c7	56e4aa48-75b2-4da0-9fe0-033ef7008a91	09f62e52-b00e-4cbf-a66f-f1660cbf6c59	e5772f8f-21ce-4944-bcd9-0123a312a113	237	2015-01-01 06:55:00	2015-01-01 08:10:00	0	cancelled	A	f	f	f	f	f
f1700a40-4236-4e16-918d-f64385f4c785	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	30074e54-879b-4fbe-8a42-9b6d1690cec3	2611	2015-01-01 06:55:00	2015-01-01 15:15:00	-33	landed	\N	f	f	f	f	f
4e73565e-d555-48d7-b895-c019761a00cc	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	0b753b16-0eac-45df-8db5-70af8de58431	1389	2015-01-01 06:55:00	2015-01-01 11:05:00	-22	landed	\N	f	f	f	f	f
0ef9f6e9-e733-4b6f-8b63-fb05f8bf0d93	56e4aa48-75b2-4da0-9fe0-033ef7008a91	566b6db6-eefa-482b-a38b-9842c22c0136	e5772f8f-21ce-4944-bcd9-0123a312a113	1217	2015-01-01 06:55:00	2015-01-01 09:35:00	2	landed	\N	f	f	f	f	f
148e9b65-0d1d-4075-8bd4-5442173e207a	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	1235	2015-01-01 06:55:00	2015-01-01 08:20:00	0	cancelled	B	f	f	f	f	f
93df3ce1-b21a-464c-bb5f-6c5cb6eae13d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	482881a6-c848-490b-9565-22468e00c5d7	a99f7a37-e7d1-4518-9900-0a21b2faae74	2586	2015-01-01 06:55:00	2015-01-01 15:17:00	-9	landed	\N	f	f	f	f	f
2eb9826b-3b5f-4c51-818c-04e376a91570	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	8efb8902-1cf4-4798-a5be-cd86f011f7ed	297	2015-01-01 06:55:00	2015-01-01 08:25:00	-10	landed	\N	f	f	f	f	f
d6697663-e423-4359-9e65-fd7bb7044af1	c2c012a9-4bdf-4b04-ac83-714fbc93b289	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1426	2015-01-01 06:55:00	2015-01-01 12:18:00	-12	landed	\N	f	f	f	f	f
1df196eb-f620-40ff-9ddd-13f95559b637	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	761461d5-643f-4c65-8769-21d1ed2adc36	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	759	2015-01-01 06:55:00	2015-01-01 08:59:00	-8	landed	\N	f	f	f	f	f
6bd316a5-0d99-42ad-a228-2e9050cbbe8d	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	c0da7786-cefb-463a-a6d5-57260bfb6019	301	2015-01-01 06:55:00	2015-01-01 08:29:00	-22	landed	\N	f	f	f	f	f
44e7e652-625a-4bdc-815a-ca7c9777ad7c	c2c012a9-4bdf-4b04-ac83-714fbc93b289	8efb8902-1cf4-4798-a5be-cd86f011f7ed	ec27c849-ee4d-4f87-818d-5ebf2adab285	1299	2015-01-01 06:55:00	2015-01-01 08:33:00	-41	landed	\N	f	f	f	f	f
0162203c-191e-4aa4-beff-ebae12397342	c2c012a9-4bdf-4b04-ac83-714fbc93b289	1a743a77-55e0-4c53-ab16-765667e2cc37	761461d5-643f-4c65-8769-21d1ed2adc36	404	2015-01-01 06:55:00	2015-01-01 08:22:00	-7	landed	\N	f	f	f	f	f
43705a99-75ad-4ad5-be33-66d4fb839df1	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	31adb60d-b31f-4c27-804c-630d2782c2fd	17c55660-12f7-499a-9f12-1b1e0d558d03	316	2015-01-01 06:55:00	2015-01-01 08:09:00	-13	landed	\N	f	f	f	f	f
124270bb-c5fa-447e-b3e7-c41c1835490b	9e7e7cfc-68ae-4c4f-9721-407f71db5155	04c5b1df-8e47-42b7-820a-fa48713830bb	b6768101-d32f-46b4-ae06-78293040b7b5	373	2015-01-01 06:55:00	2015-01-01 08:28:00	3	landed	\N	f	f	f	f	f
c228a10b-70a1-4bb0-9c12-165f8fdf24ad	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	31906092-d1e5-418a-9ec2-b5aa9b819a7f	962de796-50ec-403e-90e7-dd8cbf8dd135	1236	2015-01-01 06:55:00	2015-01-01 10:50:00	0	cancelled	A	f	f	f	f	f
bd7ef876-d8c8-4654-b043-4362dea35b3f	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	911ef503-1dd7-47c0-bdd0-ae7648b2fbf4	962de796-50ec-403e-90e7-dd8cbf8dd135	510	2015-01-01 06:55:00	2015-01-01 09:05:00	-19	landed	\N	f	f	f	f	f
212d99ca-8810-41f1-b83e-782ed550ed73	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	479c7b82-dae0-4b8f-9885-63acb8c8ac3d	962de796-50ec-403e-90e7-dd8cbf8dd135	1118	2015-01-01 06:55:00	2015-01-01 10:30:00	35	landed	\N	t	f	t	f	f
52c76b53-433a-40c5-857e-34f2085e7e74	9ac91524-737f-47e4-bb51-365a3c0535a8	b6768101-d32f-46b4-ae06-78293040b7b5	482881a6-c848-490b-9565-22468e00c5d7	2400	2015-01-01 06:57:00	2015-01-01 09:58:00	-5	landed	\N	f	f	f	f	f
5ec6696a-f846-4bff-91b5-0ddd6e8c5a5c	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2454	2015-01-01 06:59:00	2015-01-01 10:25:00	-5	landed	\N	f	f	f	f	f
07655275-55ce-420c-a69d-ff92ee9bdcdf	c2e13e71-01b7-44fe-b091-5f86ae80c023	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	331	2015-01-01 06:59:00	2015-01-01 08:28:00	-15	landed	\N	f	f	f	f	f
e10b94a1-f079-4156-a49e-f0aba6c06e27	9ac91524-737f-47e4-bb51-365a3c0535a8	761461d5-643f-4c65-8769-21d1ed2adc36	9b0fc777-7255-49f4-9d33-b1d5500e3298	937	2015-01-01 06:59:00	2015-01-01 09:31:00	-7	landed	\N	f	f	f	f	f
2c40f013-3c2a-484e-bb3a-1e0abcedcb5a	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	9f7ac324-dbdd-48b7-b465-3f84b98ef945	919	2015-01-01 06:59:00	2015-01-01 09:44:00	-20	landed	\N	f	f	f	f	f
167c8104-38fe-4ce6-ba73-5aed1482b323	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	482881a6-c848-490b-9565-22468e00c5d7	2586	2015-01-01 06:59:00	2015-01-01 10:43:00	-24	landed	\N	f	f	f	f	f
8f08360c-aca1-4513-b574-bd60ef41a3dc	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a99f7a37-e7d1-4518-9900-0a21b2faae74	55f76a81-76d7-45d4-965f-36aec15fdbb0	1028	2015-01-01 06:59:00	2015-01-01 10:02:00	-23	landed	\N	f	f	f	f	f
8aafecd3-3205-4e64-b7e5-af53fc075d96	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0b753b16-0eac-45df-8db5-70af8de58431	1a743a77-55e0-4c53-ab16-765667e2cc37	762	2015-01-01 06:59:00	2015-01-01 09:43:00	-31	landed	\N	f	f	f	f	f
38dd3a59-cb43-4ab1-9bed-e80722517486	7d1ea82a-b408-4a79-afe6-313f0e01cc09	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	261	2015-01-01 06:59:00	2015-01-01 09:07:00	-11	landed	\N	f	f	f	f	f
c091a934-84e0-49c2-986f-6656ad835522	7d1ea82a-b408-4a79-afe6-313f0e01cc09	99fcc290-1563-4605-bab3-241608a5bb66	e2db0449-baf3-4b41-a44b-c3657824079a	83	2015-01-01 07:00:00	2015-01-01 07:38:00	0	cancelled	B	f	f	f	f	f
988b1823-f9ca-4342-9e97-b87efd39c06c	9ac91524-737f-47e4-bb51-365a3c0535a8	b523dd4a-95db-4639-af15-d888e967c3fc	962de796-50ec-403e-90e7-dd8cbf8dd135	723	2015-01-01 07:00:00	2015-01-01 08:39:00	1	landed	\N	f	f	f	f	f
f41bdb94-8bc1-4ac6-a49f-fd555492c3ce	9ac91524-737f-47e4-bb51-365a3c0535a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	482881a6-c848-490b-9565-22468e00c5d7	550	2015-01-01 07:00:00	2015-01-01 08:53:00	-17	landed	\N	f	f	f	f	f
8051bfb3-da94-4bfe-a23d-852ce535b70e	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	997	2015-01-01 07:00:00	2015-01-01 10:01:00	-19	landed	\N	f	f	f	f	f
168f2ebe-bcef-48c3-997b-3af7c2f19821	c2e13e71-01b7-44fe-b091-5f86ae80c023	bb4a1f43-cd49-4548-9c40-68be992ecb81	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	328	2015-01-01 07:00:00	2015-01-01 08:27:00	-20	landed	\N	f	f	f	f	f
a32e225b-dfa9-425b-985a-297a00c3a75d	c2e13e71-01b7-44fe-b091-5f86ae80c023	b37300fc-b095-4e23-b471-de894da310f9	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	430	2015-01-01 07:00:00	2015-01-01 08:43:00	-24	landed	\N	f	f	f	f	f
df9b95e1-8d0d-4b8d-abda-89c416f30b16	c2e13e71-01b7-44fe-b091-5f86ae80c023	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	9f7ac324-dbdd-48b7-b465-3f84b98ef945	650	2015-01-01 07:00:00	2015-01-01 08:59:00	-7	landed	\N	f	f	f	f	f
b9f3febb-98ac-47df-ac2e-19b45f58e000	c2e13e71-01b7-44fe-b091-5f86ae80c023	17c55660-12f7-499a-9f12-1b1e0d558d03	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	912	2015-01-01 07:00:00	2015-01-01 10:22:00	-9	landed	\N	f	f	f	f	f
5e532e14-dffe-4a8a-b62a-b3245da6c96d	c2e13e71-01b7-44fe-b091-5f86ae80c023	23cc1784-a84f-46af-ac01-7d2b1f2828cc	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	427	2015-01-01 07:00:00	2015-01-01 08:38:00	-17	landed	\N	f	f	f	f	f
639b43f8-d2e6-43eb-9f89-aa7c9126d192	c2e13e71-01b7-44fe-b091-5f86ae80c023	e5772f8f-21ce-4944-bcd9-0123a312a113	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	936	2015-01-01 07:00:00	2015-01-01 10:28:00	2	landed	\N	f	f	f	f	f
e5e792e3-cd2f-4387-aa21-141dd0d3f6b4	9ac91524-737f-47e4-bb51-365a3c0535a8	0b753b16-0eac-45df-8db5-70af8de58431	962de796-50ec-403e-90e7-dd8cbf8dd135	733	2015-01-01 07:00:00	2015-01-01 08:39:00	-5	landed	\N	f	f	f	f	f
bda8996d-ba9b-4530-bb30-17ce27c4f4c8	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	17c55660-12f7-499a-9f12-1b1e0d558d03	1597	2015-01-01 07:00:00	2015-01-01 10:33:00	-16	landed	\N	f	f	f	f	f
9f4a3f08-1c1b-430b-8672-cbe294a4dc6b	9ac91524-737f-47e4-bb51-365a3c0535a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	962de796-50ec-403e-90e7-dd8cbf8dd135	867	2015-01-01 07:00:00	2015-01-01 08:58:00	13	landed	\N	f	f	f	f	f
72ed7aeb-f7aa-45ea-97e1-37ae0252d43b	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	9b0fc777-7255-49f4-9d33-b1d5500e3298	2565	2015-01-01 07:00:00	2015-01-01 15:26:00	-12	landed	\N	f	f	f	f	f
5b6fa932-a779-4b52-8f5f-b521fbf853ca	9ac91524-737f-47e4-bb51-365a3c0535a8	6c3137e1-55f5-4a91-8ded-3918052a1cc2	39184e8c-153c-4f15-83b7-520dfc412682	846	2015-01-01 07:00:00	2015-01-01 10:22:00	7	landed	\N	f	f	f	f	f
57f37394-9040-45d7-bd59-e128bf2df598	9ac91524-737f-47e4-bb51-365a3c0535a8	482881a6-c848-490b-9565-22468e00c5d7	17c55660-12f7-499a-9f12-1b1e0d558d03	1635	2015-01-01 07:00:00	2015-01-01 12:52:00	-17	landed	\N	f	f	f	f	f
e25a5b9a-3ae4-4f1f-8246-4c8016c1ae5b	c76d7bf1-637b-40bf-a13b-750d4b75362d	a99f7a37-e7d1-4518-9900-0a21b2faae74	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2475	2015-01-01 07:00:00	2015-01-01 10:25:00	2	landed	\N	f	f	f	f	f
17ec4a3d-71e0-4d00-ac94-cb636587cd0a	c76d7bf1-637b-40bf-a13b-750d4b75362d	ec27c849-ee4d-4f87-818d-5ebf2adab285	482881a6-c848-490b-9565-22468e00c5d7	414	2015-01-01 07:00:00	2015-01-01 08:25:00	-6	landed	\N	f	f	f	f	f
eb1b9248-bd13-44e9-9fed-7145a409a93e	44d688b1-5f1b-41c3-b767-1526eca22fa7	c0da7786-cefb-463a-a6d5-57260bfb6019	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1165	2015-01-01 07:00:00	2015-01-01 10:15:00	-3	landed	\N	f	f	f	f	f
7af93d19-9b2a-4c51-ba82-4fa3f15950e7	44d688b1-5f1b-41c3-b767-1526eca22fa7	566b6db6-eefa-482b-a38b-9842c22c0136	30b529a2-d575-423d-908a-2c2f004c560c	1246	2015-01-01 07:00:00	2015-01-01 09:40:00	-11	landed	\N	f	f	f	f	f
b97a856f-f0df-4b34-a111-aedebbbc3d23	44d688b1-5f1b-41c3-b767-1526eca22fa7	566b6db6-eefa-482b-a38b-9842c22c0136	ec27c849-ee4d-4f87-818d-5ebf2adab285	2106	2015-01-01 07:00:00	2015-01-01 09:30:00	-14	landed	\N	f	f	f	f	f
abcb64cc-12a9-4271-baad-0f9f16bc5466	44d688b1-5f1b-41c3-b767-1526eca22fa7	b37300fc-b095-4e23-b471-de894da310f9	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1737	2015-01-01 07:00:00	2015-01-01 09:40:00	7	landed	\N	f	f	f	f	f
a8c3478d-e834-4f3d-8460-d426e2467d40	44d688b1-5f1b-41c3-b767-1526eca22fa7	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	1184	2015-01-01 07:00:00	2015-01-01 09:30:00	12	landed	\N	f	f	f	f	f
5cd8bb37-32c2-43eb-bd5f-9c98733ad4cf	44d688b1-5f1b-41c3-b767-1526eca22fa7	3813ffaf-3414-4546-a786-aceaf1f29bab	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1092	2015-01-01 07:00:00	2015-01-01 10:05:00	-2	landed	\N	f	f	f	f	f
05e1fd0d-3a20-490b-9277-f081e0268458	44d688b1-5f1b-41c3-b767-1526eca22fa7	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	793	2015-01-01 07:00:00	2015-01-01 09:30:00	-4	landed	\N	f	f	f	f	f
e9b70e81-cf30-4c7d-9215-9f427b26919f	44d688b1-5f1b-41c3-b767-1526eca22fa7	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	997	2015-01-01 07:00:00	2015-01-01 10:45:00	-14	landed	\N	f	f	f	f	f
4a87b4bf-62d5-41ea-942f-2459c96f3732	44d688b1-5f1b-41c3-b767-1526eca22fa7	8efb8902-1cf4-4798-a5be-cd86f011f7ed	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	349	2015-01-01 07:00:00	2015-01-01 08:35:00	-23	landed	\N	f	f	f	f	f
7ef3ed0d-8853-497c-b358-9479497e8ea7	44d688b1-5f1b-41c3-b767-1526eca22fa7	12d5c993-ac8c-4b1f-ba44-022a0387f073	761461d5-643f-4c65-8769-21d1ed2adc36	834	2015-01-01 07:00:00	2015-01-01 09:30:00	-22	landed	\N	f	f	f	f	f
9905c95a-d8c5-4d3a-974f-16fa8d62daae	44d688b1-5f1b-41c3-b767-1526eca22fa7	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	67e7149b-55f5-43f7-93f2-87921e81cb81	822	2015-01-01 07:00:00	2015-01-01 09:00:00	-16	landed	\N	f	f	f	f	f
2203c04f-2e8b-401c-b9b3-f6d5c7f31504	44d688b1-5f1b-41c3-b767-1526eca22fa7	30b529a2-d575-423d-908a-2c2f004c560c	761461d5-643f-4c65-8769-21d1ed2adc36	849	2015-01-01 07:00:00	2015-01-01 10:10:00	-6	landed	\N	f	f	f	f	f
86b38914-4b50-4e36-abc1-0fe955f6737e	9ac91524-737f-47e4-bb51-365a3c0535a8	761461d5-643f-4c65-8769-21d1ed2adc36	482881a6-c848-490b-9565-22468e00c5d7	2446	2015-01-01 07:00:00	2015-01-01 10:00:00	306	landed	\N	f	f	f	t	f
f76e9e76-1d9a-4a05-b788-17aba1af3dc3	9ac91524-737f-47e4-bb51-365a3c0535a8	9b0fc777-7255-49f4-9d33-b1d5500e3298	39184e8c-153c-4f15-83b7-520dfc412682	1605	2015-01-01 07:00:00	2015-01-01 09:30:00	13	landed	\N	f	f	f	f	f
3de7aad7-813b-4d5c-a2a5-1af516301350	c2e13e71-01b7-44fe-b091-5f86ae80c023	962de796-50ec-403e-90e7-dd8cbf8dd135	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1440	2015-01-01 07:00:00	2015-01-01 10:03:00	-5	landed	\N	f	f	f	f	f
05eec66f-6fa6-4350-a241-880965d5bf58	c2e13e71-01b7-44fe-b091-5f86ae80c023	1a743a77-55e0-4c53-ab16-765667e2cc37	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	226	2015-01-01 07:00:00	2015-01-01 08:12:00	-11	landed	\N	f	f	f	f	f
e568e41c-1a1e-439b-ab96-0643b092934f	c2e13e71-01b7-44fe-b091-5f86ae80c023	cea35714-d52a-40da-9949-c5ba12469150	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	507	2015-01-01 07:00:00	2015-01-01 08:49:00	1	landed	\N	f	f	f	f	f
c169257d-9d5e-44aa-a341-e1d2fcbab2bc	c2e13e71-01b7-44fe-b091-5f86ae80c023	a91dbca0-d0c8-4846-9589-cb86ff1a3874	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	735	2015-01-01 07:00:00	2015-01-01 09:08:00	2	landed	\N	f	f	f	f	f
4a0b1ff6-1246-4867-bfa0-b36639254047	c2e13e71-01b7-44fe-b091-5f86ae80c023	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1979	2015-01-01 07:00:00	2015-01-01 10:20:00	5	landed	\N	f	f	f	f	f
a4de5d41-6c86-4427-90e4-642cfb964ec6	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a99f7a37-e7d1-4518-9900-0a21b2faae74	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2475	2015-01-01 07:00:00	2015-01-01 10:20:00	6	landed	\N	f	f	f	f	f
6910b0b1-da37-4251-84c7-2b61240e2f47	56e4aa48-75b2-4da0-9fe0-033ef7008a91	1a743a77-55e0-4c53-ab16-765667e2cc37	9f7ac324-dbdd-48b7-b465-3f84b98ef945	594	2015-01-01 07:00:00	2015-01-01 08:52:00	-10	landed	\N	f	f	f	f	f
e848584e-ff6a-41fa-ad08-01500c383d03	56e4aa48-75b2-4da0-9fe0-033ef7008a91	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	a99f7a37-e7d1-4518-9900-0a21b2faae74	2475	2015-01-01 07:00:00	2015-01-01 15:25:00	-49	landed	\N	f	f	f	f	f
b6af9c22-3f15-47fa-9875-2b4fcc7e83a4	56e4aa48-75b2-4da0-9fe0-033ef7008a91	482881a6-c848-490b-9565-22468e00c5d7	9f7ac324-dbdd-48b7-b465-3f84b98ef945	2585	2015-01-01 07:00:00	2015-01-01 15:24:00	-4	landed	\N	f	f	f	f	f
c77a9596-7385-4550-a89f-39607aed51bd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2611	2015-01-01 07:00:00	2015-01-01 10:35:00	10	landed	\N	f	f	f	f	f
2c93ca51-85df-4717-b9aa-e31f0a32d35f	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	ec27c849-ee4d-4f87-818d-5ebf2adab285	2174	2015-01-01 07:00:00	2015-01-01 09:28:00	6	landed	\N	f	f	f	f	f
6adb0cd5-8d93-4ed5-a9de-853dc1fa113f	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	67e7149b-55f5-43f7-93f2-87921e81cb81	631	2015-01-01 07:00:00	2015-01-01 08:40:00	4	landed	\N	f	f	f	f	f
165b2095-06be-4e7f-b4fd-d0d0e1bb57f8	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0b753b16-0eac-45df-8db5-70af8de58431	962de796-50ec-403e-90e7-dd8cbf8dd135	733	2015-01-01 07:00:00	2015-01-01 08:45:00	-2	landed	\N	f	f	f	f	f
020cf99c-47bc-4301-a191-d9d9c0985fe6	56e4aa48-75b2-4da0-9fe0-033ef7008a91	1c676ed7-9306-4850-8809-0ebfe0c59de9	e5772f8f-21ce-4944-bcd9-0123a312a113	1313	2015-01-01 07:00:00	2015-01-01 12:15:00	45	landed	\N	f	f	t	f	f
34699190-5204-40ba-812e-9c9b1b231044	56e4aa48-75b2-4da0-9fe0-033ef7008a91	30074e54-879b-4fbe-8a42-9b6d1690cec3	962de796-50ec-403e-90e7-dd8cbf8dd135	867	2015-01-01 07:00:00	2015-01-01 09:05:00	5	landed	\N	f	f	f	f	f
b6ae2375-f349-456b-aec3-489a380c196c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	ec27c849-ee4d-4f87-818d-5ebf2adab285	e5772f8f-21ce-4944-bcd9-0123a312a113	1055	2015-01-01 07:00:00	2015-01-01 11:45:00	-6	landed	\N	f	f	f	f	f
8c4bd2d1-b379-412d-8c13-80ee76a9b829	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	17c55660-12f7-499a-9f12-1b1e0d558d03	964	2015-01-01 07:00:00	2015-01-01 08:58:00	112	landed	\N	t	f	t	f	f
b7062c35-7084-4dfe-ade4-3c4a1ad19163	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	761461d5-643f-4c65-8769-21d1ed2adc36	985	2015-01-01 07:00:00	2015-01-01 10:30:00	-11	landed	\N	f	f	f	f	f
b86d9584-050b-46bc-b1d6-ba739f2c952c	56e4aa48-75b2-4da0-9fe0-033ef7008a91	761461d5-643f-4c65-8769-21d1ed2adc36	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2218	2015-01-01 07:00:00	2015-01-01 09:35:00	-9	landed	\N	f	f	f	f	f
1ae322d6-0c12-46cd-889c-4a187c0e04d7	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	30074e54-879b-4fbe-8a42-9b6d1690cec3	1258	2015-01-01 07:00:00	2015-01-01 10:13:00	-15	landed	\N	f	f	f	f	f
c07f4cb8-e0f2-45c4-a974-0250e10171be	56e4aa48-75b2-4da0-9fe0-033ef7008a91	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	e5772f8f-21ce-4944-bcd9-0123a312a113	929	2015-01-01 07:00:00	2015-01-01 08:50:00	-10	landed	\N	f	f	f	f	f
15f00aef-ebb8-48c5-a33d-5da0648f8baa	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	e5772f8f-21ce-4944-bcd9-0123a312a113	1660	2015-01-01 07:00:00	2015-01-01 12:50:00	24	landed	\N	t	f	f	f	f
e0b825e6-93b8-496c-8b88-9984bd96030d	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	1a743a77-55e0-4c53-ab16-765667e2cc37	731	2015-01-01 07:00:00	2015-01-01 10:05:00	-25	landed	\N	f	f	f	f	f
4bcf2dfd-5c33-4f28-abd2-bbf5ba78da2b	56e4aa48-75b2-4da0-9fe0-033ef7008a91	524390fe-c1a1-4a81-a5a6-4e96d884a0ba	e5772f8f-21ce-4944-bcd9-0123a312a113	813	2015-01-01 07:00:00	2015-01-01 10:10:00	0	cancelled	B	f	f	f	f	f
7ab20ebc-60c0-4a4a-a330-6ab60aa671bd	56e4aa48-75b2-4da0-9fe0-033ef7008a91	e5772f8f-21ce-4944-bcd9-0123a312a113	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1121	2015-01-01 07:00:00	2015-01-01 10:43:00	0	cancelled	B	f	f	f	f	f
a423e4bd-f9c5-4055-bc7c-0018773a3995	56e4aa48-75b2-4da0-9fe0-033ef7008a91	0b753b16-0eac-45df-8db5-70af8de58431	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1096	2015-01-01 07:00:00	2015-01-01 10:17:00	-20	landed	\N	f	f	f	f	f
5c425303-c737-45ec-9019-9f1516225c39	94d86c52-5799-48f5-8693-1aea5b7c4d48	9b0fc777-7255-49f4-9d33-b1d5500e3298	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	2402	2015-01-01 07:00:00	2015-01-01 10:11:00	4	landed	\N	f	f	f	f	f
9811826a-8326-44c7-9bc0-ac2f0400190f	94d86c52-5799-48f5-8693-1aea5b7c4d48	8efb8902-1cf4-4798-a5be-cd86f011f7ed	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1399	2015-01-01 07:00:00	2015-01-01 08:45:00	-14	landed	\N	f	f	f	f	f
308b27c4-51d7-4e39-a008-1a13ccd12967	94d86c52-5799-48f5-8693-1aea5b7c4d48	de24023d-db7f-4fcd-875b-edfcff42b5f5	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	1448	2015-01-01 07:00:00	2015-01-01 11:30:00	-15	landed	\N	f	f	f	f	f
98cbe036-73fa-428b-9e2f-f0deccf3a598	94d86c52-5799-48f5-8693-1aea5b7c4d48	0a60c4db-581b-4be4-b43a-f4aa7fd1d102	482881a6-c848-490b-9565-22468e00c5d7	421	2015-01-01 07:00:00	2015-01-01 08:35:00	-19	landed	\N	f	f	f	f	f
cdd0ee81-5d78-44ab-8005-f7695b58da62	94d86c52-5799-48f5-8693-1aea5b7c4d48	482881a6-c848-490b-9565-22468e00c5d7	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	679	2015-01-01 07:00:00	2015-01-01 09:00:00	-8	landed	\N	f	f	f	f	f
e2db9226-8af4-49ee-b6ba-96babb198472	94d86c52-5799-48f5-8693-1aea5b7c4d48	c14b8a2e-8182-4487-9ec2-5b7f8cb2d6c1	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	569	2015-01-01 07:00:00	2015-01-01 08:45:00	-5	landed	\N	f	f	f	f	f
789a195b-bea0-4d1f-b9d9-6e5a6dfc3982	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	129	2015-01-01 07:00:00	2015-01-01 07:50:00	9	landed	\N	f	f	f	f	f
75fa8cf4-5eb7-4b80-9539-9509693c90da	94d86c52-5799-48f5-8693-1aea5b7c4d48	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	954	2015-01-01 07:00:00	2015-01-01 09:50:00	-15	landed	\N	f	f	f	f	f
7d6f2433-1ce4-4a31-8e11-0c7aabf5ed1e	94d86c52-5799-48f5-8693-1aea5b7c4d48	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	954	2015-01-01 07:00:00	2015-01-01 09:45:00	-6	landed	\N	f	f	f	f	f
e5411878-4226-4c89-9ee6-531981e94214	94d86c52-5799-48f5-8693-1aea5b7c4d48	6c3137e1-55f5-4a91-8ded-3918052a1cc2	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	978	2015-01-01 07:00:00	2015-01-01 10:00:00	-20	landed	\N	f	f	f	f	f
26852737-e457-467f-88f5-ed63a1257fdc	94d86c52-5799-48f5-8693-1aea5b7c4d48	aa136adc-9c55-40c2-9758-93042a0a26ac	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	937	2015-01-01 07:00:00	2015-01-01 09:30:00	120	landed	\N	f	f	f	f	t
9e6c2e59-3889-48de-aad5-a5741ff2478c	94d86c52-5799-48f5-8693-1aea5b7c4d48	ec27c849-ee4d-4f87-818d-5ebf2adab285	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	867	2015-01-01 07:00:00	2015-01-01 09:34:00	-7	landed	\N	f	f	f	f	f
ce0dc3f0-732a-4ce4-bb5d-28041d297272	94d86c52-5799-48f5-8693-1aea5b7c4d48	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	1009	2015-01-01 07:00:00	2015-01-01 08:48:00	-20	landed	\N	f	f	f	f	f
93d114e1-d271-4116-9481-4f437965227f	94d86c52-5799-48f5-8693-1aea5b7c4d48	cea35714-d52a-40da-9949-c5ba12469150	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	590	2015-01-01 07:00:00	2015-01-01 08:05:00	5	landed	\N	f	f	f	f	f
68f5d8ae-6c4d-45eb-9872-1f7167d543ba	94d86c52-5799-48f5-8693-1aea5b7c4d48	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	f1e978f1-35da-4540-827c-2817efca7f67	2603	2015-01-01 07:00:00	2015-01-01 11:10:00	-17	landed	\N	f	f	f	f	f
cfbf5990-f90b-4489-be55-21a636f20c92	94d86c52-5799-48f5-8693-1aea5b7c4d48	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	5c89a23c-37c7-4379-b07d-e40d325ef99a	2541	2015-01-01 07:00:00	2015-01-01 10:57:00	24	landed	\N	t	f	f	f	f
673fd8f4-d004-4100-8fef-7fb51b8fe3e6	94d86c52-5799-48f5-8693-1aea5b7c4d48	220d76f8-307b-4240-9335-a0ac5eb6e0b5	82057082-4f10-49c4-b6da-2661f289e6b7	2457	2015-01-01 07:00:00	2015-01-01 10:44:00	-18	landed	\N	f	f	f	f	f
ecff96d5-136f-425e-9ca7-6ed18cb62441	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	30074e54-879b-4fbe-8a42-9b6d1690cec3	2611	2015-01-01 07:00:00	2015-01-01 15:19:00	-34	landed	\N	f	f	f	f	f
573adcd1-9444-47a9-9222-0f95d927a077	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	399	2015-01-01 07:00:00	2015-01-01 08:51:00	-37	landed	\N	f	f	f	f	f
fb4fe4e1-61b0-459b-b1dc-65ad8ed13c32	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	2588	2015-01-01 07:00:00	2015-01-01 10:36:00	-7	landed	\N	f	f	f	f	f
a96e9ecc-645e-48d2-b7a0-ecedb9186ec4	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	761461d5-643f-4c65-8769-21d1ed2adc36	759	2015-01-01 07:00:00	2015-01-01 09:23:00	-21	landed	\N	f	f	f	f	f
6a688f09-802b-4a2d-a6af-1ece51e83c60	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	bb4a1f43-cd49-4548-9c40-68be992ecb81	1010	2015-01-01 07:00:00	2015-01-01 10:08:00	131	landed	\N	f	f	t	f	f
88437550-afab-4a85-9eed-3153833d5cd4	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	b1cb37af-8ae5-43cb-8a89-701e233d582e	846	2015-01-01 07:00:00	2015-01-01 09:16:00	-20	landed	\N	f	f	f	f	f
301af083-6369-4565-af63-396c2f4c912a	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	30b529a2-d575-423d-908a-2c2f004c560c	1609	2015-01-01 07:00:00	2015-01-01 10:36:00	-10	landed	\N	f	f	f	f	f
599bdf3f-e083-485d-b0c2-0ffe2bab6918	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	30074e54-879b-4fbe-8a42-9b6d1690cec3	0dd6d79b-60a6-4f5c-b78f-4fec4e7285f1	1698	2015-01-01 07:00:00	2015-01-01 10:55:00	-6	landed	\N	f	f	f	f	f
9c39ccdb-b048-4f90-b29e-d54ed8eeff66	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	12d5c993-ac8c-4b1f-ba44-022a0387f073	b0bacb84-e58a-492c-a93a-0cd54194c0b1	994	2015-01-01 07:00:00	2015-01-01 09:48:00	-23	landed	\N	f	f	f	f	f
fc143b12-1a9c-4a1d-8176-ce4ba85eaeda	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	954	2015-01-01 07:00:00	2015-01-01 09:33:00	-4	landed	\N	f	f	f	f	f
2f66bb16-3447-4f1c-9ac3-f9696c8e4e67	c2c012a9-4bdf-4b04-ac83-714fbc93b289	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	a99f7a37-e7d1-4518-9900-0a21b2faae74	2454	2015-01-01 07:00:00	2015-01-01 15:13:00	-28	landed	\N	f	f	f	f	f
8552764c-3abf-48ed-ba97-49d6fb9cd7db	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a99f7a37-e7d1-4518-9900-0a21b2faae74	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	2475	2015-01-01 07:00:00	2015-01-01 10:40:00	-10	landed	\N	f	f	f	f	f
ee539beb-05b8-4d8d-81a6-b944f9f0354a	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1927	2015-01-01 07:00:00	2015-01-01 14:15:00	-23	landed	\N	f	f	f	f	f
6b2c0f50-e7eb-4617-871f-ea2abdd63677	c2c012a9-4bdf-4b04-ac83-714fbc93b289	482881a6-c848-490b-9565-22468e00c5d7	b334592c-f6aa-405f-b7a2-67d942e3b8ad	2079	2015-01-01 07:00:00	2015-01-01 14:33:00	-5	landed	\N	f	f	f	f	f
70e38048-ff68-4879-b27a-abf9b0a2610a	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a4e1f409-e4e4-42d8-8bc9-86f4761f2cf9	1a743a77-55e0-4c53-ab16-765667e2cc37	547	2015-01-01 07:00:00	2015-01-01 09:06:00	-21	landed	\N	f	f	f	f	f
7f5b99df-be2d-4ab9-bd9d-c2bb333fd589	c2c012a9-4bdf-4b04-ac83-714fbc93b289	83514dc0-7e7a-4058-a13b-ae4b8168cd27	1a743a77-55e0-4c53-ab16-765667e2cc37	516	2015-01-01 07:00:00	2015-01-01 09:00:00	4	landed	\N	f	f	f	f	f
363f6dd4-9956-445e-a012-3ddc4ac687fd	c2c012a9-4bdf-4b04-ac83-714fbc93b289	51037b5a-ec1e-4298-9a63-82335a8be6d0	1a743a77-55e0-4c53-ab16-765667e2cc37	366	2015-01-01 07:00:00	2015-01-01 08:28:00	-14	landed	\N	f	f	f	f	f
f4ac79c5-69bb-4901-8476-75de61ea3f0f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	55f76a81-76d7-45d4-965f-36aec15fdbb0	1a743a77-55e0-4c53-ab16-765667e2cc37	545	2015-01-01 07:00:00	2015-01-01 08:49:00	-3	landed	\N	f	f	f	f	f
b2b0bc0d-72b3-4d6e-bec3-431847e10afd	c2c012a9-4bdf-4b04-ac83-714fbc93b289	cea35714-d52a-40da-9949-c5ba12469150	8efb8902-1cf4-4798-a5be-cd86f011f7ed	991	2015-01-01 07:00:00	2015-01-01 10:43:00	-6	landed	\N	f	f	f	f	f
a0265752-a875-473f-a808-302fab05aeb9	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	8efb8902-1cf4-4798-a5be-cd86f011f7ed	1399	2015-01-01 07:00:00	2015-01-01 12:16:00	-17	landed	\N	f	f	f	f	f
da99fddf-eb2b-486c-8d29-9f57eefe2e7b	56e4aa48-75b2-4da0-9fe0-033ef7008a91	417dfc63-b559-48bb-afb9-5e6aeb78695f	e5772f8f-21ce-4944-bcd9-0123a312a113	861	2015-01-01 07:00:00	2015-01-01 08:55:00	-20	landed	\N	f	f	f	f	f
528f4ca5-f6bb-4ff9-a19f-d36fe2e6064b	c2c012a9-4bdf-4b04-ac83-714fbc93b289	8efb8902-1cf4-4798-a5be-cd86f011f7ed	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1276	2015-01-01 07:00:00	2015-01-01 09:34:00	-18	landed	\N	f	f	f	f	f
03e07971-824a-41aa-92fe-8f37269b1c81	c2c012a9-4bdf-4b04-ac83-714fbc93b289	0b753b16-0eac-45df-8db5-70af8de58431	55f76a81-76d7-45d4-965f-36aec15fdbb0	1035	2015-01-01 07:00:00	2015-01-01 10:09:00	-31	landed	\N	f	f	f	f	f
44563379-fdf8-43e8-abab-3afcf78a82b8	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	0b753b16-0eac-45df-8db5-70af8de58431	1080	2015-01-01 07:00:00	2015-01-01 09:49:00	-17	landed	\N	f	f	f	f	f
f98c9e97-045e-46ce-b688-87a710380844	c2c012a9-4bdf-4b04-ac83-714fbc93b289	9f7ac324-dbdd-48b7-b465-3f84b98ef945	0b753b16-0eac-45df-8db5-70af8de58431	1096	2015-01-01 07:00:00	2015-01-01 09:59:00	-2	landed	\N	f	f	f	f	f
587dafb2-096d-4812-aaee-aeac19f82e68	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b37300fc-b095-4e23-b471-de894da310f9	1a743a77-55e0-4c53-ab16-765667e2cc37	554	2015-01-01 07:00:00	2015-01-01 09:05:00	-33	landed	\N	f	f	f	f	f
5c9a7390-8c72-45b5-8080-d1e4d6cabf59	c2c012a9-4bdf-4b04-ac83-714fbc93b289	55f76a81-76d7-45d4-965f-36aec15fdbb0	0b753b16-0eac-45df-8db5-70af8de58431	1035	2015-01-01 07:00:00	2015-01-01 09:48:00	13	landed	\N	f	f	f	f	f
47b3d0c8-a2cb-44ee-89b6-9f4d2cb968ae	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a99f7a37-e7d1-4518-9900-0a21b2faae74	2252ada7-ca47-47a3-a183-de83d2aa3cd0	1598	2015-01-01 07:00:00	2015-01-01 11:50:00	-11	landed	\N	f	f	f	f	f
c3ecdb90-c5fc-44a1-b45f-3c4ab1591bfc	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ad18f5e9-b8c9-42ff-9c64-5f931f44afaa	1a743a77-55e0-4c53-ab16-765667e2cc37	669	2015-01-01 07:00:00	2015-01-01 10:08:00	-8	landed	\N	f	f	f	f	f
26787d86-84ec-4792-b53f-39da38d8e4bc	e222dd9f-9312-401d-9ed1-9e3f253fd6a8	b6768101-d32f-46b4-ae06-78293040b7b5	30074e54-879b-4fbe-8a42-9b6d1690cec3	612	2015-01-01 07:00:00	2015-01-01 08:49:00	21	landed	\N	t	f	f	f	f
9fec2986-68b8-40db-930f-723bdc02d90c	c2c012a9-4bdf-4b04-ac83-714fbc93b289	a99f7a37-e7d1-4518-9900-0a21b2faae74	482881a6-c848-490b-9565-22468e00c5d7	2586	2015-01-01 07:00:00	2015-01-01 10:43:00	-17	landed	\N	f	f	f	f	f
a38b555a-b37a-44ff-9cc3-43c164f6060f	c2c012a9-4bdf-4b04-ac83-714fbc93b289	b0bacb84-e58a-492c-a93a-0cd54194c0b1	0b753b16-0eac-45df-8db5-70af8de58431	1076	2015-01-01 07:00:00	2015-01-01 09:54:00	-11	landed	\N	f	f	f	f	f
95f64337-720f-41e0-8e6a-9daf761d2290	c2c012a9-4bdf-4b04-ac83-714fbc93b289	93784ecb-8e6a-4159-a7a1-a40002a5c5cc	b334592c-f6aa-405f-b7a2-67d942e3b8ad	1979	2015-01-01 07:00:00	2015-01-01 14:27:00	-22	landed	\N	f	f	f	f	f
4ec32706-3322-4f47-9cf4-8abfde12bd5b	c2c012a9-4bdf-4b04-ac83-714fbc93b289	ec27c849-ee4d-4f87-818d-5ebf2adab285	a99f7a37-e7d1-4518-9900-0a21b2faae74	2248	2015-01-01 07:00:00	2015-01-01 14:45:00	-35	landed	\N	f	f	f	f	f
2dbc609f-0ae5-4b66-9464-02b9f5e2aad3	c2c012a9-4bdf-4b04-ac83-714fbc93b289	8efb8902-1cf4-4798-a5be-cd86f011f7ed	9f7ac324-dbdd-48b7-b465-3f84b98ef945	1501	2015-01-01 07:00:00	2015-01-01 11:46:00	-26	landed	\N	f	f	f	f	f
31b13293-49dd-4bab-8299-6d760ecfda84	c2c012a9-4bdf-4b04-ac83-714fbc93b289	8efb8902-1cf4-4798-a5be-cd86f011f7ed	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	1416	2015-01-01 07:00:00	2015-01-01 11:30:00	-20	landed	\N	f	f	f	f	f
3906cbe0-20e4-4aae-a967-9a5d645f08d9	56e4aa48-75b2-4da0-9fe0-033ef7008a91	a99f7a37-e7d1-4518-9900-0a21b2faae74	761461d5-643f-4c65-8769-21d1ed2adc36	944	2015-01-01 07:00:00	2015-01-01 10:05:00	117	landed	\N	f	f	t	f	f
828b96aa-4136-4184-8947-a11c21e4c49c	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	b37300fc-b095-4e23-b471-de894da310f9	962de796-50ec-403e-90e7-dd8cbf8dd135	315	2015-01-01 07:00:00	2015-01-01 07:33:00	-11	landed	\N	f	f	f	f	f
e9319bf2-6985-48f4-8baf-4520554b93b7	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	e21456b7-9ba4-4f73-94b5-9702a1c01aea	17c55660-12f7-499a-9f12-1b1e0d558d03	201	2015-01-01 07:00:00	2015-01-01 08:05:00	12	landed	\N	f	f	f	f	f
8455dd04-b7de-430f-90d4-c26771084ed2	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	668f0890-489b-437d-b22d-20ddfa71bdd0	1a743a77-55e0-4c53-ab16-765667e2cc37	551	2015-01-01 07:00:00	2015-01-01 09:39:00	6	landed	\N	f	f	f	f	f
2d474323-6438-4919-8279-effc3516c304	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	dabdd0c5-e0a4-4a99-97ac-fcec7b9faf8d	0b753b16-0eac-45df-8db5-70af8de58431	254	2015-01-01 07:00:00	2015-01-01 08:27:00	-26	landed	\N	f	f	f	f	f
6f556edf-18ab-46a5-a2ba-98fd63dd622c	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	05932e22-3166-458e-b741-1ca107a3cb29	8efb8902-1cf4-4798-a5be-cd86f011f7ed	220	2015-01-01 07:00:00	2015-01-01 08:19:00	-9	landed	\N	f	f	f	f	f
b3228313-19ec-4a63-b2e4-55279174bd2c	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	7a3063c0-3e91-49c7-8885-2f34ecaf14c2	962de796-50ec-403e-90e7-dd8cbf8dd135	849	2015-01-01 07:00:00	2015-01-01 08:56:00	3	landed	\N	f	f	f	f	f
c3ff6b46-f9b0-43c6-b297-768fd441f930	9e7e7cfc-68ae-4c4f-9721-407f71db5155	962de796-50ec-403e-90e7-dd8cbf8dd135	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	1440	2015-01-01 07:00:00	2015-01-01 09:50:00	10	landed	\N	f	f	f	f	f
aeabf273-652b-45e0-b80c-8dd358d0f764	9e7e7cfc-68ae-4c4f-9721-407f71db5155	b37300fc-b095-4e23-b471-de894da310f9	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	1025	2015-01-01 07:00:00	2015-01-01 09:50:00	-17	landed	\N	f	f	f	f	f
205c5065-2997-497d-bca5-e6cb8127bfe1	9e7e7cfc-68ae-4c4f-9721-407f71db5155	39184e8c-153c-4f15-83b7-520dfc412682	761461d5-643f-4c65-8769-21d1ed2adc36	1546	2015-01-01 07:00:00	2015-01-01 12:25:00	58	landed	\N	f	f	t	f	f
99040995-dce6-49ec-a20e-02ee4507ce1f	9e7e7cfc-68ae-4c4f-9721-407f71db5155	761461d5-643f-4c65-8769-21d1ed2adc36	39184e8c-153c-4f15-83b7-520dfc412682	1546	2015-01-01 07:00:00	2015-01-01 09:13:00	-1	landed	\N	f	f	f	f	f
3ba44c01-a6ed-400c-b6dd-0a06572560b5	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e5772f8f-21ce-4944-bcd9-0123a312a113	c9e7dcc1-795a-4b7a-a528-07064fece36f	624	2015-01-01 07:00:00	2015-01-01 08:48:00	10	landed	\N	f	f	f	f	f
e2d6fd01-04db-4d81-88dd-53cf44b78f8b	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	397b91ae-7c04-4bd2-9463-fc5b2b278c4b	e5772f8f-21ce-4944-bcd9-0123a312a113	134	2015-01-01 07:00:00	2015-01-01 07:55:00	0	cancelled	B	f	f	f	f	f
e8c0959f-6f57-4253-aea9-92d565353195	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	1c343bcf-bfcf-4b75-aa17-b17e0d7441b6	e5772f8f-21ce-4944-bcd9-0123a312a113	604	2015-01-01 07:00:00	2015-01-01 09:10:00	0	cancelled	B	f	f	f	f	f
a94bb03a-e5f7-4197-8f90-b96174fa9170	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	679f0a0d-7f71-483b-ab1d-9505845b0389	e5772f8f-21ce-4944-bcd9-0123a312a113	773	2015-01-01 07:00:00	2015-01-01 10:25:00	0	cancelled	B	f	f	f	f	f
0cee6a84-c19c-4232-8878-638901b87828	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	9ee36afd-3a79-45a2-a7f4-e20c72958a90	962de796-50ec-403e-90e7-dd8cbf8dd135	738	2015-01-01 07:00:00	2015-01-01 08:55:00	-22	landed	\N	f	f	f	f	f
9b884952-474b-4e77-9c53-f7714d3adfbf	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	c1fce84d-810d-4f26-95e6-47f499ff8647	e5772f8f-21ce-4944-bcd9-0123a312a113	690	2015-01-01 07:00:00	2015-01-01 09:25:00	0	cancelled	B	f	f	f	f	f
ec287cb4-44a6-43ed-83b9-4c0d74335bfb	ad0bc2bb-614c-4469-ac62-e4ac7d0cde4f	e5772f8f-21ce-4944-bcd9-0123a312a113	45794771-7eea-47a1-b5ee-3de26801d071	309	2015-01-01 07:00:00	2015-01-01 08:08:00	0	cancelled	B	f	f	f	f	f
62ba1f95-bda3-49d4-9814-51fdfea77897	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	1a743a77-55e0-4c53-ab16-765667e2cc37	b0bacb84-e58a-492c-a93a-0cd54194c0b1	581	2015-01-01 07:00:00	2015-01-01 08:48:00	17	landed	\N	t	f	f	f	f
85160d50-57bd-458f-92bb-f04792a0e9c2	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	f12c8f72-384b-4d1c-9e3a-c032b411fa40	b0bacb84-e58a-492c-a93a-0cd54194c0b1	977	2015-01-01 07:00:00	2015-01-01 09:48:00	-12	landed	\N	f	f	f	f	f
852ced99-1125-404d-aeb3-63284907f181	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	35da2e18-a8d0-4669-bc42-78b1d793c7d1	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	956	2015-01-01 07:00:00	2015-01-01 09:30:00	-2	landed	\N	f	f	f	f	f
4243b55a-d267-40c8-a0b2-d7bf6bbc96b9	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	17c55660-12f7-499a-9f12-1b1e0d558d03	ec27c849-ee4d-4f87-818d-5ebf2adab285	1222	2015-01-01 07:00:00	2015-01-01 08:20:00	29	landed	\N	t	f	f	f	f
c6f3f007-730f-42f6-87a7-6e50e3cc61c3	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b0bacb84-e58a-492c-a93a-0cd54194c0b1	761461d5-643f-4c65-8769-21d1ed2adc36	177	2015-01-01 07:00:00	2015-01-01 07:57:00	16	landed	\N	t	f	f	f	f
2d3479d2-f44e-478d-aa2a-074e8756c9ce	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b0bacb84-e58a-492c-a93a-0cd54194c0b1	30074e54-879b-4fbe-8a42-9b6d1690cec3	1237	2015-01-01 07:00:00	2015-01-01 10:04:00	10	landed	\N	f	f	f	f	f
70ae5c1e-f9d3-489a-ac59-bfbd8c2de2ee	7d1ea82a-b408-4a79-afe6-313f0e01cc09	27d09749-8c3e-4532-8df5-df18743098a9	39184e8c-153c-4f15-83b7-520dfc412682	125	2015-01-01 07:00:00	2015-01-01 07:59:00	-1	landed	\N	f	f	f	f	f
473dc164-826c-4d9b-aa30-68d2a29cfcf6	7d1ea82a-b408-4a79-afe6-313f0e01cc09	aa136adc-9c55-40c2-9758-93042a0a26ac	482881a6-c848-490b-9565-22468e00c5d7	326	2015-01-01 07:00:00	2015-01-01 08:26:00	-1	landed	\N	f	f	f	f	f
e4884a6c-f05a-4ac1-921a-95ba9cf7ce1e	7d1ea82a-b408-4a79-afe6-313f0e01cc09	ecaf8cd7-c24b-4278-81ad-6bed94ca123a	cea35714-d52a-40da-9949-c5ba12469150	626	2015-01-01 07:00:00	2015-01-01 09:50:00	30	landed	\N	t	f	t	f	f
6dbe8db5-64b8-47e5-b950-fb68b164771e	7cb1d701-00b9-49bc-809d-c64d6ccf0c29	13d37d7e-30d9-4b0e-ba15-99c3c972bfeb	f1e978f1-35da-4540-827c-2817efca7f67	163	2015-01-01 07:00:00	2015-01-01 07:42:00	-1	landed	\N	f	f	f	f	f
690a8e03-3978-454f-ba10-1bab2c48a680	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a0259e5d-eafe-4c20-9f7a-da427e1a5c15	3dfebb03-d61c-4f82-a7bb-a84ae90638a2	129	2015-01-01 07:00:00	2015-01-01 08:00:00	7	landed	\N	f	f	f	f	f
df11d979-2061-4985-a2a1-71009ea240f1	7d1ea82a-b408-4a79-afe6-313f0e01cc09	6f414fc3-f0b1-427d-876d-c554d5a044f0	39184e8c-153c-4f15-83b7-520dfc412682	260	2015-01-01 07:00:00	2015-01-01 08:27:00	0	cancelled	C	f	f	f	f	f
6af03e5f-05d9-4bde-b2e7-15ef76936f11	7d1ea82a-b408-4a79-afe6-313f0e01cc09	509444be-70dd-401a-a056-319e65f49b1c	482881a6-c848-490b-9565-22468e00c5d7	262	2015-01-01 07:00:00	2015-01-01 08:38:00	1	landed	\N	f	f	f	f	f
ab16f3bf-f792-43b4-9c47-aeaacbae7ca0	7d1ea82a-b408-4a79-afe6-313f0e01cc09	a91dbca0-d0c8-4846-9589-cb86ff1a3874	962de796-50ec-403e-90e7-dd8cbf8dd135	1437	2015-01-01 07:00:00	2015-01-01 11:29:00	8	landed	\N	f	f	f	f	f
915300ae-3c4b-4296-9890-1d59ad2dd3f4	7d1ea82a-b408-4a79-afe6-313f0e01cc09	74add686-3a76-4238-bbcf-52a969a17dad	cea35714-d52a-40da-9949-c5ba12469150	320	2015-01-01 07:00:00	2015-01-01 08:54:00	-41	landed	\N	f	f	f	f	f
4ddd9223-693d-4af1-9233-f6f5fbf190d5	7d1ea82a-b408-4a79-afe6-313f0e01cc09	4d3ded3a-d74c-49d4-9c43-9b0d7ba940de	39184e8c-153c-4f15-83b7-520dfc412682	73	2015-01-01 07:01:00	2015-01-01 07:53:00	-8	landed	\N	f	f	f	f	f
79824c98-349e-457a-9723-2f36ee59819d	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	39184e8c-153c-4f15-83b7-520dfc412682	888	2015-01-01 07:02:00	2015-01-01 08:47:00	-2	landed	\N	f	f	f	f	f
d5d3d259-f387-416c-9e6c-b232f9b4283d	9ac91524-737f-47e4-bb51-365a3c0535a8	574ce7c8-aa23-4bd4-ad1c-ee448aa5b543	962de796-50ec-403e-90e7-dd8cbf8dd135	1440	2015-01-01 07:02:00	2015-01-01 11:21:00	58	landed	\N	t	f	f	f	t
192b64ec-2ac7-43b6-a157-6197a6a21d77	9ac91524-737f-47e4-bb51-365a3c0535a8	ba586dec-e3f7-416b-be7c-7036176fa2a9	17c55660-12f7-499a-9f12-1b1e0d558d03	305	2015-01-01 07:02:00	2015-01-01 08:20:00	-1	landed	\N	f	f	f	f	f
be6f6b11-b6a5-43ad-a4f9-0071212e84ca	9ac91524-737f-47e4-bb51-365a3c0535a8	b37300fc-b095-4e23-b471-de894da310f9	b3b92e7c-9899-4cf2-a0a3-b98a379d3a1d	1025	2015-01-01 07:02:00	2015-01-01 10:00:00	-28	landed	\N	f	f	f	f	f
de762737-54cf-4f6e-aff7-e26931c6b81b	56e4aa48-75b2-4da0-9fe0-033ef7008a91	9f7ac324-dbdd-48b7-b465-3f84b98ef945	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	204	2015-01-01 07:02:00	2015-01-01 08:06:00	0	cancelled	A	f	f	f	f	f
6d364717-8c36-41b4-9b9f-2ccf428bfb51	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	84e0f5f0-0776-47b2-8cf0-ffe211e02bac	17c55660-12f7-499a-9f12-1b1e0d558d03	253	2015-01-01 07:02:00	2015-01-01 08:15:00	1	landed	\N	f	f	f	f	f
edccf6ef-5dc0-4e78-82b6-2c1dea069ef8	bb4e1b0f-567d-4ad2-aa4c-4a558c0acbd2	7fadfa3c-e8a6-4511-8dea-609c2868e8fe	962de796-50ec-403e-90e7-dd8cbf8dd135	763	2015-01-01 07:04:00	2015-01-01 08:40:00	2	landed	\N	f	f	f	f	f
bb854c5d-a60d-4101-8d4a-58b1f772501d	b4eb8c9f-187e-4394-9bd3-ce5c6a153231	b0bacb84-e58a-492c-a93a-0cd54194c0b1	566b6db6-eefa-482b-a38b-9842c22c0136	925	2015-01-01 07:04:00	2015-01-01 09:29:00	8	landed	\N	f	f	f	f	f
0673f344-21db-4241-b510-7fbca8af69dc	7d1ea82a-b408-4a79-afe6-313f0e01cc09	482881a6-c848-490b-9565-22468e00c5d7	a91dbca0-d0c8-4846-9589-cb86ff1a3874	522	2015-01-01 07:04:00	2015-01-01 09:46:00	27	landed	\N	f	f	t	t	f
d0fc796d-5404-42f1-af8e-225015f28922	9ac91524-737f-47e4-bb51-365a3c0535a8	962de796-50ec-403e-90e7-dd8cbf8dd135	482881a6-c848-490b-9565-22468e00c5d7	1846	2015-01-01 07:05:00	2015-01-01 09:45:00	-12	landed	\N	f	f	f	f	f
80eab5a8-15fc-40f1-827b-891657016a18	c76d7bf1-637b-40bf-a13b-750d4b75362d	482881a6-c848-490b-9565-22468e00c5d7	a99f7a37-e7d1-4518-9900-0a21b2faae74	2586	2015-01-01 07:05:00	2015-01-01 15:34:00	-12	landed	\N	f	f	f	f	f
3c19298e-92c3-48d3-b093-cee83b6938e7	44d688b1-5f1b-41c3-b767-1526eca22fa7	9e6d748c-0887-402d-9c56-75882767f180	b0bacb84-e58a-492c-a93a-0cd54194c0b1	1173	2015-01-01 07:05:00	2015-01-01 10:20:00	-14	landed	\N	f	f	f	f	f
9d69bae2-fa95-4dc2-9c25-a2d72e80e149	44d688b1-5f1b-41c3-b767-1526eca22fa7	566b6db6-eefa-482b-a38b-9842c22c0136	b0bacb84-e58a-492c-a93a-0cd54194c0b1	925	2015-01-01 07:05:00	2015-01-01 09:40:00	-12	landed	\N	f	f	f	f	f
3e51b41b-929f-4889-9cf5-d8a8370c340f	44d688b1-5f1b-41c3-b767-1526eca22fa7	83d464c6-d4f4-4d26-b638-139e1f71139e	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	829	2015-01-01 07:05:00	2015-01-01 09:30:00	-10	landed	\N	f	f	f	f	f
398414a0-8661-4824-9b9e-4444c3cf372c	44d688b1-5f1b-41c3-b767-1526eca22fa7	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	566b6db6-eefa-482b-a38b-9842c22c0136	1209	2015-01-01 07:05:00	2015-01-01 10:55:00	-30	landed	\N	f	f	f	f	f
8be51a6a-74e2-4a43-a0a5-ca38d998ad9e	44d688b1-5f1b-41c3-b767-1526eca22fa7	b8d5f60e-15c0-46d5-8a3d-9dbe30229439	2f825248-aba4-4bc2-9bf2-5bce3eddb8f8	546	2015-01-01 07:05:00	2015-01-01 08:40:00	0	cancelled	A	f	f	f	f	f
5dd467ad-f52e-4ee8-a325-c978f0261c72	44d688b1-5f1b-41c3-b767-1526eca22fa7	b0bacb84-e58a-492c-a93a-0cd54194c0b1	566b6db6-eefa-482b-a38b-9842c22c0136	925	2015-01-01 07:05:00	2015-01-01 09:40:00	-9	landed	\N	f	f	f	f	f
30cf7573-1a2d-4b50-b3a5-673063bc419b	44d688b1-5f1b-41c3-b767-1526eca22fa7	761461d5-643f-4c65-8769-21d1ed2adc36	ec27c849-ee4d-4f87-818d-5ebf2adab285	2039	2015-01-01 07:05:00	2015-01-01 09:20:00	3	landed	\N	f	f	f	f	f
aece630b-9991-43bd-95db-a417e1cbb0ed	44d688b1-5f1b-41c3-b767-1526eca22fa7	ca72b9ab-f02d-4c7d-814d-2f3613f2d370	761461d5-643f-4c65-8769-21d1ed2adc36	990	2015-01-01 07:05:00	2015-01-01 10:50:00	-26	landed	\N	f	f	f	f	f
c790ee42-6e75-4ab0-9336-65466ea518ca	44d688b1-5f1b-41c3-b767-1526eca22fa7	220d76f8-307b-4240-9335-a0ac5eb6e0b5	30b529a2-d575-423d-908a-2c2f004c560c	1642	2015-01-01 07:05:00	2015-01-01 12:45:00	8	landed	\N	f	f	f	f	f
f34b7a5f-0ee1-4875-9e1e-028a1dc2f5d4	44d688b1-5f1b-41c3-b767-1526eca22fa7	f9a10132-35a1-4f1a-86e2-4a05a05b26a9	31906092-d1e5-418a-9ec2-b5aa9b819a7f	496	2015-01-01 07:05:00	2015-01-01 07:40:00	30	landed	\N	t	f	t	f	f
328c537a-107e-4731-84c3-482e9625358e	44d688b1-5f1b-41c3-b767-1526eca22fa7	bd48b4b8-d8f3-40a4-a225-ed9cb743a90c	566b6db6-eefa-482b-a38b-9842c22c0136	842	2015-01-01 07:05:00	2015-01-01 09:25:00	-18	landed	\N	f	f	f	f	f
6ac899fd-b9a2-43da-b5b6-6d27576e0aad	44d688b1-5f1b-41c3-b767-1526eca22fa7	524390fe-c1a1-4a81-a5a6-4e96d884a0ba	39184e8c-153c-4f15-83b7-520dfc412682	639	2015-01-01 07:05:00	2015-01-01 08:55:00	-9	landed	\N	f	f	f	f	f
21dacfe7-0584-4881-b5f2-0f68772db83e	9ac91524-737f-47e4-bb51-365a3c0535a8	6c3137e1-55f5-4a91-8ded-3918052a1cc2	9b0fc777-7255-49f4-9d33-b1d5500e3298	2434	2015-01-01 07:05:00	2015-01-01 15:24:00	-51	landed	\N	f	f	f	f	f
55f13bf8-bb39-4e27-a53e-9c66ac5de11d	c2e13e71-01b7-44fe-b091-5f86ae80c023	b6768101-d32f-46b4-ae06-78293040b7b5	2e658ce1-8fd8-4a01-bc38-e3b47a61348d	130	2015-01-01 07:05:00	2015-01-01 08:10:00	23	landed	\N	t	f	f	f	f
897c87d8-0e21-4d9f-9a53-994b884b8cec	9ac91524-737f-47e4-bb51-365a3c0535a8	0d1af828-7db4-4470-b1ff-ee9d4865dc70	e1154404-f9a9-42ff-8bf9-4b6a19e0d580	9999	2024-08-27 10:41:50.29	2024-08-27 10:41:50.29	0	landed	string	t	t	t	t	t
\.


--
-- Name: airlines airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (airline_id);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (airport_id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);


--
-- Name: flights flights_airline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_airline_id_fkey FOREIGN KEY (airline_id) REFERENCES public.airlines(airline_id);


--
-- Name: flights flights_destination_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_destination_airport_id_fkey FOREIGN KEY (destination_airport_id) REFERENCES public.airports(airport_id);


--
-- Name: flights flights_origin_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_origin_airport_id_fkey FOREIGN KEY (origin_airport_id) REFERENCES public.airports(airport_id);


--
-- PostgreSQL database dump complete
--

