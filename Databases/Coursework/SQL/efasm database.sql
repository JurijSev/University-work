/*Attributes - start with lowercase (secondWord <like this - no spaces);*/
/*Entities  - start with uppercase*/

/* Student name: Jurij Sevcenko           
Student username: adck921
*/

DROP TABLE IF EXISTS efasmMember,efasmFish,efasmLocale,efasmBait,efasmRods,efasmCaught,efasmHistory,efasmRodOwners;

/* SECTION 1 CREATE TABLE STATEMENTS */
CREATE TABLE efasmMember(
	memberId INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
	locationNumber INTEGER NOT NULL AUTO_INCREMENT,
	environmentType VARCHAR(255) NOT NULL,
	PRIMARY KEY (locationName, locationNumber)
);

CREATE TABLE efasmHistory(
	memberId INTEGER NOT NULl,
	dateCaught INTEGER NOT NULL,
	timeCaught INTEGER NOT NULL,
	locality VARCHAR(255) NOT NULL,
	fishCaught VARCHAR(255) NOT NULL,
	fishWeightKG INTEGER NOT NULL,
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

INSERT INTO efasmMember (name,age,nationality,address,townCity,contactPhone,joinDate) 
	values('Jurij Sevcenko',19,'Lithuanian','20 bob road','london', 07737548239,20200326),
	('Lily Teylor',19,'British','10 trafalgar road','chelmsford',07728738910,20210623),
	('Lewis Randal',20,'British','44 Wapshot Road','stains-upon-thames',07893216491,20190518),
	('Ethan Tuffin',24,'Irish','48 The Drive','salisbury',07925482759,20200713),
	('Ivan Sinitsin',32,'Russian','8 Manchester Road','colchester',07865274937,20191202),
	('Alex Bagdonas'21,'Lithuanian','46 West Street','southend-On-Sea',079927164829,20180720),
	('Zak Smith',27,'British','3 Church Road','guilford',07817283647,20200905),
	('Andreas Bryson',42,'Greek','9843 Richmond Road','london',07739659375,20190301),
	('Krishna Kopp',35,'Indian','62 North Road','gloucester',07728163729,20200526),
	('Felix Jehlichka',29,'Latvian','70 Church Road','doncaster',07928374836,20180921),
	('Okonkwo Moe',45,'British','8 Kingsway','wigan',07802756389,20190403),
	('Annag Hiedler',37,'Swedish','84 High Street','exeter',07739725372,20200126),
	('Zbigniew Schermer',51,'Austrian','419 North Street','bath',07947362561,20190705),
	('Fiona Messina',46,'Spanish','21 Queensway','stevenage',07853726193,20210409),
	('Gundahar Lucassen',37,'Nepalese','2 South Street','cambridge',07763628193,20210821),
	('Beli Reuter',29,'German','22 Springfield Road','carlisle',077473625192,20181108);

/*name,cm,kg,yr,phab,shab*/
INSERT INTO efasmFish values('Esox lucius',150,28,25,'river','lake'),
    ('Perca',60,3,12,'river','lake'),
    ('Rutilus rutilus',50,3,18,'river','lake'),
    ('Abramis brama',90,9,29,'river','lake'),
    ('Cyprinus carpio',120,40,38,'lake','river'),
    ('Tinca tinca',70,2,15,'lake','river'),
    ('oncorhynchus mykiss',115,22,7,'stream','lake');

/*postcode, county, name, environmenttype*/
INSERT INTO efasmLocale (postcode,county,locationName,environmentType)
	values('SL44TE', 'Berkshire', 'RoyalBerkshireFishery', 'Lake'),
	('RG270NQ', 'Hampshire', 'WatmoreFarmFishery', 'Lake'),
	('KT138LY', 'Surrey', 'WaltonOnThames','River'),
	('TN129BS','Kent','MonkLakes','Lake'),
	('CA110JS','Cumbria','Ullswater','Lake'),
	('CM32JL','Essex','LakelandFishery','Lake'),
	('C0107GA','Suffolk','FoxearthFisheries','Lake');

/*memberID,Date,time,location,fish,weight*/
INSERT INTO efasmHistory values(,,,'Monk Lakes','');

INSERT INTO efasmCaught values(20210203,0745,memberId,'Esox lucius','2','WaltonOnThames','Deadly','shakespear');

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
	('Ullswater...','oncorhynchus mykiss',3),
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

	('oncorhynchus mykiss','Earth Worm'),
	('oncorhynchus mykiss','Maggots'),
	('oncorhynchus mykiss','Live Fish');

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