/*Attributes - start with lowercase (secondWord <like this - no spaces);*/
/*Entities  - start with uppercase*/

/* Student name: Jurij Sevcenko           
Student username: adck921
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS adck921Caught;
DROP TABLE IF EXISTS adck921FishLocality;
DROP TABLE IF EXISTS adck921FishBaited;
DROP TABLE IF EXISTS adck921RodOwners;
DROP TABLE IF EXISTS adck921History;
DROP TABLE IF EXISTS adck921Locale;
DROP TABLE IF EXISTS adck921Member;
DROP TABLE IF EXISTS adck921Fish;
DROP TABLE IF EXISTS adck921Rods;
DROP TABLE IF EXISTS adck921Bait;
SET FOREIGN_KEY_CHECKS=1;

/* SECTION 1 CREATE TABLE STATEMENTS */
CREATE TABLE adck921Member(
	memberId INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age	INTEGER NOT NULL,
	nationality VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	townCity VARCHAR(255) NOT NULL,
	contactPhone BIGINT NOT NULL,
	joinDate INTEGER NOT NULL
);

CREATE TABLE adck921Fish(
	speciesName VARCHAR(255) NOT NULL,
	maxSizeCM INTEGER NOT NULL,
	maxWeightKG INTEGER NOT NULL,
	maxAge INTEGER NOT NULL,
	primaryHabitat VARCHAR(255) NOT NULL,
	secondaryHabitat VARCHAR(255),
	PRIMARY KEY (speciesName)
);

CREATE TABLE adck921Locale(
	postcode VARCHAR(255) NOT NULL,
	county VARCHAR(255) NOT NULL,
	locationName VARCHAR(255) NOT NULL,
	locationNumber INTEGER NOT NULL,
	environmentType VARCHAR(255) NOT NULL,
	PRIMARY KEY (locationName)
);

CREATE TABLE adck921History(
	memberId INTEGER NOT NULl,
	dateCaught INTEGER NOT NULL,
	timeCaught INTEGER NOT NULL,
	locality VARCHAR(255) NOT NULL,
	fishCaught VARCHAR(255) NOT NULL,
	fishWeightKG FLOAT(5) NOT NULL,
	PRIMARY KEY (dateCaught,timeCaught),
	FOREIGN KEY (memberId) REFERENCES adck921Member(memberId)
);

CREATE TABLE adck921Caught(
	dateCaught INTEGER NOT NULL,
	timeCaught INTEGER NOT NULL,
	memberId INTEGER NOT NULL,
	fishCaught VARCHAR(255) NOT NULL,
	species VARCHAR(255) NOT NULL,
	weightKG FLOAT(5) NOT NULL,
	localityName VARCHAR(255) NOT NULL,
	baitUsed VARCHAR(255),
	fishingRodUsed VARCHAR(255),
	PRIMARY KEY (dateCaught, timeCaught, memberId),
	FOREIGN KEY (memberId) REFERENCES adck921Member(memberId),
	FOREIGN KEY (species) REFERENCES adck921Fish(speciesName),
	FOREIGN KEY (localityName) REFERENCES adck921Locale(locationName)
);

CREATE TABLE adck921FishLocality(
	localityName VARCHAR(255) NOT NULL,
	speciesName VARCHAR(255) NOT NULL,
	popularityScale INTEGER(2) NOT NULL, /*out of 10, 10 being most popular and 1 being least popular*/
	PRIMARY KEY (localityName, speciesName),
	/*FOREIGN KEY (localityName) REFERENCES adck921Locale(locationName, locationNumber),*/ /*this may need checking -send email*/
	FOREIGN KEY (speciesName) REFERENCES adck921Fish(speciesName),
	FOREIGN KEY (localityName) REFERENCES adck921Locale(locationName)
);

CREATE TABLE adck921Rods(
	rodName VARCHAR(255) NOT NULL PRIMARY KEY,
	rodType VARCHAR(255) NOT NULL,
	rodWeight FLOAT(5) NOT NULL, /*needs changing to float*/
	rodCapacity FLOAT(5) NOT NULL
);

CREATE TABLE adck921RodOwners(
	memberId INTEGER NOT NULL,
	fishingRod VARCHAR(255) NOT NULL,
	PRIMARY KEY (memberId, fishingRod),
	FOREIGN KEY (memberId) REFERENCES adck921Member(memberId),
	FOREIGN KEY (fishingRod) REFERENCES adck921Rods(rodName)
);

