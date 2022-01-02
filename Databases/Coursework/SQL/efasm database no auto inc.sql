/*Attributes - start with lowercase (secondWord <like this - no spaces);*/
/*Entities  - start with uppercase*/

/* Student name: Jurij Sevcenko           
Student username: adck921
*/

DROP TABLE IF EXISTS efasmMember,efasmFish,efasmLocale,efasmBait,efasmRods,efasmCaught,efasmHistory,efasmRodOwners;

/* SECTION 1 CREATE TABLE STATEMENTS */
CREATE TABLE efasmMember(
	memberId INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age	INTEGER NOT NULL,
	nationality VARCHAR(255) NOT NULL,
	address VARCHAR NOT NULL,
	townCity VARCHAR NOT NULL,
	contactPhone INTEGER NOT NULL,
	joinDate INTEGER NOT NULL
);

CREATE TABLE efasmFish(
	speciesName VARCHAR(255) NOT NULL PRIMARY KEY,
	maxSizeCM INTEGER NOT NULL,
	maxWeightKG INTEGER NOT NULL,
	maxAge INTEGER NOT NULL,
	primaryHabitat VARCHAR(255) NOT NULL,
	secondaryHabitat VARCHAR(255),
);

CREATE TABLE efasmLocale(
	postcode VARCHAR(255) NOT NULL,
	county VARCHAR(255) NOT NULL,
	locationName VARCHAR(255) NOT NULL,
	locationNumber INTEGER NOT NULL,
	environmentType VARCHAR(255) NOT NULL,
	PRIMARY KEY (locationName, locationNumber)
);

CREATE TABLE efasmHistory(
	memberId INTEGER NOT NULl,
	dateCaught INTEGER NOT NULL,
	timeCaught INTEGER NOT NULL,
	locality VARCHAR(255) NOT NULL,
	fishCaught VARCHAR(255) NOT NULL,
	fishWeightKG INTEGER NOT NULL, /*Needs to be float*/
	PRIMARY KEY (dateCaught,timeCaught)
	FOREIGN KEY (memberId) REFERENCES efasmMember(memberId)
);

CREATE TABLE efasmCaught(
	dateCaught INTEGER NOT NULL,
	timeCaught INTEGER NOT NULL,
	member INTEGER NOT NULL,
	fishCaught VARCHAR(255) NOT NULL,
	species VARCHAR(255) NOT NULL,
	weightKG INTEGER NOT NULL,
	localityName VARCHAR(255) NOT NULL,
	baitUsed VARCHAR(255),
	fishingRodUsed VARCHAR(255),
	PRIMARY KEY (dateCaught, timeCaught, memberId),
	FOREIGN KEY (memberId) REFERENCES efasmMember(memberId),
	FOREIGN KEY (species) REFERENCES efasmFish(speciesName),
	FOREIGN KEY (localityName) REFERENCES efasmLocale(locationName)
);

CREATE TABLE efasmFishLocality(
	locationName VARCHAR(255) NOT NULL,
	speciesName VARCHAR(255) NOT NULL,
	popularityScale INTEGER NOT NULL, /*out of 10, 10 being most popular and 1 being least popular*/
	PRIMARY KEY (localityName, speciesName),
	FOREIGN KEY (localityName) REFERENCES efasmLocale(locationName, locationNumber) /*this may need checking -send email*/
	FOREIGN KEY (speciesName) REFERENCES efasmFish(speciesName)
);

CREATE TABLE efasmRods(
	rodName VARCHAR(255) NOT NULL PRIMARY KEY,
	rodType VARCHAR(255) NOT NULL,
	rodWeight INTEGER NOT NULL, /*needs changing to float*/
	rodCapacity INTEGER NOT NULL,
);

CREATE TABLE efasmRodOwners(
	memberId INTEGER NOT NULL PRIMARY KEY,
	fishingRod VARCHAR(255) NOT NULL,
	FOREIGN KEY (memberId) REFERENCES efasmMember(memberId);
	FOREIGN KEY (fishingRod) REFERENCES efasmRods(rodName);
);

CREATE TABLE efasmBait(
	baitName VARCHAR(255) NOT NULL PRIMARY KEY,
	baitType VARCHAR(255) NOT NULL,
);

CREATE TABLE efasmFishBaited(
	fish VARCHAR(255) NOT NULL,
	bait VARCHAR(255) NOT NULL,
	PRIMARY KEY (fish, bait),
	FOREIGN KEY (fish) REFERENCES efasmFish(speciesName),
	FOREIGN KEY (bait) REFERENCES efasmBait(baitType)
);
/* SECTION 2 INSERT STATEMENTS */

