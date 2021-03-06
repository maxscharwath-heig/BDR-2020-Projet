--
-- Insertion des données
-- Nicolas Crausaz & Maxime Scharwath
-- Version 2 - 19.01.2021
-- 

-- SPORT
insert into public.sport (id, name)
values  (5, 'Waterpolo'),
        (6, 'Handball'),
        (8, 'Volleyball'),
        (7, 'Rugby'),
        (2, 'Football'),
        (1, 'Basketball'),
        (3, 'Ice Hockey'),
        (4, 'Baseball');

-- STADIUM
insert into public.stadium (id, name, address, capacity)
values  (1, 'Malibu stadium', 'South Francescoview, 5819 Pons Laffitte', 36024),
        (3, 'Golf stadium', 'Le gallview, 6690 Lucienne de l''Abbaye', 54355),
        (4, 'A8 stadium', 'Port Micheleland, 69216 Shanie de Caumartin', 88948),
        (6, 'Model 3 stadium', 'Noelfurt, 78883 Perrin des Lombards', 57266),
        (7, 'Mercielago stadium', 'South Toreyburgh, 586 Meunier d''Argenteuil', 33130),
        (9, 'Accord stadium', 'New Marty, 72939 Irving d''Assas', 24689),
        (11, 'PT Cruiser stadium', 'Lemairebury, 077 Fleury Delesseux', 67722),
        (12, 'Explorer stadium', 'New Emilianostad, 399 Eileen des Lombards', 98454),
        (15, 'Fiesta stadium', 'South Kolbyhaven, 627 Pierre de Tilsitt', 61879),
        (16, 'Expedition stadium', 'West Helena, 611 Jacquet de Presbourg', 75697),
        (17, 'Civic stadium', 'West Dougstad, 5354 Fritz Charlemagne', 61127),
        (18, 'Impala stadium', 'South Ciceromouth, 67327 Domingo Joubert', 71547),
        (21, 'Focus stadium', 'East Amina, 046 Guillaume des Rosiers', 78453),
        (22, 'Roadster stadium', 'Baileyside, 8333 Huet d''Orsel', 83580),
        (23, 'LeBaron stadium', 'Lake Oscar, 8603 Myrl des Lombards', 79073),
        (25, 'XTS stadium', 'North Chasefort, 005 Dubois Saint-Honoré', 83418),
        (26, 'ATS stadium', 'Port Mariloustad, 33940 Vasseur de Montmorency', 45092),
        (27, 'Grand Cherokee stadium', 'New Cletus, 8818 Hubert du Chat-qui-Pêche', 86537),
        (28, 'Countach stadium', 'North Bonitaview, 3815 Prevost d''Argenteuil', 60233),
        (29, 'El Camino stadium', 'Rubyville, 49450 Dorothea de la Chaussée-d''Antin', 46375),
        (31, 'F-150 stadium', 'Cloydside, 64679 Brunet de la Huchette', 69271),
        (32, 'Element stadium', 'Port Friedrichfurt, 46609 Boyer de Paris', 14924),
        (33, 'Taurus stadium', 'New Makaylaton, 5954 Zena du Bac', 40014),
        (38, 'Charger stadium', 'Nicolasstad, 285 Ernestina Saint-Honoré', 40169),
        (39, 'Volt stadium', 'West Jessica, 6816 Deschamps Dauphine', 35596),
        (40, 'Altima stadium', 'West Ward, 2869 D''angelo de la Huchette', 39658),
        (41, '911 stadium', 'Lake Travisport, 22200 Karine Montorgueil', 36106),
        (42, 'Prius stadium', 'Francoisshire, 2392 Mortimer de Seine', 14285),
        (43, 'Sentra stadium', 'South Jovani, 61069 Savanah de la Huchette', 18896),
        (48, 'CTS stadium', 'South Linneashire, 00752 Jena Lepic', 74262),
        (30, 'Vaudoise Aréna', 'Prilly, Lausanne, Switzerland', 9600);

-- FEDERATION
insert into public.federation (id, name, sportid, active)
values  (1, 'Swiss Basketball', 1, true),
        (2, 'SFL', 2, true),
        (3, 'Swiss Handball League', 6, true),
        (4, 'Swiss Hockey', 3, true);

-- CLUB
insert into public.club (id, name, sportid, active)
values  (6, 'Servette FC', 2, true),
        (4, 'BBC Nyon', 1, true),
        (5, 'FC Sion', 2, true),
        (3, 'Fribourg Olympic', 1, true),
        (7, 'Kadetten Schaffhouse', 6, true),
        (2, 'Lions de Genève', 1, true),
        (1, 'Morges St-Prex Red Devils', 1, true),
        (8, 'Wacker Thoune', 6, true),
        (9, 'Lausanne Hockey Club', 3, true),
        (10, 'Genève Servette', 3, true);

-- CHAMPIONSHIP
insert into public.championship (id, name, startat, endat, leagueid, active)
values  (4, 'SHL 2021', '2021-01-19', '2021-09-30', 5, true),
        (5, 'Raiffaisen Super League 2021', '2021-01-01', '2021-12-31', 4, true),
        (2, 'WLNB - Playoffs 2021', '2020-05-09', '2020-08-19', 3, true),
        (6, 'Swiss League 2021', '2021-01-20', '2021-11-30', 6, true),
        (3, 'SBL Cup 2021', '2021-01-17', '2021-02-26', 1, true);


-- ADMINISTRATOR
insert into public.administrator (uid, email, lastname, firstname, password)
values  ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'nicolas.crausaz@ik.me', 'Crausaz', 'Nicolas', '$2b$10$WBmCa/oefxYdDElENGo.bek6iNhFDFCfWnFYKlRAhxDCduyiFKrPu'),
        ('7da5ac24-2c51-407e-a74b-31337e7de7d0', 'maxscharwath@gmail.com', 'Scharwath', 'Maxime', '$2b$10$ylGsXJQl0vpX9tI6DWuHRu9d/qCFMnfN5O.gSlERQW60CXSsayKku');