CREATE TABLE adck921Bait(
	baitName VARCHAR(255) NOT NULL,
	baitType VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE adck921FishBaited(
	fish VARCHAR(255) NOT NULL,
	bait VARCHAR(255) NOT NULL,
	PRIMARY KEY (fish, bait),
	FOREIGN KEY (fish) REFERENCES adck921Fish(speciesName),
	FOREIGN KEY (bait) REFERENCES adck921Bait(baitType)
);
/* SECTION 2 INSERT STATEMENTS */

INSERT INTO adck921Member VALUES(1,'Jurij Sevcenko',19,'Lithuamian','20 Butt road','london', 07737548239,20200326),
	(2,'Lily Teylor',19,'British','10 trafalgar road','chelmsford',07728738910,20210623),
	(3,'Lewis Randal',20,'British','44 Wapshot Road','stains-upon-thames',07893216491,20190518),
	(4,'Ethan Tuffin',24,'Irish','48 The Drive','salisbury',07925482759,20200713),
	(5,'Ivan Sinitsin',32,'Russian','36 Ashley Street','ipswich',07865274937,20191202),
	(6,'Alex Bagdonas',21,'Lithuanian','46 West Street','southend-On-Sea',079927164829,20180720),
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
INSERT INTO adck921Fish VALUES('Esox lucius',150,28,25,'river','lake'),
    ('Perca',60,3,12,'river','lake'),
    ('Rutilus rutilus',50,3,18,'river','lake'),
    ('Abramis brama',90,9,29,'river','lake'),
    ('Cyprinus carpio',120,40,38,'lake','river'),
    ('Tinca tinca',70,2,15,'lake',null),
    ('Oncorhynchus mykiss',115,22,7,'stream','lake');

/*postcode, county, name,num, environmenttype*/
INSERT INTO adck921Locale (postcode,county,locationName,locationNumber,environmentType)
	VALUES('SL44TE', 'Berkshire', 'RoyalBerkshireFishery',1, 'Lake'),
	('RG270NQ', 'Hampshire', 'WatmoreFarmFishery',2, 'Lake'),
	('KT138LY', 'Surrey', 'WaltonOnThames',3,'River'),
	('TN129BS','Kent','MonkLakes',4,'Lake'),
	('CA110JS','Cumbria','Ullswater',5,'Lake'),
	('CM32JL','Essex','LakelandFishery',6,'Lake'),
	('C0107GA','Suffolk','FoxearthFisheries',7,'Lake');

/*memberID,Date,time,location,fish,weight*/
INSERT INTO adck921History VALUES(1,20200328,2103,'MonkLakes','Cyprinus carpio',4.3),
	(1,20200329,2217,'MonkLakes','Cyprinus carpio',2.1),
	(1,20200329,2325,'MonkLakes','Abramis brama',1.5),
	(1,20200330,0245,'MonkLakes','Abramis brama',1.2),
	(1,20200623,0713,'WaltonOnThames','Esox lucius',1.5),
	(1,20200623,0903,'WaltonOnThames','Perca',0.8),
	(1,20200623,0954,'WaltonOnThames','Perca',1.2),
	(1,20200623,1032,'WaltonOnThames','Rutilus rutilus',0.5),
	(1,20200723,0646,'WaltonOnThames','Perca',1.1),
	(1,20200723,0727,'WaltonOnThames','Perca',0.6),
	(1,20200723,0843,'WaltonOnThames','Rutilus rutilus',0.3),
	(1,20200723,0859,'WaltonOnThames','Rutilus rutilus',0.8),
	(1,20200723,0918,'WaltonOnThames','Perca',0.8),

	(2,20210328,0846,'LakelandFishery','Cyprinus carpio',1.8),
	(2,20210328,0932,'LakelandFishery','Cyprinus carpio',2.2),
	(2,20210328,0952,'LakelandFishery','Cyprinus carpio',1.3),
	(2,20210328,1041,'LakelandFishery','Cyprinus carpio',3.8),
	(2,20210328,1104,'LakelandFishery','Abramis brama',1),
	(2,20210525,0826,'LakelandFishery','Cyprinus carpio',1.7),
	(2,20210525,0856,'LakelandFishery','Cyprinus carpio',1.2),
	(2,20210525,0916,'LakelandFishery','Tinca tinca',1.3),
	(2,20210525,0946,'LakelandFishery','Abramis brama',1.1),
	(2,20210525,0846,'LakelandFishery','Cyprinus carpio',2.7),

	(3,20190524,0526,'FoxearthFisheries','Cyprinus carpio',1.7),
	(3,20190524,0846,'FoxearthFisheries','Cyprinus carpio',1.9),
	(3,20190524,0906,'FoxearthFisheries','Cyprinus carpio',7.0),
	(3,20190524,0935,'FoxearthFisheries','Cyprinus carpio',4.5),
	(3,20190524,1027,'FoxearthFisheries','Cyprinus carpio',3.6),
	(3,20190524,1034,'FoxearthFisheries','Cyprinus carpio',5.2),
	(3,20190524,1050,'FoxearthFisheries','Cyprinus carpio',2.2),
	(3,20190524,1134,'FoxearthFisheries','Cyprinus carpio',6.7),
	(3,20190915,0603,'FoxearthFisheries','Cyprinus carpio',4.2),
	(3,20190915,0825,'FoxearthFisheries','Cyprinus carpio',5.9),
	(3,20190915,0928,'FoxearthFisheries','Cyprinus carpio',3.4),
	(3,20190915,1019,'FoxearthFisheries','Cyprinus carpio',1.5),
	(3,20190915,1055,'FoxearthFisheries','Cyprinus carpio',2.8),
	(3,20190915,1132,'FoxearthFisheries','Cyprinus carpio',9.1),
	(3,20190915,1142,'FoxearthFisheries','Cyprinus carpio',6.7),

	(4,20200715,0803,'Ullswater','Oncorhynchus mykiss',0.9),
	(4,20200715,0822,'Ullswater','Rutilus rutilus',0.7),
	(4,20200715,0851,'Ullswater','Perca',1.5),
	(4,20200715,0906,'Ullswater','Perca',0.9),
	(4,20200715,0928,'Ullswater','Oncorhynchus mykiss',1.1),

	(5,20191231,0603,'RoyalBerkshireFishery','Cyprinus carpio',13.1),
	(5,20191231,0622,'RoyalBerkshireFishery','Cyprinus carpio',9.7),
	(5,20191231,0705,'RoyalBerkshireFishery','Cyprinus carpio',5.3),
	(5,20191231,0729,'RoyalBerkshireFishery','Cyprinus carpio',10.9),
	(5,20191231,0951,'RoyalBerkshireFishery','Cyprinus carpio',2.5),
	(5,20200321,0621,'WatmoreFarmFishery','Cyprinus carpio',2.9),
	(5,20200321,0811,'WatmoreFarmFishery','Abramis brama',3.3),
	(5,20200321,0847,'WatmoreFarmFishery','Cyprinus carpio',4.6),
	(5,20200321,0937,'WatmoreFarmFishery','Cyprinus carpio',14.5),
	(5,20200321,1031,'WatmoreFarmFishery','Cyprinus carpio',11.3),
	(5,20200321,1109,'WatmoreFarmFishery','Cyprinus carpio',3.7),

	(6,20180720,0615,'LakelandFishery','Cyprinus carpio',5.8),
	(6,20180720,0745,'LakelandFishery','Cyprinus carpio',10.6),
	(6,20180720,0821,'LakelandFishery','Cyprinus carpio',7.1),
	(6,20180720,0936,'LakelandFishery','Cyprinus carpio',2.9),
	(6,20200922,0713,'LakelandFishery','Cyprinus carpio',8.3),
	(6,20200922,0758,'LakelandFishery','Tinca tinca',3.4),
	(6,20200922,0848,'LakelandFishery','Cyprinus carpio',4.7),
	(6,20200922,1010,'LakelandFishery','Cyprinus carpio',7.5),

	(7,20200923,0412,'WaltonOnThames','Rutilus rutilus',0.5),
	(7,20200923,0557,'WaltonOnThames','Rutilus rutilus',0.5),
	(7,20200923,0610,'WaltonOnThames','Perca',1.8),
	(7,20200923,0642,'WaltonOnThames','Esox lucius',3.9),
	(7,20200923,0748,'WaltonOnThames','Rutilus rutilus',0.4),
	(7,20200317,0613,'WaltonOnThames','Rutilus rutilus',0.2),
	(7,20200317,0621,'WaltonOnThames','Rutilus rutilus',0.6),
	(7,20200317,0738,'WaltonOnThames','Rutilus rutilus',0.9),
	(7,20200317,0742,'WaltonOnThames','Perca',1.3),
	(7,20200317,0929,'WaltonOnThames','Perca',1.5),

	(8,20200228,0613,'WaltonOnThames','Rutilus rutilus',1.0),
	(8,20200228,0740,'WaltonOnThames','Rutilus rutilus',0.3),
	(8,20200510,1857,'MonkLakes','Cyprinus carpio',7.5),
	(8,20200510,1949,'MonkLakes','Esox lucius',4.6),
	(8,20200511,0613,'MonkLakes','Abramis brama',1.3),
	(8,20200511,0731,'MonkLakes','Cyprinus carpio',5.5),
	(8,20200511,0819,'MonkLakes','Cyprinus carpio',2.8),

	(9,20200528,0813,'Ullswater','Perca',1.1),
	(9,20200528,0845,'Ullswater','Oncorhynchus mykiss',3.4),
	(9,20200528,0915,'Ullswater','Rutilus rutilus',0.7),
	(9,20200528,1029,'Ullswater','Oncorhynchus mykiss',1.5),
	(9,20200528,1137,'Ullswater','Perca',0.8),
	(9,20200528,1223,'Ullswater','Perca',0.5),
	(9,20200528,1304,'Ullswater','Esox lucius',2.6),

	(10,20181005,0613,'Ullswater','Perca',0.9),
	(10,20181005,0753,'Ullswater','Oncorhynchus mykiss',2.4),
	(10,20181005,0818,'Ullswater','Perca',0.8),
	(10,20181005,0839,'Ullswater','Rutilus rutilus',1.1),
	(10,20181005,0921,'Ullswater','Perca',1.4),
	(10,20181005,0959,'Ullswater','Perca',1.1),

	(11,20190415,0740,'Ullswater','Perca',0.9),
	(11,20190415,0843 ,'Ullswater','Rutilus rutilus',0.8),
	(11,20190415,0951,'Ullswater','Perca',0.8),
	(11,20190415,1013,'Ullswater','Perca',0.9),
	(11,20190702,0627,'LakelandFishery','Cyprinus carpio',6.1),
	(11,20190702,0656,'LakelandFishery','Cyprinus carpio',9.3),
	(11,20190702,0720,'LakelandFishery','Tinca tinca',4.2),
	(11,20190702,0735,'LakelandFishery','Tinca tinca',2.7),
	(11,20190702,0744,'LakelandFishery','Cyprinus carpio',5.8),
	(11,20210328,0656,'RoyalBerkshireFishery','Cyprinus carpio',4.6),
	(11,20210328,0708,'RoyalBerkshireFishery','Rutilus rutilus',0.9),
	(11,20210328,0731,'RoyalBerkshireFishery','Rutilus rutilus',0.8),
	(11,20210328,0918,'RoyalBerkshireFishery','Cyprinus carpio',2.8),

	(12,20200630,0755,'RoyalBerkshireFishery','Cyprinus carpio',6.1),
	(12,20200630,0841,'RoyalBerkshireFishery','Cyprinus carpio',3.4),
	(12,20200630,0905,'RoyalBerkshireFishery','Cyprinus carpio',2.7),
	(12,20200630,0952,'RoyalBerkshireFishery','Rutilus rutilus',0.5),
	(12,20200630,1028,'RoyalBerkshireFishery','Cyprinus carpio',8.4),
	(12,20210504,0625,'WatmoreFarmFishery','Cyprinus carpio',6.8),
	(12,20210504,0719,'WatmoreFarmFishery','Cyprinus carpio',3.6),
	(12,20210504,0740,'WatmoreFarmFishery','Abramis brama',2.8),
	(12,20210504,0804,'WatmoreFarmFishery','Abramis brama',1.6),

	(13,20190719,0844,'WatmoreFarmFishery','Cyprinus carpio',4.2),
	(13,20190719,0923,'WatmoreFarmFishery','Cyprinus carpio',7.5),
	(13,20190719,1021,'WatmoreFarmFishery','Cyprinus carpio',8.4),
	(13,20190719,1046,'WatmoreFarmFishery','Cyprinus carpio',6.8),
	(13,20200809,0911,'Ullswater','Perca',0.9),
	(13,20200809,0957,'Ullswater','Perca',0.3),
	(13,20200809,1011,'Ullswater','Rutilus rutilus',0.5),

	(14,20210502,0631,'FoxearthFisheries','Cyprinus carpio',6.8),
	(14,20210502,0658,'FoxearthFisheries','Cyprinus carpio',1.9),
	(14,20210502,0724,'FoxearthFisheries','Cyprinus carpio',3.4),
	(14,20210502,0848,'FoxearthFisheries','Cyprinus carpio',1.5),
	(14,20210730,0601,'LakelandFishery','Cyprinus carpio',3.4),
	(14,20210730,0659,'LakelandFishery','Abramis brama',0.7),
	(14,20210730,0713,'LakelandFishery','Tinca tinca',2.3),
	(14,20210730,0752,'LakelandFishery','Cyprinus carpio',12.7),
	(14,20210730,0907,'LakelandFishery','Cyprinus carpio',8.9),

	(15,20210821,0814,'FoxearthFisheries','Abramis brama',2.6),
	(15,20210821,0821,'FoxearthFisheries','Cyprinus carpio',1.2),
	(15,20210821,0925,'FoxearthFisheries','Cyprinus carpio',12.3),
	(15,20210821,1014,'FoxearthFisheries','Tinca tinca',2.1),
	(15,20210821,1027,'FoxearthFisheries','Abramis brama',1.7),
	(15,20210821,1045,'FoxearthFisheries','Cyprinus carpio',3.4),
	(15,20210821,1105,'FoxearthFisheries','Cyprinus carpio',12.9),
	(15,20210821,1207,'FoxearthFisheries','Cyprinus carpio',6.6),

	(16,20181109,0617,'Ullswater','Perca',1.4),
	(16,20181109,0626,'Ullswater','Perca',1.7),
	(16,20181109,0641,'Ullswater','Oncorhynchus mykiss',3.4),
	(16,20181109,0715,'Ullswater','Oncorhynchus mykiss',2.9),
	(16,20181109,0749,'Ullswater','Oncorhynchus mykiss',3.5),
	(16,20181109,0811,'Ullswater','Oncorhynchus mykiss',1.4),
	(16,20190724,0611,'Ullswater','Oncorhynchus mykiss',3.4),
	(16,20190724,0652,'Ullswater','Oncorhynchus mykiss',2.7),
	(16,20190724,0733,'Ullswater','Perca',1.6),
	(16,20190724,0748,'Ullswater','Perca',1.7),
	(16,20190724,0810,'Ullswater','Perca',0.9),
	(16,20190724,0831,'Ullswater','Perca',1.1),
	(16,20190724,0926,'Ullswater','Oncorhynchus mykiss',2.3),
	(16,20200428,0636,'Ullswater','Oncorhynchus mykiss',1.7),
	(16,20200428,0713,'Ullswater','Perca',0.4),
	(16,20200428,0731,'Ullswater','Perca',0.8),
	(16,20200428,0829,'Ullswater','Oncorhynchus mykiss',3.1),
	(16,20200428,0849,'Ullswater','Perca',1.2),
	(16,20200428,0901,'Ullswater','Perca',0.7),
	(16,20200428,0919,'Ullswater','Oncorhynchus mykiss',1.9),
	(16,20200428,0959,'Ullswater','Perca',0.9);


INSERT INTO adck921Caught (memberId,dateCaught,timeCaught,localityName,fishCaught,species,weightKG,baitUsed,fishingRodUsed) 
	VALUES(1,20200328,2103,'MonkLakes','Carp','Cyprinus carpio',4.3,'Striker','Shakespear'),
	(1,20200329,2217,'MonkLakes','Carp','Cyprinus carpio',2.1,'Striker','Shakespear'),
	(1,20200329,2325,'MonkLakes','Bream','Abramis brama',1.5,"Short'n'Sqigly",'Shakespear'),
	(1,20200330,0245,'MonkLakes','Bream','Abramis brama',1.2,"Short'n'Sqigly",'Shakespear'),
	(1,20200623,0713,'WaltonOnThames','Pike','Esox lucius',1.5,"Deadly",'Shakespear'),
	(1,20200623,0903,'WaltonOnThames','Perch','Perca',0.8,"Short'n'Sqigly",'Shakespear'),
	(1,20200623,0954,'WaltonOnThames','Perch','Perca',1.2,"Short'n'Sqigly",'Shakespear'),
	(1,20200623,1032,'WaltonOnThames','Roach','Rutilus rutilus',0.5,"Short'n'Sqigly",'Daiwa'),
	(1,20200723,0646,'WaltonOnThames','Perch','Perca',1.1,"Short'n'Sqigly",'Shakespear'),
	(1,20200723,0727,'WaltonOnThames','Perch','Perca',0.6,"Short'n'Sqigly",'Shakespear'),
	(1,20200723,0843,'WaltonOnThames','Roach','Rutilus rutilus',0.3,"Short'n'Sqigly",'Daiwa'),
	(1,20200723,0859,'WaltonOnThames','Roach','Rutilus rutilus',0.8,"Short'n'Sqigly",'Daiwa'),
	(1,20200723,0918,'WaltonOnThames','Perch','Perca',0.8,"Short'n'Sqigly",'Shakespear'),

	(2,20210328,0846,'LakelandFishery','Carp','Cyprinus carpio',1.8,'Plunger','Furba'),
	(2,20210328,0932,'LakelandFishery','Carp','Cyprinus carpio',2.2,'Plunger','Furba'),
	(2,20210328,0952,'LakelandFishery','Carp','Cyprinus carpio',1.3,"Short'n'Sqigly",'Furba'),
	(2,20210328,1041,'LakelandFishery','Carp','Cyprinus carpio',3.8,'Gobler','Furba'),
	(2,20210328,1104,'LakelandFishery','Bream','Abramis brama',1,"Short'n'Sqigly",'Furba'),
	(2,20210525,0826,'LakelandFishery','Carp','Cyprinus carpio',1.7,"Short'n'Sqigly",'Furba'),
	(2,20210525,0856,'LakelandFishery','Carp','Cyprinus carpio',1.2,"Short'n'Sqigly",'Furba'),
	(2,20210525,0916,'LakelandFishery','Tench','Tinca tinca',1.3,"Short'n'Sqigly",'Furba'),
	(2,20210525,0946,'LakelandFishery','Bream','Abramis brama',1.1,'Dough','Furba'),
	(2,20210525,0846,'LakelandFishery','Carp','Cyprinus carpio',2.7,'Striker','Furba'),

	(3,20190524,0526,'FoxearthFisheries','Carp','Cyprinus carpio',1.7,'Striker','Donka'),
	(3,20190524,0846,'FoxearthFisheries','Carp','Cyprinus carpio',1.9,'Striker','Donka'),
	(3,20190524,0906,'FoxearthFisheries','Carp','Cyprinus carpio',7.0,'Striker','Donka'),
	(3,20190524,0935,'FoxearthFisheries','Carp','Cyprinus carpio',4.5,'Striker','Donka'),
	(3,20190524,1027,'FoxearthFisheries','Carp','Cyprinus carpio',3.6,'Striker','Donka'),
	(3,20190524,1034,'FoxearthFisheries','Carp','Cyprinus carpio',5.2,'Striker','Donka'),
	(3,20190524,1050,'FoxearthFisheries','Carp','Cyprinus carpio',2.2,'Striker','Donka'),
	(3,20190524,1134,'FoxearthFisheries','Carp','Cyprinus carpio',6.7,'Striker','Donka'),
	(3,20190915,0603,'FoxearthFisheries','Carp','Cyprinus carpio',4.2,'Striker','Donka'),
	(3,20190915,0825,'FoxearthFisheries','Carp','Cyprinus carpio',5.9,'Striker','Donka'),
	(3,20190915,0928,'FoxearthFisheries','Carp','Cyprinus carpio',3.4,'Striker','Donka'),
	(3,20190915,1019,'FoxearthFisheries','Carp','Cyprinus carpio',1.5,'Striker','Donka'),
	(3,20190915,1055,'FoxearthFisheries','Carp','Cyprinus carpio',2.8,'Striker','Donka'),
	(3,20190915,1132,'FoxearthFisheries','Carp','Cyprinus carpio',9.1,'Striker','Donka'),
	(3,20190915,1142,'FoxearthFisheries','Carp','Cyprinus carpio',6.7,'Striker','Donka'),

	(4,20200715,0803,'Ullswater','Trout','Oncorhynchus mykiss',1.9,'Flies','Sigma'),
	(4,20200715,0822,'Ullswater','Roach','Rutilus rutilus',0.7,"Short'n'Sqigly",'Daiwa'),
	(4,20200715,0851,'Ullswater','Perch','Perca',1.5,"Short'n'Sqigly",'Daiwa'),
	(4,20200715,0906,'Ullswater','Perch','Perca',0.9,"Short'n'Sqigly",'Daiwa'),
	(4,20200715,0928,'Ullswater','Trout','Oncorhynchus mykiss',0.4,"Short'n'Sqigly",'Daiwa'),

	(5,20191231,0603,'RoyalBerkshireFishery','Carp','Cyprinus carpio',13.1,'Gobler','Donka'),
	(5,20191231,0622,'RoyalBerkshireFishery','Carp','Cyprinus carpio',9.7,'Gobler','Dlina'),
	(5,20191231,0705,'RoyalBerkshireFishery','Carp','Cyprinus carpio',5.3,'Striker','Dlina'),
	(5,20191231,0729,'RoyalBerkshireFishery','Carp','Cyprinus carpio',10.9,'Gobler','Dlina'),
	(5,20191231,0951,'RoyalBerkshireFishery','Carp','Cyprinus carpio',2.5,'Striker','Dlina'),
	(5,20200321,0621,'WatmoreFarmFishery','Carp','Cyprinus carpio',2.9,'Plunger','Dlina'),
	(5,20200321,0811,'WatmoreFarmFishery','Bream','Abramis brama',3.3,'Plunger','Dlina'),
	(5,20200321,0847,'WatmoreFarmFishery','Carp','Cyprinus carpio',4.6,'Striker','Dlina'),
	(5,20200321,0937,'WatmoreFarmFishery','Carp','Cyprinus carpio',14.5,'Earth Worm','Donka'),
	(5,20200321,1031,'WatmoreFarmFishery','Carp','Cyprinus carpio',11.3,'Gobler','Dlina'),
	(5,20200321,1109,'WatmoreFarmFishery','Carp','Cyprinus carpio',3.7,'Striker','Dlina'),

	(6,20180720,0615,'LakelandFishery','Carp','Cyprinus carpio',5.8,'Sweetcorn','Sonik'),
	(6,20180720,0745,'LakelandFishery','Carp','Cyprinus carpio',10.6,'Plunger','Dlina'),
	(6,20180720,0821,'LakelandFishery','Carp','Cyprinus carpio',7.1,'Plunger','Dlina'),
	(6,20180720,0936,'LakelandFishery','Carp','Cyprinus carpio',2.9,'Sweetcorn','Sonik'),
	(6,20200922,0713,'LakelandFishery','Carp','Cyprinus carpio',8.3,'Plunger','Dlina'),
	(6,20200922,0758,'LakelandFishery','Tench','Tinca tinca',3.4,"Short'n'Sqigly",'Sonik'),
	(6,20200922,0848,'LakelandFishery','Carp','Cyprinus carpio',4.7,'Sweetcorn','Sonik'),
	(6,20200922,1010,'LakelandFishery','Carp','Cyprinus carpio',7.5,'Plunger','Dlina'),

	(7,20200923,0412,'WaltonOnThames','Roach','Rutilus rutilus',0.5,'Dough','Furba'),
	(7,20200923,0557,'WaltonOnThames','Roach','Rutilus rutilus',0.5,'Dough','Furba'),
	(7,20200923,0610,'WaltonOnThames','Perch','Perca',1.8,'Lively','Shakespear'),
	(7,20200923,0642,'WaltonOnThames','Pike','Esox lucius',3.9,'Lively','Shakespear'),
	(7,20200923,0748,'WaltonOnThames','Roach','Rutilus rutilus',0.4,'Dough','Furba'),
	(7,20200317,0613,'WaltonOnThames','Roach','Rutilus rutilus',0.2,'Dough','Furba'),
	(7,20200317,0621,'WaltonOnThames','Roach','Rutilus rutilus',0.6,'Dough','Furba'),
	(7,20200317,0738,'WaltonOnThames','Roach','Rutilus rutilus',0.9,'Dough','Furba'),
	(7,20200317,0742,'WaltonOnThames','Perch','Perca',1.3,'Lively','Shakespear'),
	(7,20200317,0929,'WaltonOnThames','Perch','Perca',1.5,'Lively','Shakespear'),

	(8,20200228,0613,'WaltonOnThames','Roach','Rutilus rutilus',1.0,'Dough','Daiwa'),
	(8,20200228,0740,'WaltonOnThames','Roach','Rutilus rutilus',0.3,'Dough','Daiwa'),
	(8,20200510,1857,'MonkLakes','Carp','Cyprinus carpio',7.5,'Earth Worm','Dlina'),
	(8,20200510,1949,'MonkLakes','Pike','Esox lucius',4.6,'Deadly','Shakespear'),
	(8,20200511,0613,'MonkLakes','Bream','Abramis brama',1.3,'Dough','Daiwa'),
	(8,20200511,0731,'MonkLakes','Carp','Cyprinus carpio',5.5,'Earth Worm','Dlina'),
	(8,20200511,0819,'MonkLakes','Carp','Cyprinus carpio',2.8,'Dough','Daiwa'),

	(9,20200528,0813,'Ullswater','Perch','Perca',1.1,'Lively','Furba'),
	(9,20200528,0845,'Ullswater','Trout','Oncorhynchus mykiss',3.4,'Flies','Sigma'),
	(9,20200528,0915,'Ullswater','Roach','Rutilus rutilus',0.7,"Short'n'Sqigly",'Furba'),
	(9,20200528,1029,'Ullswater','Trout','Oncorhynchus mykiss',1.5,'Flies','Sigma'),
	(9,20200528,1137,'Ullswater','Perch','Perca',0.8,'Lively','Furba'),
	(9,20200528,1223,'Ullswater','Perch','Perca',0.5,'Lively','Furba'),
	(9,20200528,1304,'Ullswater','Pike','Esox lucius',2.6,'Lively','Shakespear'),

	(10,20181005,0613,'Ullswater','Perch','Perca',0.9,'Lively','Shakespear'),
	(10,20181005,0753,'Ullswater','Trout','Oncorhynchus mykiss',2.4,'Lively','Shakespear'),
	(10,20181005,0818,'Ullswater','Perch','Perca',0.8,'Lively','Shakespear'),
	(10,20181005,0839,'Ullswater','Roach','Rutilus rutilus',1.1,'Dough','Daiwa'),
	(10,20181005,0921,'Ullswater','Perch','Perca',1.4,'Lively','Shakespear'),
	(10,20181005,0959,'Ullswater','Perch','Perca',1.1,'Lively','Shakespear'),

	(11,20190415,0740,'Ullswater','Perch','Perca',0.9,'Lively','Shakespear'),
	(11,20190415,0843,'Ullswater','Roach','Rutilus rutilus',0.8,'Sweetcorn','Furba'),
	(11,20190415,0951,'Ullswater','Perch','Perca',0.8,'Deadly','Shakespear'),
	(11,20190415,1013,'Ullswater','Perch','Perca',0.9,'Deadly','Shakespear'),
	(11,20190702,0627,'LakelandFishery','Carp','Cyprinus carpio',6.1,'Plunger','Dlina'),
	(11,20190702,0656,'LakelandFishery','Carp','Cyprinus carpio',9.3,'Plunger','Dlina'),
	(11,20190702,0720,'LakelandFishery','Tench','Tinca tinca',4.2,'Earth Worm','Donka'),
	(11,20190702,0735,'LakelandFishery','Tench','Tinca tinca',2.7,'Earth Worm','Donka'),
	(11,20190702,0744,'LakelandFishery','Carp','Cyprinus carpio',5.8,'Plunger','Dlina'),
	(11,20210328,0656,'RoyalBerkshireFishery','Carp','Cyprinus carpio',4.6,'Plunger','Dlina'),
	(11,20210328,0708,'RoyalBerkshireFishery','Roach','Rutilus rutilus',0.9,'Dough','Furba'),
	(11,20210328,0731,'RoyalBerkshireFishery','Roach','Rutilus rutilus',0.8,'Dough','Furba'),
	(11,20210328,0918,'RoyalBerkshireFishery','Carp','Cyprinus carpio',2.8,'Plunger','Dlina'),

	(12,20200630,0755,'RoyalBerkshireFishery','Carp','Cyprinus carpio',6.1,'Plunger','Dlina'),
	(12,20200630,0841,'RoyalBerkshireFishery','Carp','Cyprinus carpio',3.4,'Plunger','Dlina'),
	(12,20200630,0905,'RoyalBerkshireFishery','Carp','Cyprinus carpio',2.7,'Plunger','Dlina'),
	(12,20200630,0952,'RoyalBerkshireFishery','Roach','Rutilus rutilus',0.5,'Dough','Furba'),
	(12,20200630,1028,'RoyalBerkshireFishery','Carp','Cyprinus carpio',8.4,'Plunger','Dlina'),
	(12,20210504,0625,'WatmoreFarmFishery','Carp','Cyprinus carpio',6.8,'Plunger','Dlina'),
	(12,20210504,0719,'WatmoreFarmFishery','Carp','Cyprinus carpio',3.6,'Plunger','Dlina'),
	(12,20210504,0740,'WatmoreFarmFishery','Bream','Abramis brama',2.8,"Short'n'Sqigly",'Furba'),
	(12,20210504,0804,'WatmoreFarmFishery','Bream','Abramis brama',1.6,"Short'n'Sqigly",'Furba'),

	(13,20190719,0844,'WatmoreFarmFishery','Carp','Cyprinus carpio',4.2,'Striker','Donka'),
	(13,20190719,0923,'WatmoreFarmFishery','Carp','Cyprinus carpio',7.5,'Striker','Donka'),
	(13,20190719,1021,'WatmoreFarmFishery','Carp','Cyprinus carpio',8.4,'Striker','Donka'),
	(13,20190719,1046,'WatmoreFarmFishery','Carp','Cyprinus carpio',6.8,'Striker','Donka'),
	(13,20200809,0911,'Ullswater','Perch','Perca',0.9,'Lively','Furba'),
	(13,20200809,0957,'Ullswater','Perch','Perca',0.3,'Lively','Furba'),
	(13,20200809,1011,'Ullswater','Roach','Rutilus rutilus',0.5,'Dough','Furba'),

	(14,20210502,0631,'FoxearthFisheries','Carp','Cyprinus carpio',6.8,'Sweetcorn','Donka'),
	(14,20210502,0658,'FoxearthFisheries','Carp','Cyprinus carpio',1.9,'Sweetcorn','Donka'),
	(14,20210502,0724,'FoxearthFisheries','Carp','Cyprinus carpio',3.4,'Sweetcorn','Donka'),
	(14,20210502,0848,'FoxearthFisheries','Carp','Cyprinus carpio',1.5,'Sweetcorn','Donka'),
	(14,20210730,0601,'LakelandFishery','Carp','Cyprinus carpio',3.4,'Sweetcorn','Donka'),
	(14,20210730,0659,'LakelandFishery','Bream','Abramis brama',0.7,'Earth Worm','Donka'),
	(14,20210730,0713,'LakelandFishery','Tench','Tinca tinca',2.3,'Earth Worm','Donka'),
	(14,20210730,0752,'LakelandFishery','Carp','Cyprinus carpio',12.7,'Sweetcorn','Donka'),
	(14,20210730,0907,'LakelandFishery','Carp','Cyprinus carpio',8.9,'Sweetcorn','Donka'),

	(15,20210821,0814,'FoxearthFisheries','Bream','Abramis brama',2.6,"Short'n'Sqigly",'Shakespear'),
	(15,20210821,0821,'FoxearthFisheries','Carp','Cyprinus carpio',1.2,"Short'n'Sqigly",'Shakespear'),
	(15,20210821,0925,'FoxearthFisheries','Carp','Cyprinus carpio',12.3,"Short'n'Sqigly",'Donka'),
	(15,20210821,1014,'FoxearthFisheries','Tench','Tinca tinca',2.1,'Earth Worm','Donka'),
	(15,20210821,1027,'FoxearthFisheries','Bream','Abramis brama',1.7,"Short'n'Sqigly",'Shakespear'),
	(15,20210821,1045,'FoxearthFisheries','Carp','Cyprinus carpio',3.4,"Short'n'Sqigly",'Shakespear'),
	(15,20210821,1105,'FoxearthFisheries','Carp','Cyprinus carpio',12.9,"Short'n'Sqigly",'Donka'),
	(15,20210821,1207,'FoxearthFisheries','Carp','Cyprinus carpio',6.6,"Short'n'Sqigly",'Donka'),

	(16,20181109,0617,'Ullswater','Perch','Perca',1.4,'Lively','Furba'),
	(16,20181109,0626,'Ullswater','Perch','Perca',1.7,'Lively','Furba'),
	(16,20181109,0641,'Ullswater','Trout','Oncorhynchus mykiss',3.4,'Flies','Sigma'),
	(16,20181109,0715,'Ullswater','Trout','Oncorhynchus mykiss',2.9,'Flies','Sigma'),
	(16,20181109,0749,'Ullswater','Trout','Oncorhynchus mykiss',3.5,'Flies','Sigma'),
	(16,20181109,0811,'Ullswater','Trout','Oncorhynchus mykiss',1.4,'Flies','Sigma'),
	(16,20190724,0611,'Ullswater','Trout','Oncorhynchus mykiss',3.4,'Flies','Sigma'),
	(16,20190724,0652,'Ullswater','Trout','Oncorhynchus mykiss',2.7,'Flies','Sigma'),
	(16,20190724,0733,'Ullswater','Perch','Perca',1.6,'Lively','Furba'),
	(16,20190724,0748,'Ullswater','Perch','Perca',1.7,'Lively','Furba'),
	(16,20190724,0810,'Ullswater','Perch','Perca',0.9,'Lively','Furba'),
	(16,20190724,0831,'Ullswater','Perch','Perca',1.1,'Lively','Furba'),
	(16,20190724,0926,'Ullswater','Trout','Oncorhynchus mykiss',2.3,'Flies','Sigma'),
	(16,20200428,0636,'Ullswater','Trout','Oncorhynchus mykiss',1.7,'Flies','Sigma'),
	(16,20200428,0713,'Ullswater','Perch','Perca',0.4,'Lively','Furba'),
	(16,20200428,0731,'Ullswater','Perch','Perca',0.8,'Lively','Furba'),
	(16,20200428,0829,'Ullswater','Trout','Oncorhynchus mykiss',3.1,'Flies','Sigma'),
	(16,20200428,0849,'Ullswater','Perch','Perca',1.2,'Lively','Furba'),
	(16,20200428,0901,'Ullswater','Perch','Perca',0.7,'Lively','Furba'),
	(16,20200428,0919,'Ullswater','Trout','Oncorhynchus mykiss',1.9,'Flies','Sigma'),
	(16,20200428,0959,'Ullswater','Perch','Perca',0.9,'Lively','Furba');

/*Loc, spe, pop*/
INSERT INTO adck921FishLocality VALUES('RoyalBerkshireFishery','Cyprinus carpio',10),
	('RoyalBerkshireFishery','Perca',4),
	('RoyalBerkshireFishery','Abramis brama',6),
	('RoyalBerkshireFishery','Tinca tinca',5),
	('RoyalBerkshireFishery','Rutilus rutilus',4),
	('WatmoreFarmFishery','Perca',5),
	('WatmoreFarmFishery','Cyprinus carpio',8),
	('WatmoreFarmFishery','Rutilus rutilus',3),
	('WatmoreFarmFishery','Tinca tinca',6),
	('WaltonOnThames','Perca',6),
	('WaltonOnThames','Esox lucius',5),
	('WaltonOnThames','Rutilus rutilus',8),
	('WaltonOnThames','Cyprinus carpio',2),
	('MonkLakes','Esox lucius',2),
	('MonkLakes','Cyprinus carpio',9),
	('MonkLakes','Abramis brama',8),
	('MonkLakes','Tinca tinca',8),
	('Ullswater','Esox lucius',2),
	('Ullswater','Perca',6),
	('Ullswater','Rutilus rutilus',5),
	('Ullswater','Oncorhynchus mykiss',3),
	('LakelandFishery','Esox lucius',1),
	('LakelandFishery','Cyprinus carpio',10),
	('LakelandFishery','Abramis brama',8),
	('LakelandFishery','Tinca tinca',9),
	('FoxearthFisheries','Perca',4),
	('FoxearthFisheries','Cyprinus carpio',8),
	('FoxearthFisheries','Abramis brama',7),
	('FoxearthFisheries','Tinca tinca',5);

INSERT INTO adck921Rods VALUES('Dlina','Poole',1.0,12),
	('Furba','Telescopic',0.3,3),
	('Donka','Ledger',0.4,15),
	('Sigma','Fly',0.3,10),
	('Shakespear','Spinner',0.45,5),
	('Sonik','Casting',0.5,6),
	('Daiwa','FLoat',0.3,4),
	('EXP1','Experimental',0.1,10),
	('EXP2','Experimental',0.05,7.5);

INSERT INTO adck921RodOwners VALUES(1,'Shakespear'),
	(1,'Daiwa'),
	(2,'Furba'),	
	(3,'Donka'),
	(4,'Sigma'),
	(4,'Daiwa'),
	(5,'Donka'),
	(5,'Dlina'),
	(6,'Sonik'),
	(6,'Dlina'),
	(7,'Furba'),
	(7,'Shakespear'),
	(8,'Daiwa'),
	(8,'Shakespear'),
	(8,'Dlina'),
	(9,'Furba'),
	(9,'Sigma'),
	(9,'Shakespear'),
	(10,'Shakespear'),
	(10,'Daiwa'),
	(11,'Shakespear'),
	(11,'Furba'),
	(11,'Dlina'),
	(11,'Donka'),
	(12,'Dlina'),
	(12,'Furba'),
	(13,'Donka'),
	(13,'Furba'),
	(14,'Donka'),
	(15,'Donka'),
	(15,'Shakespear'),
	(16,'Furba'),
	(16,'Sigma');


INSERT INTO adck921Bait VALUES('Striker','Pelets'),
	('Plunger','Ground Bait'),
	('Gobler','Balls'),
	('Deadly','Dead Fish'),
	('Lively','Live Fish'),
	("Short'n'Sqigly",'Maggots'),
	('Sweetcorn','Sweetcorn'),
	('Earth Worm','Earth Worm'),
	('Dough','Dough'),
	('Flies','Flies');

INSERT INTO adck921FishBaited VALUES('Esox Lucius','Dead Fish'),
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

/*There is a mistake with the first member's nationalities ('Lithuanian' is spelt incorrectly), Fix it*/

UPDATE adck921Member 
SET nationality='Lithuanian' 
WHERE memberId=1;

/*Ivan Sinitsin has moved to 31 Essex Hall Road in colchester, update it*/

UPDATE adck921Member 
SET address='31 Essex Hall Road', 
townCity='Colchester' 
WHERE name='Ivan Sinitsin';


/* SECTION 4 SINGLE TABLE QUERIES */


/* 1) What species only has one habitat*/
	/*Includes Null*/

SELECT speciesName 
FROM adck921Fish 
WHERE secondaryHabitat IS NULL 
OR primaryHabitat IS NUll;


/* 2) Which members live in London? (in alphabetical order) */
	/*Includes String Searches and Order Clause*/

SELECT name AS memberNames, 
		townCity 
FROM adck921Member 
WHERE townCity='london' 
ORDER BY name ASC;

/* 3) How many people have caught a Bream in 2020? */
	/*Includes Value Comparisons, String Searches, Aggregate Function*/

SELECT COUNT(species) AS times_Caught 
FROM adck921Caught 
WHERE dateCaught>=20200101 
AND dateCaught<=20201231 
AND species='Abramis brama';

/* 4) */
	/*Includes Group, Order Clauses, Having Clause, Aggregate Function*/

SELECT fishingRod, 
		COUNT(memberId) AS Number_of_Members 
FROM adck921RodOwners 
GROUP BY fishingRod 
HAVING COUNT(memberId)>3 
ORDER BY fishingRod ASC;

/* 5) Which is the most popular fish in the location Walton On Thames? */
	/*Includes Sub-queries, String Searches, Aggregate Function*/

SELECT DISTINCT speciesName
FROM adck921FishLocality 
WHERE localityName='WaltonOnThames' AND popularityScale=(
	SELECT MAX(popularityScale) 
	FROM adck921FishLocality 
	WHERE localityName='WaltonOnThames');

/* 6) Which location is Perch most popular in and Carp is least popular in (but still present)? */
	/*Includes Sub-queries, String Searches, Aggregate Functions*/

SELECT localityName, speciesName, popularityScale 
FROM adck921FishLocality 
WHERE popularityScale=(
	SELECT MAX(popularityScale) 
	FROM adck921FishLocality 
	WHERE speciesName = 'Perca') 
AND speciesName ='Perca' OR popularityScale=(
	SELECT MIN(popularityScale) 
	FROM adck921FishLocality 
	WHERE speciesName = 'Cyprinus carpio') 
AND speciesName ='Cyprinus carpio'; 


/* SECTION 5 MULTIPLE TABLE QUERIES */


/* 1)  What rods does member 9 own and what is their name? */
	/*Includes Value Comparison*/

SELECT name, T2.fishingRod 
FROM adck921Member T1 
INNER JOIN adck921RodOwners T2 
ON T1.memberId=T2.memberId 
WHERE T2.memberId=9;

/* 2) What is the name of the member that has caught the 
most different fish? */
	/*Includes Aggregate Functions and Group Clauses*/

SELECT name, 
		T2.Different_Species_Caught 
FROM adck921Member T1 
RIGHT JOIN 
	(SELECT memberId, 
			MAX(Diff_Species) AS Different_Species_Caught 
			FROM (SELECT memberId, 
				COUNT(DISTINCT species) AS Diff_Species 
				FROM adck921Caught 
				GROUP BY memberId) T3) 
	T2 ON T1.memberId=T2.memberId;

/* 3) Display all of the information about each fish*/
	/*Includes 3 Table Join and an Order Clause*/

SELECT T1.speciesName,
 		T1.maxSizeCM,
 		T1.maxWeightKG, 
 		T1.maxAge, 
 		T1.primaryHabitat, 
 		T1.secondaryHabitat, 
 		T2.localityName, 
 		T2.popularityScale, 
 		T3.bait 
FROM adck921Fish T1, 
	adck921FishLocality T2, 
	adck921FishBaited T3 
WHERE T1.speciesName=T2.speciesName 
AND T1.speciesName=T3.fish 
ORDER BY T1.speciesName, 
		T2.localityName;


/* 4) Display all of the information about each fish - using Inner Joins*/
	/*Includes 3 Table Join and an Order Clause*/

SELECT T1.speciesName, 
		T1.maxSizeCM, 
		T1.maxWeightKG, 
		T1.maxAge, 
		T1.primaryHabitat, 
		T1.secondaryHabitat, 
		T2.localityName, 
		T2.popularityScale, 
		T3.bait 
FROM adck921Fish T1 
INNER JOIN adck921FishLocality T2 
ON T1.speciesName=T2.speciesName 
INNER JOIN  adck921FishBaited T3 
ON T2.speciesName=T3.fish 
ORDER BY T1.speciesName, T2.localityName;

/* 5) Display all of the fish caught on each rod. 
Also display this in chronological order and display
 who caught the fish */
	/*Includes 3 Table Join and an Order Clause*/

SELECT T1.rodName, 
		T2.species, 
		T2.dateCaught, 
		T3.name 
FROM adck921Rods T1 
INNER JOIN adck921Caught T2 
ON T1.rodName=T2.fishingRodUsed 
INNER JOIN adck921Member T3 
ON T2.memberId=T3.memberId 
ORDER BY T1.rodName, T2.dateCaught;

/* 6) What is the largest fish caught on each rod 
that has the capacity of 4 or above */
	/*Includes Value Comparison and Order Clause*/


SELECT rodName, 
		rodType, 
		rodWeight, 
		rodCapacity, 
		T2.species, 
		T2.maxWeightCaught 
FROM adck921Rods T1 
LEFT JOIN 
	(SELECT fishingRodUsed, 
			species, 
			MAX(weightKG) AS maxWeightCaught  
	FROM adck921Caught 
	GROUP BY fishingRodUsed) T2 
ON T1.rodName = T2.fishingRodUsed 
WHERE T1.rodCapacity >= 4 
ORDER BY T2.species, 
	     T1.rodName;


/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM adck921FishLocality 
WHERE localityName='WatmoreFarmFishery' 
AND speciesName='Perca';

DELETE T1, T2 
FROM adck921History T1, 
	 adck921Caught T2 
WHERE T1.memberId=3 
AND T1.memberId = T2.memberId 
AND T1.dateCaught = 20190524 
AND T1.dateCaught=T2.dateCaught
AND T1.timeCaught >1034 
AND T1.timeCaught=T2.timeCaught;

*/

/* SECTION 6 DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE adck921Caught, adck921History, adck921RodOwners, adck921FishLocality, adck921FishBaited, adck921Member, adck921Fish, adck921Locale, adck921Bait, adck921Rods;
*/