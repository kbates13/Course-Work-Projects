DROP DATABASE IF EXISTS StartUp;
CREATE DATABASE IF NOT EXISTS StartUp;
USE StartUp;

DROP TABLE IF EXISTS Personnel;
CREATE TABLE Personnel(
personID INT NOT NULL PRIMARY KEY,
firstName VARCHAR(15) NOT NULL, 
lastName VARCHAR(15) NOT NULL,
streetAddress  VARCHAR(50) DEFAULT NULL,
cityAddress  VARCHAR(20) DEFAULT NULL,
stateAddress  VARCHAR(20) DEFAULT NULL,
zipAddress VARCHAR(20) DEFAULT NULL
)
;

DROP TABLE IF EXISTS Agent;
CREATE TABLE Agent(
agentID INT NOT NULL PRIMARY KEY,
hireDate DATE DEFAULT NULL,
endHireDate DATE DEFAULT NULL,
salary INT DEFAULT NULL,
personID INT NOT NULL,
CONSTRAINT personID FOREIGN KEY(personID) REFERENCES Personnel(personID)
)
;

DROP TABLE IF EXISTS Entrepreneur;
CREATE TABLE Entrepreneur(
entrepreneurID INT NOT NULL PRIMARY KEY,
yearsExperience INT DEFAULT NULL, 
person1ID INT NOT NULL,
CONSTRAINT person1ID FOREIGN KEY(person1ID) REFERENCES Personnel(personID)
)
;

DROP TABLE IF EXISTS Capitalist;
CREATE TABLE Capitalist(
capitalistID INT NOT NULL PRIMARY KEY,
yearsExperience INT DEFAULT NULL, 
person2ID INT NOT NULL,
CONSTRAINT person2ID FOREIGN KEY(person2ID) REFERENCES Personnel(personID)
)
;

DROP TABLE IF EXISTS Funder;
CREATE TABLE Funder(
funderID INT NOT NULL PRIMARY KEY,
businessName VARCHAR(150) DEFAULT NULL,
funderCapitalization FLOAT DEFAULT NULL,
homepageURL VARCHAR(150) DEFAULT NULL
)
;

DROP TABLE IF EXISTS FunderEntrepreneur;
CREATE TABLE FunderEntrepreneur(
funderID INT NOT NULL,
entrepreneurID INT NOT NULL,
PRIMARY KEY(funderID, entrepreneurID),
CONSTRAINT funderID FOREIGN KEY(funderID) REFERENCES Funder(funderID),
CONSTRAINT entrepreneurID FOREIGN KEY(entrepreneurID) REFERENCES Entrepreneur(entrepreneurID)
)
;

DROP TABLE IF EXISTS FunderCapitalist;
CREATE TABLE FunderCapitalist(
funder1ID INT NOT NULL ,
capitalistID INT NOT NULL ,
PRIMARY KEY(funder1ID, capitalistID),
CONSTRAINT funder1ID FOREIGN KEY(funder1ID) REFERENCES Funder(funderID),
CONSTRAINT capitalistID FOREIGN KEY(capitalistID) REFERENCES Capitalist(capitalistID)
)
;

DROP TABLE IF EXISTS FundingAccount;
CREATE TABLE FundingAccount(
fundingAccountID INT NOT NULL PRIMARY KEY,
totalCapitalization FLOAT DEFAULT NULL,
fundingProject VARCHAR(150) DEFAULT NULL,
startDate DATE DEFAULT NULL
)
;

DROP TABLE IF EXISTS FunderFundingAccount;
CREATE TABLE FunderFundingAccount(
funder3ID INT NOT NULL, 
fundingAccount3ID INT NOT NULL,
PRIMARY KEY(funder3ID, fundingAccount3ID),
CONSTRAINT funder3ID FOREIGN KEY(funder3ID) REFERENCES Funder(funderID),
CONSTRAINT fundingAccount3ID FOREIGN KEY(fundingAccount3ID) REFERENCES FundingAccount(fundingAccountID)
)
;