INSERT INTO efasmMember (memberId,name,age,nationality,address,townCity,contactPhone,joinDate) 
	values(1,'Jurij Sevcenko',19,'Lithuanian','20 bob road','london', 07737548239,20200326),
	(2,'Lily Teylor',19,'British','10 trafalgar road','chelmsford',07728738910,20210623),
	(3,'Lewis Randal',20,'British','44 Wapshot Road','stains-upon-thames',07893216491,20190518),
	(4,'Ethan Tuffin',24,'Irish','48 The Drive','salisbury',07925482759,20200713),
	(5,'Ivan Sinitsin',32,'Russian','8 Manchester Road','colchester',07865274937,20191202),
	(6,'Alex Bagdonas'21,'Lithuanian','46 West Street','southend-On-Sea',079927164829,20180720),
	(7,'Zak Smith',27,'British','3 Church Road','guilford',07817283647,20200905),
	(8,'Andreas Bryson',42,'Greek','9843 Richmond Road','london',07739659375,20190301),
	(9,'Krishna Kopp',35,'Indian','62 North Road','gloucester',07728163729,20200526),
	(10,'Felix Jehlichka',29,'Latvian','70 Church Road','doncaster',07928374836,20180921),
	(11,'Okonkwo Moe',45,'British','8 Kingsway','wigan',07802756389,20190403),
	(12,'Annag Hiedler',37,'Swedish','84 High Street','exeter',07739725372,20200126),
	(13,'Zbigniew Schermer',51,'Austrian','419 North Street','bath',07947362561,20190705),
	(14,'Fiona Messina',46,'Spanish','21 Queensway','stevenage',07853726193,20210409),
	(15,'Gundahar Lucassen',37,'Nepalese','2 South Street','cambridge',07763628193,20210821),
	(16,'Beli Reuter',29,'German','22 Springfield Road','carlisle',077473625192,20181108);

/*name,cm,kg,yr,phab,shab*/
INSERT INTO efasmFish values('Esox lucius',150,28,25,'river','lake'),
    ('Perca',60,3,12,'river','lake'),
    ('Rutilus rutilus',50,3,18,'river','lake'),
    ('Abramis brama',90,9,29,'river','lake'),
    ('Cyprinus carpio',120,40,38,'lake','river'),
    ('Tinca tinca',70,2,15,'lake','river'),
    ('Oncorhynchus mykiss',115,22,7,'stream','lake');

/*postcode, county, name,num, environmenttype*/
INSERT INTO efasmLocale (postcode,county,locationName,locationNumber,environmentType)
	values('SL44TE', 'Berkshire', 'RoyalBerkshireFishery',1, 'Lake'),
	('RG270NQ', 'Hampshire', 'WatmoreFarmFishery',2, 'Lake'),
	('KT138LY', 'Surrey', 'WaltonOnThames',3,'River'),
	('TN129BS','Kent','MonkLakes',4,'Lake'),
	('CA110JS','Cumbria','Ullswater',5,'Lake'),
	('CM32JL','Essex','LakelandFishery',6,'Lake'),
	('C0107GA','Suffolk','FoxearthFisheries',7,'Lake');