-- PLAYER
insert into public.player (uid, lastname, firstname, birthdate, height, weight, sex, active)
values  ('c8c7186f-8299-41ad-b192-0f72a971e463', 'Crausaz', 'Nicolas', '1999-08-02', 190, 70, 'M', true),
        ('17fedd38-d4a8-49c5-becc-9b8b2bde39a8', 'Watts', 'Jolyon', '1996-05-15', 193, 112, 'M', true),
        ('8e99eb15-7e75-4cd5-863a-52b351d70349', 'Grainger', 'Eugene', '1956-01-10', 140, 75, 'M', true),
        ('54d25f0f-9b2f-4a67-9734-2b53e6f105fa', 'Griffiths', 'Annie', '2021-01-19', 170, 61, 'F', true),
        ('0288428e-e57c-45d0-a5c4-bd9540818238', 'Schroeder', 'Hebe', '2020-06-07', 170, 96, 'M', true),
        ('fb148c35-3128-4592-8281-0fd64ed10002', 'Wakatsuki', 'Yamato', '2001-05-09', 160, 76, 'M', true),
        ('202f4469-53ad-49a2-a97b-60c0f26b209b', 'Friedli', 'Reto', '2021-01-19', 164, 86, 'M', true),
        ('6b615f85-d727-4685-9439-393fb64f7be6', 'Raemy', 'Nicolas', '1979-02-09', 214, 106, 'M', true),
        ('5fc0bdb4-931b-45f8-8345-917a04e15255', 'Guignet', 'Damien', '1968-02-04', 146, 81, 'M', true),
        ('8e614847-ec64-492c-af1a-f24044f78235', 'Khasa', 'Jared', '1996-08-07', 164, 81, 'M', true),
        ('e1128353-9194-4690-ba7f-5ebc41cbf73d', 'Hoarau', 'Guillaume', '1990-01-09', 162, 84, 'M', true),
        ('3be416ee-388b-4ee1-a41a-3a0470ef2252', 'Scharwath', 'Maxime', '1997-03-22', 192, 70, 'M', true),
        ('fe0ff1cb-c6ef-4f61-8aa7-faa95f43ebfd', 'Bruce Fayulu', 'Timothy', '1999-07-24', 184, 80, 'M', true),
        ('1ad86934-4379-4d3a-8696-5acd04928cad', 'Andersson', 'Erik Mattias', '1998-03-13', 191, 90, 'M', true),
        ('21d04095-2eff-440d-9447-e69bf7ac9eaa', 'Quina', 'Domingos', '1987-05-05', 153, 81, 'M', true),
        ('446964b6-98fc-4a27-a38c-8bf5bd8c6cc9', 'Otasowie', 'Owen', '2004-04-05', 181, 100, 'M', true),
        ('8d3d4440-370e-460f-b72a-3e30dad89638', 'Shaw', 'Luke', '1997-05-07', 177, 96, 'M', true),
        ('6312dc10-88df-4df7-973e-17d6285f3d43', 'Hinds', 'Kaylen', '1973-01-09', 174, 94, 'M', true),
        ('bf78a84c-87dd-4bc2-89a5-f13a0ee1a8e6', 'Silvo', 'Adrien', '2004-05-10', 164, 111, 'M', true),
        ('c213031e-f512-470a-998b-eebe79ca88b7', 'Janmaat', 'Daryl', '1999-01-05', 136, 84, 'M', true),
        ('69e64463-48ac-4d8d-9923-8ac5e1d72dba', 'Cotture', 'Arnaud', '1995-01-11', 164, 112, 'M', true),
        ('5a71cacb-2fc2-4e6e-8249-9228f9626ace', 'Soares', 'Cédric', '1999-01-05', 180, 85, 'M', true),
        ('1c5c5822-d590-4a5f-b1f0-a981f5c95458', 'Cahill', 'Gary', '1970-05-08', 197, 61, 'M', true),
        ('8ddfe713-7499-4933-99c9-0f2cc7a3977a', 'Arter', 'Harry', '2005-06-15', 140, 82, 'M', true),
        ('528aadf3-4b83-4119-964c-2fed03a7dc94', 'Gibson', 'Ben', '2003-06-02', 153, 80, 'M', true),
        ('04abf440-fa51-43c2-afca-cfad45e118a8', 'Shabani', 'Meritan', '2000-05-19', 181, 89, 'M', true),
        ('16cc283c-2fef-4d64-b5d5-69892abd2517', 'Dusan', 'Mladjan', '1995-01-10', 210, 91, 'M', true),
        ('be5b564e-c7f8-4214-b287-64187c794133', 'Timothy', 'Derksen', '2005-05-25', 181, 94, 'M', true),
        ('ee933874-936c-4377-9d28-dabc4c537df0', 'Vernon', 'Taylor', '1997-01-06', 166, 77, 'M', true),
        ('cc8718ec-37b1-42f2-8fe0-9ed47cbb1e4c', 'Arthur', 'Edwards', '1974-02-02', 198, 84, 'M', true),
        ('abcc9ede-bd4a-47e6-ab19-3f01cb8f4734', 'Toumi', 'Anissa', '2002-01-09', 166, 77, 'F', true);

-- LEAGUE
insert into public.league (id, level, gender, federationid, active)
values  (1, 'SBL League', 'M', 1, true),
        (3, 'WLNB', 'F', 1, true),
        (4, 'Raiffeisen Super League', 'M', 2, true),
        (5, 'Nationalliga A', 'M', 3, true),
        (6, 'National League A', 'M', 4, true);

