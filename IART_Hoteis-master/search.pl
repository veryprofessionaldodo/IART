% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: search.pl
%       -> Search informatation in database

% Loaded Files
:-  ensure_loaded([database, grammar, common, keywords]).

% Modules

% Database Search
%% Hotel Name
hotel_name(Name, Return) :- 
        findall(Return, hotel(Return, Name, _, _, _, _, _, _, _), Return).

%% Hotel Address
hotel_address(Address, Return) :- 
        findall(Return, hotel(Return, _, Address, _, _, _, _, _, _), Return).

%% Hotel Postal Code
hotel_postal(Postal, Return) :- 
        findall(Return, hotel(Return, _, _, Postal, _, _, _, _, _), Return).

%% Hotel Telephone
hotel_telephone(Telephone, Return) :- 
        findall(Return, hotel(Return, _, _, _, Telephone, _, _, _, _), Return).

%% Hotel Star Rating
hotel_rating(Rating, 0, Return) :- 
        findall(Return, hotel(Return, _, _, _, _, Rating, _, _, _), Return).

hotel_rating(Rating, 1, Return) :- 
        findall(Return, (hotel(Return, _, _, _, _, R, _, _, _), R > Rating), Return).

hotel_rating(Rating, 2, Return) :- 
        findall(Return, (hotel(Return, _, _, _, _, R, _, _, _), R < Rating), Return).

%% Hotel Area
hotel_area(Area, Return) :- 
        area(A, Area), 
        findall(Return, hotel(Return, _, _, _, _, _, A, _, _), Return).

%% Hotel Type
hotel_type(Type, Return) :- 
        hoteltype(T, Type), 
        findall(Return, hotel(Return, _, _, _, _, _, _, T, _), Return).

%% Hotel Feature
hotel_feature(Feature, Return) :- 
        feature(F, Feature), 
        findall(Return, hotelfeature(Return, F), Return).

%% Hotel Service
hotel_service(Service, Return) :- 
        service(S, Service), 
        findall(Return, hotelservice(Return, S), Return).

%% Hotel Room
hotel_room(Room, Return) :- 
        roomtype(R, Room), 
        findall(Return, room(Return, R), Return).

%% Hotel Price
hotel_price(Price, 0, Return) :- 
        findall(Return, hotel(Return, _, _, _, _, _, _, _, Price), Return).

hotel_price(Price, 1, Return) :- 
        findall(Return, (hotel(Return, _, _, _, _, _, _, _, P), P > Price), Return).

hotel_price(Price, 2, Return) :- 
        findall(Return, (hotel(Return, _, _, _, _, _, _, _, P), P < Price), Return).

% Answers

% © RGeneral24 -- 2015 --