/*memberID,Date,time,location,fish,weight*/
INSERT INTO efasmHistory values(1,20200328,2103,'Monk Lakes','Cyprinus carpio','4.3'),
	(1,20200329,2217,'Monk Lakes','Cyprinus carpio','2.1'),
	(1,20200329,2325,'Monk Lakes','Abramis brama','1.5'),
	(1,20200330,0245,'Monk Lakes','Abramis brama','1.2'),
	(1,20200623,0713,'WaltonOnThames','Esox lucius','1.5'),
	(1,20200623,0903,'WaltonOnThames','Perca','0.8'),
	(1,20200623,0954,'WaltonOnThames','Perca','1.2'),
	(1,20200623,1032,'WaltonOnThames','Rutilus rutilus','0.5'),
	(1,20200723,0646,'WaltonOnThames','Perca','1.1'),
	(1,20200723,0727,'WaltonOnThames','Perca','0.6'),
	(1,20200723,0843,'WaltonOnThames','Rutilus rutilus','0.3'),
	(1,20200723,0859,'WaltonOnThames','Rutilus rutilus','0.8'),
	(1,20200723,0918,'WaltonOnThames','Perca','0.8'),

	(2,20210328,0846,'LakelandFishery','Cyprinus carpio','1.8'),
	(2,20210328,0932,'LakelandFishery','Cyprinus carpio','2.2'),
	(2,20210328,0952,'LakelandFishery','Cyprinus carpio','1.3'),
	(2,20210328,1041,'LakelandFishery','Cyprinus carpio','3.8'),
	(2,20210328,1104,'LakelandFishery','Abramis brama','1'),
	(2,20210525,0826,'LakelandFishery','Cyprinus carpio','1.7'),
	(2,20210525,0856,'LakelandFishery','Cyprinus carpio','1.2'),
	(2,20210525,0916,'LakelandFishery','Tinca tinca','1.3'),
	(2,20210525,0946,'LakelandFishery','Abramis brama','1.1'),
	(2,20210525,0846,'LakelandFishery','Cyprinus carpio','2.7'),

	(3,20190524,0526,'FoxearthFisheries','Cyprinus carpio','1.7'),
	(3,20190524,0846,'FoxearthFisheries','Cyprinus carpio','1.9'),
	(3,20190524,0906,'FoxearthFisheries','Cyprinus carpio','7.0'),
	(3,20190524,0935,'FoxearthFisheries','Cyprinus carpio','4.5'),
	(3,20190524,1027,'FoxearthFisheries','Cyprinus carpio','3.6'),
	(3,20190524,1034,'FoxearthFisheries','Cyprinus carpio','5.2'),
	(3,20190524,1050,'FoxearthFisheries','Cyprinus carpio','2.2'),
	(3,20190524,1134,'FoxearthFisheries','Cyprinus carpio','6.7'),
	(3,20190915,0603,'FoxearthFisheries','Cyprinus carpio','4.2'),
	(3,20190915,0825,'FoxearthFisheries','Cyprinus carpio','5.9'),
	(3,20190915,0928,'FoxearthFisheries','Cyprinus carpio','3.4'),
	(3,20190915,1019,'FoxearthFisheries','Cyprinus carpio','1.5'),
	(3,20190915,1055,'FoxearthFisheries','Cyprinus carpio','2.8'),
	(3,20190915,1132,'FoxearthFisheries','Cyprinus carpio','9.1'),
	(3,20190915,1142,'FoxearthFisheries','Cyprinus carpio','6.7'),

	(4,20200715,0803,'Ullswater','Oncorhynchus mykiss','0.9'),
	(4,20200715,0822,'Ullswater','Rutilus rutilus','0.7'),
	(4,20200715,0851,'Ullswater','Perca','1.5'),
	(4,20200715,0906,'Ullswater','Perca','0.9'),
	(4,20200715,0928,'Ullswater','Oncorhynchus mykiss','1.1'),

	(5,20191231,0603,'RoyalBerkshireFishery','Cyprinus carpio','13.1'),
	(5,20191231,0622,'RoyalBerkshireFishery','Cyprinus carpio','9.7'),
	(5,20191231,0705,'RoyalBerkshireFishery','Cyprinus carpio','5.3'),
	(5,20191231,0729,'RoyalBerkshireFishery','Cyprinus carpio','10.9'),
	(5,20191231,0951,'RoyalBerkshireFishery','Cyprinus carpio','2.5'),
	(5,20200321,0621,'WatmoreFarmFishery','Cyprinus carpio','2.9'),
	(5,20200321,0811,'WatmoreFarmFishery','Abramis brama','3.3'),
	(5,20200321,0847,'WatmoreFarmFishery','Cyprinus carpio','4.6'),
	(5,20200321,0937,'WatmoreFarmFishery','Cyprinus carpio','14.5'),
	(5,20200321,1031,'WatmoreFarmFishery','Cyprinus carpio','11.3'),
	(5,20200321,1109,'WatmoreFarmFishery','Cyprinus carpio','3.7'),

	(6,20180720,0615,'LakelandFishery','Cyprinus carpio','5.8'),
	(6,20180720,0745,'LakelandFishery','Cyprinus carpio','10.6'),
	(6,20180720,0821,'LakelandFishery','Cyprinus carpio','7.1'),
	(6,20180720,0936,'LakelandFishery','Cyprinus carpio','2.9'),
	(6,20200922,0713,'LakelandFishery','Cyprinus carpio','8.3'),
	(6,20200922,0758,'LakelandFishery','Tinca tinca','3.4'),
	(6,20200922,0848,'LakelandFishery','Cyprinus carpio','4.7'),
	(6,20200922,1010,'LakelandFishery','Cyprinus carpio','7.5'),

	(7,20200923,0412,'WaltonOnThames','Rutilus rutilus','0.5'),
	(7,20200923,0557,'WaltonOnThames','Rutilus rutilus','0.5'),
	(7,20200923,0610,'WaltonOnThames','Perca','1.8'),
	(7,20200923,0642,'WaltonOnThames','Esox lucius','3.9'),
	(7,20200923,0748,'WaltonOnThames','Rutilus rutilus','0.4'),
	(7,20200317,0613,'WaltonOnThames','Rutilus rutilus','0.2'),
	(7,20200317,0621,'WaltonOnThames','Rutilus rutilus','0.6'),
	(7,20200317,0738,'WaltonOnThames','Rutilus rutilus','0.9'),
	(7,20200317,0742,'WaltonOnThames','Perca','1.3'),
	(7,20200317,0929,'WaltonOnThames','Perca','1.5'),

	(8,20200228,0613,'WaltonOnThames','Rutilus rutilus','1.0'),
	(8,20200228,0740,'WaltonOnThames','Rutilus rutilus','0.3'),
	(8,20200510,1857,'MonkLakes','Cyprinus carpio','7.5'),
	(8,20200510,1949,'MonkLakes','Esox lucius','4.6'),
	(8,20200511,0613,'MonkLakes','Abramis brama','1.3'),
	(8,20200511,0731,'MonkLakes','Cyprinus carpio','5.5'),
	(8,20200511,0819,'MonkLakes','Cyprinus carpio','2.8'),

	(9,20200528,0813,'Ullswater','Perca','6.1'),
	(9,20200528,0845,'Ullswater','Oncorhynchus mykiss','3.4'),
	(9,20200528,0915,'Ullswater','Rutilus rutilus','0.7'),
	(9,20200528,1029,'Ullswater','Oncorhynchus mykiss','1.5'),
	(9,20200528,1137,'Ullswater','Perca','0.8'),
	(9,20200528,1223,'Ullswater','Perca','0.5'),
	(9,20200528,1304,'Ullswater','Esox lucius','2.6'),

	(10,20181005,0613,'Ullswater','Perca','0.9'),
	(10,20181005,0753,'Ullswater','Oncorhynchus mykiss','2.4'),
	(10,20181005,0818,'Ullswater','Perca','0.8'),
	(10,20181005,0839,'Ullswater','Rutilus rutilus','1.1'),
	(10,20181005,0921,'Ullswater','Perca','1.4'),
	(10,20181005,0959,'Ullswater','Perca','1.1'),

	(11,20190415,0740,'Ullswater','Perca','0.9'),
	(11,20190415,0613 ,'Ullswater','Rutilus rutilus','0.8'),
	(11,20190415,0613,'Ullswater','Perca','0.8'),
	(11,20190415,0613,'Ullswater','Perca','0.9'),
	(11,20190702,0613,'LakelandFishery','Cyprinus carpio','6.1'),
	(11,20190702,0613,'LakelandFishery','Cyprinus carpio','9.3'),
	(11,20190702,0613,'LakelandFishery','Tinca tinca','4.2'),
	(11,20190702,0613,'LakelandFishery','Tinca tinca','2.7'),
	(11,20190702,0613,'LakelandFishery','Cyprinus carpio','5.8'),
	(11,20210328,0613,'RoyalBerkshireFishery','Cyprinus carpio','4.6'),
	(11,20210328,0613,'RoyalBerkshireFishery','Rutilus rutilus','0.9'),
	(11,20210328,0613,'RoyalBerkshireFishery','Rutilus rutilus','0.8'),
	(11,20210328,0613,'RoyalBerkshireFishery','Cyprinus carpio','2.8'),

	(12,20200630,0613,'RoyalBerkshireFishery','Cyprinus carpio','6.1'),
	(12,20200630,0613,'RoyalBerkshireFishery','Cyprinus carpio','3.4'),
	(12,20200630,0613,'RoyalBerkshireFishery','Cyprinus carpio','2.7'),
	(12,20200630,0613,'RoyalBerkshireFishery','Rutilus rutilus','0.5'),
	(12,20200630,0613,'RoyalBerkshireFishery','Cyprinus carpio','8.4'),
	(12,20210504,0613,'WatmoreFarmFishery','Cyprinus carpio','6.8'),
	(12,20210504,0613,'WatmoreFarmFishery','Cyprinus carpio','3.6'),
	(12,20210504,0613,'WatmoreFarmFishery','Abramis brama','2.8'),
	(12,20210504,0613,'WatmoreFarmFishery','Abramis brama','1.6'),

	(13,20190719,0613,'WatmoreFarmFishery','Cyprinus carpio','4.2'),
	(13,20190719,0613,'WatmoreFarmFishery','Cyprinus carpio','7.5'),
	(13,20190719,0613,'WatmoreFarmFishery','Cyprinus carpio','8.4'),
	(13,20190719,0613,'WatmoreFarmFishery','Cyprinus carpio','6.8'),
	(13,20200809,0613,'Ullswater','Perca','0.9'),
	(13,20200809,0613,'Ullswater','Perca','0.3'),
	(13,20200809,0613,'Ullswater','Rutilus rutilus','0.5'),

	(14,20210502,0613,'FoxearthFisheries','Cyprinus carpio','6.8'),
	(14,20210502,0613,'FoxearthFisheries','Cyprinus carpio','1.9'),
	(14,20210502,0613,'FoxearthFisheries','Cyprinus carpio','3.4'),
	(14,20210502,0613,'FoxearthFisheries','Cyprinus carpio','1.5'),
	(14,20210730,0613,'LakelandFishery','Cyprinus carpio','3.4'),
	(14,20210730,0613,'LakelandFishery','Abramis brama','0.7'),
	(14,20210730,0613,'LakelandFishery','Tinca tinca','2.3'),
	(14,20210730,0613,'LakelandFishery','Cyprinus carpio','12.7'),
	(14,20210730,0613,'LakelandFishery','Cyprinus carpio','8.9'),

	(15,20210821,0613,'FoxearthFisheries','Abramis brama','2.6'),
	(15,20210821,0613,'FoxearthFisheries','Cyprinus carpio','1.2'),
	(15,20210821,0613,'FoxearthFisheries','Cyprinus carpio','12.3'),
	(15,20210821,0613,'FoxearthFisheries','Tinca tinca','2.1'),
	(15,20210821,0613,'FoxearthFisheries','Abramis brama','1.7'),
	(15,20210821,0613,'FoxearthFisheries','Cyprinus carpio','3.4'),
	(15,20210821,0613,'FoxearthFisheries','Cyprinus carpio','12.9'),
	(15,20210821,0613,'FoxearthFisheries','Cyprinus carpio','6.6'),

	(16,20181109,0613,'Ullswater','Perca','1.4'),
	(16,20181109,0613,'Ullswater','Perca','1.7'),
	(16,20181109,0613,'Ullswater','Oncorhynchus mykiss','3.4'),
	(16,20181109,0613,'Ullswater','Oncorhynchus mykiss','2.9'),
	(16,20181109,0613,'Ullswater','Oncorhynchus mykiss','3.5'),
	(16,20181109,0613,'Ullswater','Oncorhynchus mykiss','1.4'),
	(16,20190724,0613,'Ullswater','Oncorhynchus mykiss','3.4'),
	(16,20190724,0613,'Ullswater','Oncorhynchus mykiss','2.7'),
	(16,20190724,0613,'Ullswater','Perca','1.6'),
	(16,20190724,0613,'Ullswater','Perca','1.7'),
	(16,20190724,0613,'Ullswater','Perca','0.9'),
	(16,20190724,0613,'Ullswater','Perca','1.1'),
	(16,20190724,0613,'Ullswater','Oncorhynchus mykiss','2.3'),
	(16,20200428,0613,'Ullswater','Oncorhynchus mykiss','1.7'),
	(16,20200428,0613,'Ullswater','Perca','0.4'),
	(16,20200428,0613,'Ullswater','Perca','0.8'),
	(16,20200428,0613,'Ullswater','Oncorhynchus mykiss','3.1'),
	(16,20200428,0613,'Ullswater','Perca','1.2'),
	(16,20200428,0613,'Ullswater','Perca','0.7'),
	(16,20200428,0613,'Ullswater','Oncorhynchus mykiss','1.9'),
	(16,20200428,0613,'Ullswater','Perca','0.9'),