-- TEAM
insert into public.team (id, name, clubid, leagueid, active)
values  (6, 'Wacker Thoune 1', 8, 5, true),
        (4, 'FC Sion 1', 5, 4, true),
        (7, 'Fribourg Olympic 1', 3, 1, true),
        (10, 'Lausanne HC', 9, 6, true),
        (8, 'Lions de Genève 1', 2, 1, true),
        (9, 'Servette FC 1', 6, 4, true),
        (3, 'Red Devils 2LF', 1, 3, true),
        (2, 'BBC Nyon 1', 4, 1, true),
        (11, 'Servette 1', 10, 6, true),
        (5, 'Kadetten Schaffhouse 1', 7, 5, true),
        (1, 'Red Devils 1', 1, 1, true);


-- PLAYER PLAY FOR TEAM
insert into public.player_play_for_team (jerseynumber, startat, endat, playeruid, teamid)
values  (5, '2021-01-19 16:08:57.762641', null, 'c8c7186f-8299-41ad-b192-0f72a971e463', 1),
        (4, '2021-01-19 16:14:18.707672', null, '8e99eb15-7e75-4cd5-863a-52b351d70349', 1),
        (6, '2021-01-19 16:14:28.262662', null, '0288428e-e57c-45d0-a5c4-bd9540818238', 1),
        (60, '2021-01-19 16:15:31.988044', null, '54d25f0f-9b2f-4a67-9734-2b53e6f105fa', 3),
        (15, '2021-01-19 16:23:13.131775', null, 'fb148c35-3128-4592-8281-0fd64ed10002', 4),
        (3, '2021-01-19 16:32:12.784084', null, '5fc0bdb4-931b-45f8-8345-917a04e15255', 6),
        (5, '2021-01-19 16:32:20.424404', null, '6b615f85-d727-4685-9439-393fb64f7be6', 6),
        (10, '2021-01-19 16:32:26.786659', null, '202f4469-53ad-49a2-a97b-60c0f26b209b', 6),
        (29, '2021-01-19 16:46:00.845491', null, '8e614847-ec64-492c-af1a-f24044f78235', 4),
        (99, '2021-01-19 16:48:17.780985', null, 'e1128353-9194-4690-ba7f-5ebc41cbf73d', 4),
        (3, '2021-01-19 17:48:51.725483', null, '1ad86934-4379-4d3a-8696-5acd04928cad', 4),
        (1, '2021-01-19 17:49:07.690308', null, 'fe0ff1cb-c6ef-4f61-8aa7-faa95f43ebfd', 4),
        (22, '2021-01-19 17:49:28.268537', null, '3be416ee-388b-4ee1-a41a-3a0470ef2252', 2),
        (1, '2021-01-19 17:58:07.954733', null, '21d04095-2eff-440d-9447-e69bf7ac9eaa', 5),
        (0, '2021-01-19 17:58:18.612581', null, '446964b6-98fc-4a27-a38c-8bf5bd8c6cc9', 5),
        (null, '2021-01-19 17:58:28.853817', '2021-01-19 17:59:22.639249', '8d3d4440-370e-460f-b72a-3e30dad89638', 5),
        (10, '2021-01-19 17:59:33.662865', null, '8d3d4440-370e-460f-b72a-3e30dad89638', 5),
        (21, '2021-01-19 18:04:38.889832', null, 'c213031e-f512-470a-998b-eebe79ca88b7', 2),
        (4, '2021-01-19 18:04:49.131295', null, '6312dc10-88df-4df7-973e-17d6285f3d43', 2),
        (89, '2021-01-19 18:05:00.787882', null, 'bf78a84c-87dd-4bc2-89a5-f13a0ee1a8e6', 2),
        (7, '2021-01-19 18:06:29.140820', null, '69e64463-48ac-4d8d-9923-8ac5e1d72dba', 7),
        (80, '2021-01-19 18:06:36.874828', null, '1c5c5822-d590-4a5f-b1f0-a981f5c95458', 7),
        (2, '2021-01-19 18:06:44.109878', null, '5a71cacb-2fc2-4e6e-8249-9228f9626ace', 7),
        (4, '2021-01-19 18:08:42.767390', null, '04abf440-fa51-43c2-afca-cfad45e118a8', 10),
        (90, '2021-01-19 18:08:50.655877', null, '528aadf3-4b83-4119-964c-2fed03a7dc94', 10),
        (12, '2021-01-19 18:08:57.889718', null, '8ddfe713-7499-4933-99c9-0f2cc7a3977a', 10),
        (68, '2021-01-19 18:11:01.798788', null, '16cc283c-2fef-4d64-b5d5-69892abd2517', 8),
        (421, '2021-01-19 18:11:15.746553', null, 'be5b564e-c7f8-4214-b287-64187c794133', 8),
        (5, '2021-01-19 18:13:00.357207', null, 'cc8718ec-37b1-42f2-8fe0-9ed47cbb1e4c', 9),
        (78, '2021-01-19 18:13:34.463581', null, 'ee933874-936c-4377-9d28-dabc4c537df0', 9),
        (45, '2021-01-19 18:15:16.272513', null, 'abcc9ede-bd4a-47e6-ab19-3f01cb8f4734', 3);

-- ADMIN CLUB
insert into public.administrator_club (administratoruid, clubid)
values  ('1da28e7d-39ab-46c8-ba22-1752129850e0', 1),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 2),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 3),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 4),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 5),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 6),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 7),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 8),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 9),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 10);

-- ADMIN FEDERATION
insert into public.administrator_federation (administratoruid, federationid)
values  ('1da28e7d-39ab-46c8-ba22-1752129850e0', 1),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 2),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 3),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 4);

