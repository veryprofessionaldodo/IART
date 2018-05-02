% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: database.pl
%       -> Hotel info database loading

% Loaded Files
:-  ensure_loaded([common, grammar, keywords]).

% Modules

% Database Declaration

%       hotel(IDHotel, Name, Address, PostalCode, Telephone, StarRating, IDArea, IDHotelType, AveragePrice).
hotel(1, [hotel, maria, josefina], [rua, pascoal, faria, 324], [5000], [234555123], 3, 3, 1, [300]).
hotel(2, [hotel, praia, mar, 1], [rua, augusto, sousa, 123], [8954], [234666878], 4, 1, 1, [100]).
hotel(3, [hotel, vilaverde], [rua, joao, almodovar, 789], [4200], [234777157], 3, 3, 1, [200]).
hotel(4, [motel, bairrada], [avenida, da, regua, 23], [4200], [237855544], 2, 3, 2, [150]).
hotel(5, [hilton], [avenida, armando, sousa, 1], [1542], [229849815], 6, 1, 3, [1000]).
hotel(6, [motel, hardline], [travessa, antonio, medeiros, 4], [6251], [215484655], 3, 1, 2, [50]).
hotel(7, [casa, dos, fonseca], [rua, da, quinta, 1], [6251], [231889574], 2, 2, 3, [300]).
hotel(8, [hotel, frente, de, mar], [rua, pasceco, mangualde, 23], [8954], [228781199], 3, 3, 1, [50]).
hotel(9, [hotel, praia, mar, 2], [alameda, fonseca, 78], [8954], [217336984], 5, 3, 1, [750]).

%       postalcode(PostalCode, City, IDRegion).
postalcode(5000, [setubal], 1).
postalcode(6251, [braga], 4).
postalcode(8954, [faro], 3).
postalcode(1542, [lisboa], 1).
postalcode(4200, [porto], 2).

%       region(IDRegion, Region).
region(1, [centro, sul]).
region(2, [douro, litoral]).
region(3, [algarve]).
region(4, [minho]).

%       area(IDArea, Area).
area(1, [praia]).
area(2, [citadino]).
area(3, [rural]).
area(4, [montanha]).

%       hoteltype(IDHotelType, HotelType).
hoteltype(1, [hotel]).
hoteltype(2, [motel]).
hoteltype(3, [pousada]).
hoteltype(4, [hostel]).

%       hotelfeature(IDHotel, IDFeature).
hotelfeature(1, 1).
hotelfeature(1, 2).
hotelfeature(1, 3).
hotelfeature(1, 4).
hotelfeature(2, 1).
hotelfeature(2, 2).
hotelfeature(2, 3).
hotelfeature(2, 4).
hotelfeature(3, 1).
hotelfeature(3, 2).
hotelfeature(3, 4).
hotelfeature(4, 3).
hotelfeature(5, 1).
hotelfeature(5, 2).
hotelfeature(5, 3).
hotelfeature(5, 4).
hotelfeature(5, 5).
hotelfeature(5, 6).
hotelfeature(6, 3).
hotelfeature(7, 4).
hotelfeature(8, 1).
hotelfeature(8, 2).
hotelfeature(8, 3).
hotelfeature(8, 4).
hotelfeature(9, 1).
hotelfeature(9, 2).
hotelfeature(9, 3).
hotelfeature(9, 4).
hotelfeature(9, 6).

%       feature(IDFeature, Feature).
feature(1, [piscina]).
feature(2, [ginasio]).
feature(3, [restaurante]).
feature(4, [parque, estacionamento]).
feature(5, [golfe]).
feature(6, [parque, infantil]).

%       hotelservice(IDHotel, IDService).
hotelservice(1, 1).
hotelservice(1, 2).
hotelservice(1, 3).
hotelservice(2, 1).
hotelservice(2, 2).
hotelservice(2, 3).
hotelservice(2, 5).
hotelservice(2, 7).
hotelservice(3, 2).
hotelservice(3, 3).
hotelservice(3, 4).
hotelservice(3, 5).
hotelservice(4, 2).
hotelservice(4, 3).
hotelservice(5, 1).
hotelservice(5, 2).
hotelservice(5, 3).
hotelservice(5, 4).
hotelservice(5, 5).
hotelservice(5, 6).
hotelservice(5, 7).
hotelservice(6, 3).
hotelservice(6, 3).
hotelservice(6, 5).
hotelservice(7, 3).
hotelservice(8, 1).
hotelservice(8, 2).
hotelservice(8, 4).
hotelservice(8, 4).
hotelservice(8, 5).
hotelservice(9, 1).
hotelservice(9, 2).
hotelservice(9, 3).
hotelservice(9, 4).
hotelservice(9, 5).
hotelservice(9, 6).
hotelservice(9, 7).

%       service(IDService, Service).
service(1, [babysiting]).
service(2, [despertar]).
service(3, [pequeno, almoco]).
service(4, [cofre]).
service(5, [lavandaria]).
service(6, [aluguer, carro]).
service(7, [video, on, demand]).

%       room(IDHotel, IDRoomType).
room(1, 1).
room(1, 2).
room(1, 3).
room(1, 4).
room(2, 1).
room(2, 2).
room(2, 3).
room(2, 4).
room(2, 5).
room(3, 1).
room(3, 2).
room(3, 3).
room(4, 1).
room(4, 2).
room(5, 1).
room(5, 2).
room(5, 3).
room(5, 4).
room(5, 5).
room(5, 6).
room(5, 7).
room(6, 1).
room(6, 2).
room(6, 3).
room(6, 4).
room(7, 7).
room(8, 1).
room(8, 2).
room(8, 3).
room(9, 1).
room(9, 2).
room(9, 3).
room(9, 4).
room(9, 5).
room(9, 6).
room(9, 7).

%       roomtype(IDRoomType, RoomType).
roomtype(1, [casal]).
roomtype(2, [simples]).
roomtype(3, [duplo]).
roomtype(4, [suite]).
roomtype(5, [nupcias]).
roomtype(6, [presidencial]).
roomtype(7, [vila]).

% © RGeneral24 -- 2015 --