DROP TABLE IF EXISTS AgentFundingAccount;
CREATE TABLE AgentFundingAccount(
agent4ID INT NOT NULL,
fundingAccount4ID INT NOT NULL, 
PRIMARY KEY(agent4ID, fundingAccount4ID),
CONSTRAINT agent4ID FOREIGN KEY(agent4ID) REFERENCES Agent(agentID),
CONSTRAINT fundingAccount4ID FOREIGN KEY(fundingAccount4ID) REFERENCES FundingAccount(fundingAccountID)
)
;

DROP TABLE IF EXISTS STClient;
CREATE TABLE STClient(
clientID INT NOT NULL PRIMARY KEY,
firstName VARCHAR(15) NOT NULL,
lastName VARCHAR(20) NOT NULL,
startDate DATE DEFAULT NULL,
endDate DATE DEFAULT NULL,
clientCapitalization FLOAT DEFAULT NULL
)
;

DROP TABLE IF EXISTS ClientFunding;
CREATE TABLE ClientFunding(
client5ID INT NOT NULL,
fundingAccount5ID INT NOT NULL,
PRIMARY KEY(client5ID, fundingAccount5ID),
CONSTRAINT client5ID FOREIGN KEY(client5ID) REFERENCES STClient(clientID),
CONSTRAINT fundingAccount5ID FOREIGN KEY(fundingAccount5ID) REFERENCES FundingAccount(fundingAccountID)
)
;

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
categoryID INT NOT NULL PRIMARY KEY,
categoryType VARCHAR(150) NOT NULL,
clientID INT NOT NULL,
CONSTRAINT clientID FOREIGN KEY(clientID) REFERENCES STClient(clientID)
)
;

DROP TABLE IF EXISTS ClientEntrepreneur;
CREATE TABLE ClientEntrepreneur(
client6ID INT NOT NULL,
entrepreneur6ID INT NOT NULL,
PRIMARY KEY(client6ID, entrepreneur6ID),
CONSTRAINT client6ID FOREIGN KEY(client6ID) REFERENCES STClient(clientID),
CONSTRAINT entrepreneur6ID FOREIGN KEY(entrepreneur6ID) REFERENCES Entrepreneur(entrepreneurID)
)
;

DROP TABLE IF EXISTS TrainingAccount;
CREATE TABLE TrainingAccount(
trainingAccountID INT NOT NULL PRIMARY KEY,
startDate DATE DEFAULT NULL
)
;

DROP TABLE IF EXISTS CLientTrainingAccount;
CREATE TABLE ClientTrainingAccount(
client7ID INT NOT NULL,
trainingAccount7ID INT NOT NULL,
PRIMARY KEY (client7ID, trainingAccount7ID),
CONSTRAINT client7ID FOREIGN KEY(client7ID) REFERENCES STClient(clientID),
CONSTRAINT trainingAccount7ID FOREIGN KEY(trainingAccount7ID) REFERENCES TrainingAccount(trainingAccountID)
)
;

DROP TABLE IF EXISTS AgentTrainingAccount;
CREATE TABLE AgentTrainingAccount(
agent8ID INT NOT NULL,
trainingAccount8ID INT NOT NULL,
PRIMARY KEY(agent8ID, trainingAccount8ID),
CONSTRAINT agent8ID FOREIGN KEY(agent8ID) REFERENCES Agent(agentID),
CONSTRAINT trainingAccount8ID FOREIGN KEY(trainingAccount8ID) REFERENCES TrainingAccount(trainingAccountID)
)
;


INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (1,"Lucian","Baldwin","7939 Dictum St.","Iquitos","LOR","19952-70293");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (2,"Reece","Austin","897-2776 Magnis St.","Dunkerque","NO","784450");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (3,"Vaughan","Ashley","9629 Et Avenue","Fort Smith","Arkansas","XF1N 1BK");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (4,"Eden","Barnes","P.O. Box 715, 7420 Elementum, Road","Ciudad Valles","San Luis Potosí","6640");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (5,"Driscoll","Wilkerson","Ap #204-3125 Odio Av.","Okigwe","Imo","895837");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (6,"Kelsie","Murphy","464 Urna. St.","Noisy-le-Grand","IL","10008");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (7,"Burton","Bradshaw","491-2187 Consectetuer St.","Etobicoke","ON","291044");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (8,"Fulton","Sellers","P.O. Box 422, 4125 Vitae, St.","Diyarbakır","Diy","8013");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (9,"Winter","Reyes","197-4517 Dolor Av.","Puno","Puno","8755 FZ");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (10,"Illana","Juarez","904-2775 Dui, Av.","Palu","ST","Z0577");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (11,"Jordan","Hopper","3160 Curabitur St.","Puntarenas","P","395026");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (12,"Winifred","James","5047 A, St.","Moulins","AU","11617");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (13,"Kelsey","Holman","Ap #193-3203 Ut Rd.","Abbottabad","KPK","Z5279");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (14,"Lucas","Orr","P.O. Box 591, 4528 Risus. Rd.","Thorold","Ontario","6850");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (15,"Abra","Bryan","6440 Tellus Street","Cupar","Fife","19195");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (16,"Cameran","Stevens","3683 Tortor. Road","Jaén","Cajamarca","6634");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (17,"Dustin","Carpenter","P.O. Box 205, 1722 Conubia Avenue","Caloundra","Queensland","63549");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (18,"Jaquelyn","Justice","P.O. Box 516, 1384 A, Rd.","New Radnor","RA","4659 GJ");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (19,"Nicholas","Berg","8197 Vivamus Road","Siquirres","Limón","7904");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (20,"Lawrence","Villarreal","P.O. Box 441, 6704 Pellentesque Ave","Juiz de Fora","MG","21451");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (21,"Gregory","Perry","P.O. Box 283, 8322 A Rd.","Armidale","NSW","21602");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (22,"Jessamine","Black","2483 Et Rd.","Chillán Viejo","Biobío","324330");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (23,"Peter","Campbell","892-2747 Pellentesque Street","Hagen","Nordrhein-Westphalen","5655");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (24,"Rafael","Ewing","P.O. Box 870, 1827 Magna Road","Cobourg","ON","9918");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (25,"Cade","Drake","8205 Maecenas St.","Logroño","La Rioja","3370");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (26,"Ezekiel","Wiley","Ap #901-1287 Sem Rd.","Lambayeque","Lambayeque","39094");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (27,"Cooper","Foster","674-6278 Et Road","Warri","Delta","63147-12241");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (28,"Serina","Dunn","1555 Ut, Av.","Lawton","OK","08575");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (29,"Shea","Salas","128-7352 Aliquet, Avenue","Spijkenisse","Zuid Holland","83284");
INSERT INTO Personnel (personID,firstName,lastName,streetAddress,cityAddress,stateAddress,zipAddress) VALUES (30,"Fay","Meyer","P.O. Box 622, 402 Ut, Rd.","Nogales","Sonora","537348");

INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (100,"15-07-20","28-11-30",111776,1);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (101,"04-11-19","17-11-22",278563,2);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (102,"24-04-20","04-01-29",134589,3);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (103,"06-08-20","05-01-22",145387,4);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (104,"28-08-20","27-09-25",253136,5);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (105,"19-09-19","25-05-23",71114,6);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (106,"03-08-20","15-01-22",59429,7);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (107,"22-02-21","24-05-28",78026,8);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (108,"12-01-20","28-03-24",226267,9);
INSERT INTO Agent (agentID,hireDate,endHireDate,salary,personID) VALUES (109,"12-05-20","20-07-21",52178,10);

INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (210,24,11);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (211,13,12);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (212,4,13);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (213,11,14);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (214,17,15);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (215,17,16);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (216,18,17);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (217,18,18);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (218,3,19);
INSERT INTO Entrepreneur (entrepreneurID,yearsExperience,person1ID) VALUES (219,1,20);

INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (320,6,21);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (321,8,22);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (322,10,23);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (323,20,24);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (324,3,25);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (325,5,26);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (326,3,27);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (327,17,28);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (328,11,29);
INSERT INTO Capitalist (capitalistID,yearsExperience,person2ID) VALUES (329,11,30);

INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (400,"Aliquet Limited",198329,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (401,"Neque Vitae Semper Incorporated",100755,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (402,"Erat Volutpat Nulla Institute",98292,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (403,"A Purus Duis Company",181640,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (404,"Massa Quisque Porttitor Incorporated",59994,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (405,"Eu Industries",113454,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (406,"Gravida Incorporated",129251,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (407,"Sapien Aenean Inc.",176137,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (408,"Quis Limited",129688,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (409,"Ac Metus Vitae Company",116252,"NULL");
INSERT INTO Funder (funderID,businessName,funderCapitalization,homepageURL) VALUES (410,"Nec Mollis Incorporated",111478,"NULL");

INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (409,214);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (407,214);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (408,214);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (408,211);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (401,213);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (408,213);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (404,219);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (408,212);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (410,216);
INSERT INTO FunderEntrepreneur (funderID,entrepreneurID) VALUES (407,219);

INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (400,324);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (404,321);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (409,326);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (401,325);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (400,329);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (409,328);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (406,329);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (405,329);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (401,327);
INSERT INTO FunderCapitalist (funder1ID,capitalistID) VALUES (407,328);

INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (500,901942,"Et Rutrum Company","24-11-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (501,111197,"Aliquam Ornare Libero Associates","10-06-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (502,232529,"Urna Convallis Ltd","29-08-19");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (503,279853,"Lectus Sit Amet Corporation","12-03-21");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (504,85764,"Non Feugiat Foundation","23-02-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (505,536483,"Fusce Mollis LLP","26-05-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (506,850117,"Nisi A Odio Industries","02-11-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (507,141794,"Tortor Company","10-09-20");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (508,799003,"Vulputate Incorporated","06-12-19");
INSERT INTO FundingAccount (fundingAccountID,totalCapitalization,fundingProject,startDate) VALUES (509,638020,"Elit Corporation","24-10-20");

INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (404,509);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (409,500);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (405,508);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (409,509);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (407,504);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (404,506);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (408,502);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (409,503);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (403,507);
INSERT INTO FunderFundingAccount (funder3ID,fundingAccount3ID) VALUES (401,501);

INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (103,500);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (109,501);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (103,502);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (101,503);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (107,504);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (103,505);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (103,506);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (100,507);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (107,508);
INSERT INTO AgentFundingAccount (agent4ID,fundingAccount4ID) VALUES (106,509);

INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (600,"Paki","Hendrix","03-07-19","14-12-19",42650);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (601,"Rigel","Roy","23-04-20","22-09-20",30491);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (602,"Indigo","Butler","02-12-20","27-05-20",48745);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (603,"Tucker","Howe","15-08-19","24-01-21",2992);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (604,"Andrew","Coffey","09-07-19","17-12-20",78141);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (605,"Alvin","Robbins","15-08-20","19-12-20",44458);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (606,"Maisie","Pickett","09-09-19","15-09-20",22476);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (607,"Shannon","Payne","29-01-21","13-08-20",28219);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (608,"Nadine","White","25-01-21","26-10-20",98170);
INSERT INTO STClient (clientID,firstName,lastName,startDate,endDate,clientCapitalization) VALUES (609,"Mufutau","Casey","17-12-19","21-12-20",62704);

INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (600,500);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (603,501);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (607,502);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (600,503);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (603,504);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (607,505);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (605,506);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (603,507);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (602,508);
INSERT INTO ClientFunding (client5ID,fundingAccount5ID) VALUES (601,509);

INSERT INTO Category (categoryID,categoryType,clientID) VALUES (700,"Morbi Metus Vivamus Consulting",600);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (701,"Nonummy Corp.",601);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (702,"Dui Associates",602);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (703,"Fringilla Porttitor Vulputate PC",603);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (704,"Arcu Vestibulum Ante Company",604);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (705,"Tellus Justo Associates",605);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (706,"Lorem Company",606);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (707,"Etiam Institute",607);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (708,"Tincidunt LLP",608);
INSERT INTO Category (categoryID,categoryType,clientID) VALUES (709,"Neque Pellentesque Corp.",609);

INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (601,219);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (609,210);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (607,211);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (604,213);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (605,211);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (603,216);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (602,216);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (604,212);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (609,218);
INSERT INTO ClientEntrepreneur (client6ID,entrepreneur6ID) VALUES (608,211);