-- ADMIN PLAYER
insert into public.administrator_player (administratoruid, playeruid)
values  ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'c8c7186f-8299-41ad-b192-0f72a971e463'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '17fedd38-d4a8-49c5-becc-9b8b2bde39a8'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '8e99eb15-7e75-4cd5-863a-52b351d70349'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '54d25f0f-9b2f-4a67-9734-2b53e6f105fa'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '0288428e-e57c-45d0-a5c4-bd9540818238'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'fb148c35-3128-4592-8281-0fd64ed10002'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '202f4469-53ad-49a2-a97b-60c0f26b209b'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '6b615f85-d727-4685-9439-393fb64f7be6'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '5fc0bdb4-931b-45f8-8345-917a04e15255'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '8e614847-ec64-492c-af1a-f24044f78235'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'e1128353-9194-4690-ba7f-5ebc41cbf73d'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '3be416ee-388b-4ee1-a41a-3a0470ef2252'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'fe0ff1cb-c6ef-4f61-8aa7-faa95f43ebfd'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '1ad86934-4379-4d3a-8696-5acd04928cad'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '21d04095-2eff-440d-9447-e69bf7ac9eaa'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '446964b6-98fc-4a27-a38c-8bf5bd8c6cc9'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '8d3d4440-370e-460f-b72a-3e30dad89638'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '6312dc10-88df-4df7-973e-17d6285f3d43'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'bf78a84c-87dd-4bc2-89a5-f13a0ee1a8e6'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'c213031e-f512-470a-998b-eebe79ca88b7'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '69e64463-48ac-4d8d-9923-8ac5e1d72dba'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '5a71cacb-2fc2-4e6e-8249-9228f9626ace'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '1c5c5822-d590-4a5f-b1f0-a981f5c95458'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '8ddfe713-7499-4933-99c9-0f2cc7a3977a'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '528aadf3-4b83-4119-964c-2fed03a7dc94'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '04abf440-fa51-43c2-afca-cfad45e118a8'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', '16cc283c-2fef-4d64-b5d5-69892abd2517'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'be5b564e-c7f8-4214-b287-64187c794133'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'ee933874-936c-4377-9d28-dabc4c537df0'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'cc8718ec-37b1-42f2-8fe0-9ed47cbb1e4c'),
        ('1da28e7d-39ab-46c8-ba22-1752129850e0', 'abcc9ede-bd4a-47e6-ab19-3f01cb8f4734');

-- EVENT
insert into public.event (uid, name, startat, endat, createdat, updatedat, stadiumid)
values  ('8a82947a-eba3-4a41-b2f3-4d9555d27c83', 'Meeting', '2021-01-19 15:00:00.000000', '2021-01-19 16:00:00.000000', '2021-01-19 16:08:34.482416', '2021-01-19 16:08:34.482416', 30),
        ('18a7faf0-f44c-4659-ae7d-5d62b8310ce7', 'Outside', '2021-03-09 18:00:00.000000', '2021-03-09 20:00:00.000000', '2021-01-19 16:39:24.212090', '2021-01-19 16:39:24.212090', 27),
        ('a0fab8b5-907a-4ec9-b739-b68fd884a2a1', 'Game 1', '2021-04-14 08:00:00.000000', '2021-04-14 10:00:00.000000', '2021-01-19 16:33:04.593252', '2021-01-19 16:33:04.593252', 40),
        ('6a57fcf9-278c-4c70-8d5f-e2ddc8f6434f', 'Game #1321', '2020-10-06 02:00:00.000000', '2020-10-06 05:00:00.000000', '2021-01-19 16:37:30.269164', '2021-01-19 16:37:30.269164', 9),
        ('39adfc26-051b-4912-a067-5327d5544766', 'Game 23', '2021-01-29 06:00:00.000000', '2021-01-29 08:00:00.000000', '2021-01-19 17:48:56.313231', '2021-01-19 17:48:56.313231', 3),
        ('8038526a-4f37-4409-ad2c-3a561d54f6d0', 'Game 45', '2021-01-27 07:00:00.000000', '2021-01-27 08:00:00.000000', '2021-01-19 17:48:26.664500', '2021-01-19 17:48:26.664500', 21),
        ('51ba6301-4a5d-493e-af00-492f686d0706', 'Cardio', '2021-01-22 17:00:00.000000', '2021-01-22 19:00:00.000000', '2021-01-19 18:01:31.713330', '2021-01-19 18:01:31.713330', 30),
        ('6568268d-9a78-4830-8e68-968b0bb0c764', '1/2 Final', '2021-04-15 02:00:00.000000', '2021-04-15 02:00:00.000000', '2021-01-20 09:26:08.398841', '2021-01-20 09:26:08.398841', 23),
        ('4bd7bbb6-1631-4c02-8436-75194c7a0cf4', 'Game 2222', '2021-04-14 02:00:00.000000', '2021-04-14 02:00:00.000000', '2021-01-20 09:35:18.578566', '2021-01-20 09:35:18.578566', 21),
        ('93d40df5-855f-4feb-a21c-009f19b47478', 'Official 1121', '2021-01-21 01:00:00.000000', '2021-01-21 01:00:00.000000', '2021-01-20 09:57:44.078470', '2021-01-20 09:57:44.078470', 18),
        ('8c77371a-7b23-4c9e-89e2-0d8bd294c72e', 'SCHAFFHOUSE - WACKER THOUNE', '2021-01-20 01:00:00.000000', '2021-01-20 01:00:00.000000', '2021-01-20 09:53:32.731604', '2021-01-20 09:53:32.731604', 9),
        ('b2cad0a3-9127-454f-b832-512582388ef8', 'LIONS DE GENÈVE 1 - BBC NYON 1', '2021-01-11 01:00:00.000000', '2021-01-11 01:00:00.000000', '2021-01-19 16:04:05.781298', '2021-01-19 16:04:05.781298', 41),
        ('01c0e46a-2fe2-486b-99ed-2544731376b9', 'Final', '2021-05-13 02:00:00.000000', '2021-05-13 02:00:00.000000', '2021-01-20 10:26:54.556749', '2021-01-20 10:26:54.556749', 27),
        ('6e533990-2d19-4031-9157-ac42e87557b9', 'BBC NYON 1 - FRIBOURG OLYMPIC 1', '2021-02-22 01:00:00.000000', '2021-02-22 01:00:00.000000', '2021-01-20 09:56:25.495377', '2021-01-20 09:56:25.495377', 4);