INSERT INTO efasmCaught values(20210203,0745,1,'Esox lucius','2','WaltonOnThames','Deadly','shakespear'),
	(202);

/*Loc, spe, pop*/
INSERT INTO efasmFishLocality values('RoyalBerkshireFishery...','Cyprinus carpio',10),
	('RoyalBerkshireFishery...','Perca',4),
	('RoyalBerkshireFishery...','Abramis brama',6),
	('RoyalBerkshireFishery...','Tinca tinca',5),
	('RoyalBerkshireFishery...','Rutilus rutilus',4),
	('WatmoreFarmFishery...','Perca',6),
	('WatmoreFarmFishery...','Cyprinus carpio',8),
	('WatmoreFarmFishery...','Rutilus rutilus',3),
	('WatmoreFarmFishery...','Tinca tinca',6),
	('WaltonOnThames...','Perca',6),
	('WaltonOnThames...','Esox lucius',5),
	('WaltonOnThames...','Rutilus rutilus',8),
	('WaltonOnThames...','Cyprinus carpio',2),
	('MonkLakes...','Esox lucius',2),
	('MonkLakes...','Cyprinus carpio',9),
	('MonkLakes...','Abramis brama',8),
	('MonkLakes...','Tinca tinca',8),
	('Ullswater...','Esox lucius',2),
	('Ullswater...','Perca',6),
	('Ullswater...','Rutilus rutilus',5),
	('Ullswater...','Oncorhynchus mykiss',3),
	('LakelandFishery...','Esox lucius',1),
	('LakelandFishery...','Cyprinus carpio',10),
	('LakelandFishery...','Abramis brama',8),
	('LakelandFishery...','Tinca tinca',9),
	('FoxearthFisheries...','Perca',4),
	('FoxearthFisheries...','Cyprinus carpio',8),
	('FoxearthFisheries...','Abramis brama',7),
	('FoxearthFisheries...','Tinca tinca',5);