-- GAME
insert into public.game (eventuid, gameid, scorehome, scoreguest, canceled, championshipid, teamhomeid, teamguestid)
values  ('a0fab8b5-907a-4ec9-b739-b68fd884a2a1', '1231231', 3, 2, false, 4, 5, 6),
        ('6a57fcf9-278c-4c70-8d5f-e2ddc8f6434f', '123123123', 12, 16, false, 4, 6, 5),
        ('8038526a-4f37-4409-ad2c-3a561d54f6d0', '3434232', 0, 0, false, 3, 8, 7),
        ('39adfc26-051b-4912-a067-5327d5544766', '43435', 0, 0, false, 3, 7, 8),
        ('6568268d-9a78-4830-8e68-968b0bb0c764', '566556', 0, 0, false, 3, 8, 7),
        ('4bd7bbb6-1631-4c02-8436-75194c7a0cf4', '124123412', 0, 0, false, 5, 9, 4),
        ('93d40df5-855f-4feb-a21c-009f19b47478', '778', 0, 0, false, 4, 5, 6),
        ('8c77371a-7b23-4c9e-89e2-0d8bd294c72e', 'dfds', 0, 0, false, 4, 5, 6),
        ('b2cad0a3-9127-454f-b832-512582388ef8', '7546812', 65, 63, false, 3, 8, 2),
        ('01c0e46a-2fe2-486b-99ed-2544731376b9', '34234', 0, 0, false, 6, 11, 10),
        ('6e533990-2d19-4031-9157-ac42e87557b9', '234234', 0, 0, false, 3, 2, 7);

-- TRAINING
insert into public.training (eventuid, description, teamid)
values  ('8a82947a-eba3-4a41-b2f3-4d9555d27c83', 'Outside running !!', 1),
        ('18a7faf0-f44c-4659-ae7d-5d62b8310ce7', 'Let''s go', 3),
        ('51ba6301-4a5d-493e-af00-492f686d0706', 'Petit footing avec la team! Pour booster le cardio, car	Christoph Bertschy avait un peu de la peine à souffler hier au match.', 10);



-- EVENT LOG (optionnal)
insert into public.event_log (id, event, resourceid, operation, tablename, executedat)
values  (1, 'insert player', 'c8c7186f-8299-41ad-b192-0f72a971e463', 'insert', 'player', '2021-01-19 15:46:58.118668'),
        (2, 'update player', 'c8c7186f-8299-41ad-b192-0f72a971e463', 'update', 'player', '2021-01-19 15:47:12.826586'),
        (3, 'insert club', '1', 'insert', 'club', '2021-01-19 15:51:57.284552'),
        (4, 'insert club', '2', 'insert', 'club', '2021-01-19 15:52:27.791055'),
        (5, 'insert club', '3', 'insert', 'club', '2021-01-19 15:52:41.061564'),
        (6, 'insert club', '4', 'insert', 'club', '2021-01-19 15:52:51.847113'),
        (7, 'update club', '3', 'update', 'club', '2021-01-19 15:53:09.521119'),
        (8, 'insert federation', '1', 'insert', 'federation', '2021-01-19 15:53:55.203584'),
        (9, 'insert league', '1', 'insert', 'league', '2021-01-19 15:56:07.953615'),
        (10, 'insert league', '2', 'insert', 'league', '2021-01-19 15:56:26.355944'),
        (11, 'insert league', '3', 'insert', 'league', '2021-01-19 15:56:33.152637'),
        (12, 'insert championship', '1', 'insert', 'championship', '2021-01-19 15:57:17.611147'),
        (13, 'update championship', '1', 'update', 'championship', '2021-01-19 15:57:27.295211'),
        (14, 'insert championship', '2', 'insert', 'championship', '2021-01-19 15:57:47.800174'),
        (15, 'insert championship', '3', 'insert', 'championship', '2021-01-19 15:58:07.324183'),
        (16, 'insert team', '1', 'insert', 'team', '2021-01-19 16:01:50.043635'),
        (17, 'insert team', '2', 'insert', 'team', '2021-01-19 16:02:03.919947'),
        (18, 'insert event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'insert', 'event', '2021-01-19 16:04:05.781298'),
        (19, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-19 16:06:28.512984'),
        (20, 'insert event', '8a82947a-eba3-4a41-b2f3-4d9555d27c83', 'insert', 'event', '2021-01-19 16:08:34.482416'),
        (21, 'insert player', '17fedd38-d4a8-49c5-becc-9b8b2bde39a8', 'insert', 'player', '2021-01-19 16:11:20.705982'),
        (22, 'insert player', '8e99eb15-7e75-4cd5-863a-52b351d70349', 'insert', 'player', '2021-01-19 16:11:51.890990'),
        (23, 'insert player', '54d25f0f-9b2f-4a67-9734-2b53e6f105fa', 'insert', 'player', '2021-01-19 16:12:26.736441'),
        (24, 'insert player', '0288428e-e57c-45d0-a5c4-bd9540818238', 'insert', 'player', '2021-01-19 16:13:36.949338'),
        (25, 'update team', '1', 'update', 'team', '2021-01-19 16:14:32.821543'),
        (26, 'insert team', '3', 'insert', 'team', '2021-01-19 16:14:53.042600'),
        (27, 'update team', '3', 'update', 'team', '2021-01-19 16:15:33.784001'),
        (28, 'insert federation', '2', 'insert', 'federation', '2021-01-19 16:16:18.506057'),
        (29, 'insert club', '5', 'insert', 'club', '2021-01-19 16:16:40.284544'),
        (30, 'insert club', '6', 'insert', 'club', '2021-01-19 16:16:52.148051'),
        (31, 'insert player', 'fb148c35-3128-4592-8281-0fd64ed10002', 'insert', 'player', '2021-01-19 16:18:19.538096'),
        (32, 'update federation', '2', 'update', 'federation', '2021-01-19 16:19:12.537235'),
        (33, 'update federation', '2', 'update', 'federation', '2021-01-19 16:19:34.653791'),
        (34, 'insert league', '4', 'insert', 'league', '2021-01-19 16:19:42.313702'),
        (35, 'insert team', '4', 'insert', 'team', '2021-01-19 16:20:24.232747'),
        (36, 'update team', '4', 'update', 'team', '2021-01-19 16:23:14.025651'),
        (37, 'insert federation', '3', 'insert', 'federation', '2021-01-19 16:26:16.432041'),
        (38, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-19 16:27:18.459882'),
        (39, 'insert league', '5', 'insert', 'league', '2021-01-19 16:28:52.246385'),
        (40, 'insert club', '7', 'insert', 'club', '2021-01-19 16:29:17.948311'),
        (41, 'insert team', '5', 'insert', 'team', '2021-01-19 16:29:26.644696'),
        (42, 'insert club', '8', 'insert', 'club', '2021-01-19 16:29:38.742090'),
        (43, 'insert team', '6', 'insert', 'team', '2021-01-19 16:29:50.855319'),
        (44, 'insert player', '202f4469-53ad-49a2-a97b-60c0f26b209b', 'insert', 'player', '2021-01-19 16:30:47.608874'),
        (45, 'insert player', '6b615f85-d727-4685-9439-393fb64f7be6', 'insert', 'player', '2021-01-19 16:31:05.131056'),
        (46, 'insert player', '5fc0bdb4-931b-45f8-8345-917a04e15255', 'insert', 'player', '2021-01-19 16:31:31.346602'),
        (47, 'update team', '6', 'update', 'team', '2021-01-19 16:32:27.434283'),
        (48, 'insert event', 'a0fab8b5-907a-4ec9-b739-b68fd884a2a1', 'insert', 'event', '2021-01-19 16:33:04.593252'),
        (49, 'insert championship', '4', 'insert', 'championship', '2021-01-19 16:33:49.908080'),
        (50, 'update event', 'a0fab8b5-907a-4ec9-b739-b68fd884a2a1', 'update', 'event', '2021-01-19 16:34:19.874088'),
        (51, 'update event', 'a0fab8b5-907a-4ec9-b739-b68fd884a2a1', 'update', 'event', '2021-01-19 16:34:28.552879'),
        (53, 'insert event', '6a57fcf9-278c-4c70-8d5f-e2ddc8f6434f', 'insert', 'event', '2021-01-19 16:37:30.269164'),
        (54, 'update event', '6a57fcf9-278c-4c70-8d5f-e2ddc8f6434f', 'update', 'event', '2021-01-19 16:38:36.281440'),
        (55, 'insert event', '18a7faf0-f44c-4659-ae7d-5d62b8310ce7', 'insert', 'event', '2021-01-19 16:39:24.212090'),
        (56, 'update team', '2', 'update', 'team', '2021-01-19 16:43:00.607961'),
        (57, 'update team', '4', 'update', 'team', '2021-01-19 16:43:03.713425'),
        (58, 'update team', '5', 'update', 'team', '2021-01-19 16:43:06.474190'),
        (59, 'update team', '6', 'update', 'team', '2021-01-19 16:43:13.481677'),
        (60, 'insert player', '8e614847-ec64-492c-af1a-f24044f78235', 'insert', 'player', '2021-01-19 16:44:46.804380'),
        (61, 'update team', '4', 'update', 'team', '2021-01-19 16:46:01.833185'),
        (62, 'insert player', 'e1128353-9194-4690-ba7f-5ebc41cbf73d', 'insert', 'player', '2021-01-19 16:47:54.354858'),
        (63, 'update team', '4', 'update', 'team', '2021-01-19 16:48:20.150534'),
        (64, 'update team', '1', 'update', 'team', '2021-01-19 16:57:49.697590'),
        (65, 'update team', '4', 'update', 'team', '2021-01-19 17:00:12.727728'),
        (66, 'update team', '5', 'update', 'team', '2021-01-19 17:01:19.544295'),
        (67, 'update team', '6', 'update', 'team', '2021-01-19 17:03:51.905563'),
        (68, 'update club', '5', 'update', 'club', '2021-01-19 17:09:04.856952'),
        (69, 'update club', '7', 'update', 'club', '2021-01-19 17:11:37.440255'),
        (70, 'update club', '2', 'update', 'club', '2021-01-19 17:12:07.628155'),
        (71, 'update club', '1', 'update', 'club', '2021-01-19 17:12:18.879189'),
        (72, 'update club', '6', 'update', 'club', '2021-01-19 17:12:47.540516'),
        (73, 'update club', '8', 'update', 'club', '2021-01-19 17:13:07.366065'),
        (74, 'update club', '4', 'update', 'club', '2021-01-19 17:16:13.923955'),
        (75, 'update club', '5', 'update', 'club', '2021-01-19 17:16:29.171956'),
        (76, 'update club', '3', 'update', 'club', '2021-01-19 17:16:36.671090'),
        (77, 'update club', '7', 'update', 'club', '2021-01-19 17:17:01.000418'),
        (78, 'update club', '2', 'update', 'club', '2021-01-19 17:17:11.694044'),
        (79, 'update club', '1', 'update', 'club', '2021-01-19 17:17:22.879331'),
        (80, 'update club', '8', 'update', 'club', '2021-01-19 17:18:02.545302'),
        (81, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-19 17:18:49.677752'),
        (82, 'insert team', '7', 'insert', 'team', '2021-01-19 17:44:38.033311'),
        (83, 'insert player', '3be416ee-388b-4ee1-a41a-3a0470ef2252', 'insert', 'player', '2021-01-19 17:45:21.154767'),
        (84, 'update team', '7', 'update', 'team', '2021-01-19 17:45:53.468820'),
        (85, 'insert player', 'fe0ff1cb-c6ef-4f61-8aa7-faa95f43ebfd', 'insert', 'player', '2021-01-19 17:47:37.310318'),
        (86, 'insert team', '8', 'insert', 'team', '2021-01-19 17:47:39.905474'),
        (87, 'update team', '8', 'update', 'team', '2021-01-19 17:47:52.488355'),
        (88, 'insert player', '1ad86934-4379-4d3a-8696-5acd04928cad', 'insert', 'player', '2021-01-19 17:48:23.742431'),
        (89, 'insert event', '8038526a-4f37-4409-ad2c-3a561d54f6d0', 'insert', 'event', '2021-01-19 17:48:26.664500'),
        (90, 'insert event', '39adfc26-051b-4912-a067-5327d5544766', 'insert', 'event', '2021-01-19 17:48:56.313231'),
        (91, 'update team', '4', 'update', 'team', '2021-01-19 17:49:13.705888'),
        (92, 'update team', '2', 'update', 'team', '2021-01-19 17:49:38.712674'),
        (93, 'insert club', '9', 'insert', 'club', '2021-01-19 17:50:52.007311'),
        (94, 'insert team', '9', 'insert', 'team', '2021-01-19 17:50:54.491653'),
        (95, 'update team', '9', 'update', 'team', '2021-01-19 17:51:04.076111'),
        (96, 'insert federation', '4', 'insert', 'federation', '2021-01-19 17:52:46.162154'),
        (97, 'update event', '8a82947a-eba3-4a41-b2f3-4d9555d27c83', 'update', 'event', '2021-01-19 17:53:05.554836'),
        (98, 'update event', '18a7faf0-f44c-4659-ae7d-5d62b8310ce7', 'update', 'event', '2021-01-19 17:53:05.554836'),
        (99, 'update event', 'a0fab8b5-907a-4ec9-b739-b68fd884a2a1', 'update', 'event', '2021-01-19 17:53:05.554836'),
        (100, 'update event', '6a57fcf9-278c-4c70-8d5f-e2ddc8f6434f', 'update', 'event', '2021-01-19 17:53:05.554836'),
        (103, 'update event', '39adfc26-051b-4912-a067-5327d5544766', 'update', 'event', '2021-01-19 17:53:54.191264'),
        (104, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-19 17:53:54.191264'),
        (105, 'update event', '8038526a-4f37-4409-ad2c-3a561d54f6d0', 'update', 'event', '2021-01-19 17:53:54.191264'),
        (101, 'insert league', '6', 'insert', 'league', '2021-01-19 17:53:13.553338'),
        (102, 'update league', '6', 'update', 'league', '2021-01-19 17:53:36.024224'),
        (106, 'insert team', '10', 'insert', 'team', '2021-01-19 17:55:04.545406'),
        (107, 'update team', '10', 'update', 'team', '2021-01-19 17:55:29.824309'),
        (108, 'insert player', '21d04095-2eff-440d-9447-e69bf7ac9eaa', 'insert', 'player', '2021-01-19 17:57:06.119387'),
        (109, 'insert player', '446964b6-98fc-4a27-a38c-8bf5bd8c6cc9', 'insert', 'player', '2021-01-19 17:57:25.012224'),
        (110, 'insert player', '8d3d4440-370e-460f-b72a-3e30dad89638', 'insert', 'player', '2021-01-19 17:57:51.591919'),
        (111, 'insert event', '51ba6301-4a5d-493e-af00-492f686d0706', 'insert', 'event', '2021-01-19 18:01:31.713330'),
        (112, 'update event', '51ba6301-4a5d-493e-af00-492f686d0706', 'update', 'event', '2021-01-19 18:03:18.052887'),
        (113, 'insert player', '6312dc10-88df-4df7-973e-17d6285f3d43', 'insert', 'player', '2021-01-19 18:03:28.631368'),
        (114, 'insert player', 'bf78a84c-87dd-4bc2-89a5-f13a0ee1a8e6', 'insert', 'player', '2021-01-19 18:03:52.291775'),
        (115, 'insert player', 'c213031e-f512-470a-998b-eebe79ca88b7', 'insert', 'player', '2021-01-19 18:04:21.331439'),
        (116, 'update team', '2', 'update', 'team', '2021-01-19 18:05:02.588380'),
        (117, 'insert player', '69e64463-48ac-4d8d-9923-8ac5e1d72dba', 'insert', 'player', '2021-01-19 18:05:40.920029'),
        (118, 'insert player', '5a71cacb-2fc2-4e6e-8249-9228f9626ace', 'insert', 'player', '2021-01-19 18:05:57.568262'),
        (119, 'insert player', '1c5c5822-d590-4a5f-b1f0-a981f5c95458', 'insert', 'player', '2021-01-19 18:06:17.671085'),
        (120, 'update team', '7', 'update', 'team', '2021-01-19 18:06:44.970253'),
        (121, 'insert player', '8ddfe713-7499-4933-99c9-0f2cc7a3977a', 'insert', 'player', '2021-01-19 18:07:41.920797'),
        (122, 'insert player', '528aadf3-4b83-4119-964c-2fed03a7dc94', 'insert', 'player', '2021-01-19 18:07:57.625802'),
        (123, 'insert player', '04abf440-fa51-43c2-afca-cfad45e118a8', 'insert', 'player', '2021-01-19 18:08:15.766158'),
        (124, 'update team', '10', 'update', 'team', '2021-01-19 18:09:00.172723'),
        (125, 'insert player', '16cc283c-2fef-4d64-b5d5-69892abd2517', 'insert', 'player', '2021-01-19 18:10:15.298774'),
        (126, 'insert player', 'be5b564e-c7f8-4214-b287-64187c794133', 'insert', 'player', '2021-01-19 18:10:44.305521'),
        (127, 'update team', '8', 'update', 'team', '2021-01-19 18:11:17.731772'),
        (128, 'insert player', 'ee933874-936c-4377-9d28-dabc4c537df0', 'insert', 'player', '2021-01-19 18:11:51.008042'),
        (129, 'insert player', 'cc8718ec-37b1-42f2-8fe0-9ed47cbb1e4c', 'insert', 'player', '2021-01-19 18:12:14.544427'),
        (130, 'update team', '9', 'update', 'team', '2021-01-19 18:13:37.751559'),
        (131, 'insert player', 'abcc9ede-bd4a-47e6-ab19-3f01cb8f4734', 'insert', 'player', '2021-01-19 18:14:56.284300'),
        (132, 'update team', '3', 'update', 'team', '2021-01-19 18:15:17.348655'),
        (133, 'update team', '2', 'update', 'team', '2021-01-19 19:42:47.311230'),
        (134, 'insert event', '6568268d-9a78-4830-8e68-968b0bb0c764', 'insert', 'event', '2021-01-20 09:26:08.398841'),
        (135, 'insert championship', '5', 'insert', 'championship', '2021-01-20 09:30:31.252509'),
        (136, 'update championship', '1', 'update', 'championship', '2021-01-20 09:30:38.554586'),
        (137, 'update championship', '3', 'update', 'championship', '2021-01-20 09:30:43.585587'),
        (138, 'update championship', '2', 'update', 'championship', '2021-01-20 09:30:52.055409'),
        (140, 'insert event', '4bd7bbb6-1631-4c02-8436-75194c7a0cf4', 'insert', 'event', '2021-01-20 09:35:18.578566'),
        (141, 'insert event', '7827d041-7937-4d07-af3a-f6d2d55662ce', 'insert', 'event', '2021-01-20 09:38:15.304324'),
        (142, 'update event', '7827d041-7937-4d07-af3a-f6d2d55662ce', 'update', 'event', '2021-01-20 09:39:07.191124'),
        (143, 'update event', '7827d041-7937-4d07-af3a-f6d2d55662ce', 'update', 'event', '2021-01-20 09:43:04.783101'),
        (144, 'update event', '7827d041-7937-4d07-af3a-f6d2d55662ce', 'update', 'event', '2021-01-20 09:47:04.874151'),
        (145, 'delete event', '7827d041-7937-4d07-af3a-f6d2d55662ce', 'delete', 'event', '2021-01-20 09:52:32.887028'),
        (147, 'insert event', '8c77371a-7b23-4c9e-89e2-0d8bd294c72e', 'insert', 'event', '2021-01-20 09:53:32.731604'),
        (148, 'insert event', '6e533990-2d19-4031-9157-ac42e87557b9', 'insert', 'event', '2021-01-20 09:56:25.495377'),
        (149, 'insert event', '93d40df5-855f-4feb-a21c-009f19b47478', 'insert', 'event', '2021-01-20 09:57:44.078470'),
        (150, 'update federation', '4', 'update', 'federation', '2021-01-20 10:09:30.066821'),
        (151, 'insert league', '7', 'insert', 'league', '2021-01-20 10:09:38.747441'),
        (152, 'insert club', '10', 'insert', 'club', '2021-01-20 10:11:07.506479'),
        (153, 'update club', '10', 'update', 'club', '2021-01-20 10:12:09.347110'),
        (154, 'insert team', '11', 'insert', 'team', '2021-01-20 10:12:35.073671'),
        (155, 'update team', '11', 'update', 'team', '2021-01-20 10:12:55.199212'),
        (156, 'insert championship', '6', 'insert', 'championship', '2021-01-20 10:13:18.864996'),
        (157, 'update team', '11', 'update', 'team', '2021-01-20 10:22:24.139925'),
        (158, 'update championship', '6', 'update', 'championship', '2021-01-20 10:22:43.595102'),
        (159, 'update event', '6e533990-2d19-4031-9157-ac42e87557b9', 'update', 'event', '2021-01-20 10:23:32.760213'),
        (160, 'update event', '8c77371a-7b23-4c9e-89e2-0d8bd294c72e', 'update', 'event', '2021-01-20 10:23:48.778710'),
        (161, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-20 10:25:29.047557'),
        (162, 'update event', 'b2cad0a3-9127-454f-b832-512582388ef8', 'update', 'event', '2021-01-20 10:25:47.965612'),
        (163, 'insert event', '01c0e46a-2fe2-486b-99ed-2544731376b9', 'insert', 'event', '2021-01-20 10:26:54.556749'),
        (164, 'update event', '6e533990-2d19-4031-9157-ac42e87557b9', 'update', 'event', '2021-01-20 10:35:55.389268'),
        (165, 'update team', '5', 'update', 'team', '2021-01-20 10:36:48.742846'),
        (166, 'update team', '1', 'update', 'team', '2021-01-20 10:37:27.498332'),
        (167, 'update championship', '3', 'update', 'championship', '2021-01-20 10:47:28.922967');


-- Reset Serials Increments
SELECT SETVAL('league_id_seq', (SELECT MAX(id) FROM league));
SELECT SETVAL('sport_id_seq', (SELECT MAX(id) FROM sport));
SELECT SETVAL('championship_id_seq', (SELECT MAX(id) FROM championship));
SELECT SETVAL('federation_id_seq', (SELECT MAX(id) FROM federation));
SELECT SETVAL('team_id_seq', (SELECT MAX(id) FROM team));
SELECT SETVAL('event_log_id_seq', (SELECT MAX(id) FROM event_log));
SELECT SETVAL('stadium_id_seq', (SELECT MAX(id) FROM stadium));
SELECT SETVAL('club_id_seq', (SELECT MAX(id) FROM club));