INSERT INTO efasmRods values('dlina','Poole',1.0,10),
	('skladnaya','Compact',0.3,3),
	('donka','type',0.4,6),
	('Flai','Fly',0.3,10),
	('shakespear','Spinner',0.45,5); /*Need more Rods*/

INSERT INTO efasmRodOwners values();

INSERT INTO efasmBait values('Striker','Pelets'),
	('Plunger','Ground Bait'),
	('Gobler','Balls'),
	('Deadly','Dead Fish'),
	('Lively','Live Fish')
	("Short'n'Sqigly",'Maggots'),
	('Sweetcorn','Sweetcorn'),
	('Earth Worm','Earth Worm')
	('Dough','Dough'); /*Need more baits*/

INSERT INTO efasmFishBaited values('Esox Lucius','Dead Fish'),
	('Esox Lucius','Live Fish'),

	('Perca','Dead Fish'),
	('Perca','Pelets'),
	('Perca','Live Fish'),
	('Perca','Maggots'),
	('Perca','Dough'),

	('Rutilus rutilus','Pelets'),
	('Rutilus rutilus','Maggots'),
	('Rutilus rutilus','Dough'),

	('Abramis brama','Pelets'),
	('Abramis brama','Sweetcorn'),
	('Abramis brama','Earth Worm'),
	('Abramis brama','Dough'),
	('Abramis brama','Maggots'),
	('Abramis brama','Ground Bait'),

	('Cyprinus carpio','Pelets'),
	('Cyprinus carpio','Balls'),
	('Cyprinus carpio','Sweetcorn'),
	('Cyprinus carpio','Maggots'),
	('Cyprinus carpio','Ground Bait'),
	('Cyprinus carpio','Earth Worm'),

	('Tinca tinca','Pelets'),
	('Tinca tinca','Sweetcorn'),
	('Tinca tinca','Maggots'),
	('Tinca tinca','Ground Bait'),
	('Tinca tinca','Earth Worm'),

	('Oncorhynchus mykiss','Earth Worm'),
	('Oncorhynchus mykiss','Maggots'),
	('Oncorhynchus mykiss','Live Fish');

/* SECTION 3 UPDATE STATEMENTS */



/* SECTION 4 SINGLE TABLE QUERIES */


/* 
1)  

*/



/* 
2)  

*/




/* 
3)  

*/



/* 
4)  

*/




/* 
5)  

*/



/* 
6)  

*/



/* SECTION 5 MULTIPLE TABLE QUERIES */


/* 
1)  

*/



/* 
2)  

*/



/* 
3)  

*/


 

/* 
4)  

*/



/* 
5)  

*/




/* 
6)  

*/



/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)



*/

/* SECTION 6 DROP TABLES (make sure the SQL is commented out in this section)



*/