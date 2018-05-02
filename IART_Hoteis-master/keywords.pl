% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: keywords.pl
%       -> parsing of main grammar words for semantic analisys

% Loaded Files
:-  ensure_loaded([common, database, grammar]).

% Modules

% Keywords

%% Names
nome(m-s, [nome]-char) --> [nome].
nome(m-p, [nomes]-char) --> [nomes].
nome(f-s, [morada]-char) --> [morada].
nome(f-p, [moradas]-char) --> [moradas].
nome(m-s, [codigo, postal]-char) --> [codigo, postal].
nome(m-p, [codigos, postais]-char) --> [codigos, postais].
nome(m-s, [telefone]-char) --> [telefone].
nome(f-s, [telefones]-char) --> [telefones].
nome(f-p, [estrelas]-char) --> [estrelas].
nome(f-s, [1, estrela]-rating) --> [de, 1, estrela].
nome(f-p, [2, estrelas]-rating) --> [de, 2, estrelas].
nome(f-p, [3, estrelas]-rating) --> [de, 3, estrelas].
nome(f-p, [4, estrelas]-rating) --> [de, 4, estrelas].
nome(f-p, [5, estrelas]-rating) --> [de, 5, estrelas].
nome(f-p, [6, estrelas]-rating) --> [de, 6, estrelas].
nome(f-s, [maior, que, 1, estrela]-mrating) --> [maior, que, 1, estrela].
nome(f-p, [maior, que, 2, estrelas]-mrating) --> [maior, que, 2, estrelas].
nome(f-p, [maior, que, 3, estrelas]-mrating) --> [maior, que, 3, estrelas].
nome(f-p, [maior, que, 4, estrelas]-mrating) --> [maior, que, 4, estrelas].
nome(f-p, [maior, que, 5, estrelas]-mrating) --> [maior, que, 5, estrelas].
nome(f-p, [maior, que, 6, estrelas]-mrating) --> [maior, que, 6, estrelas].
nome(f-s, [menor, que, 1, estrela]-nrating) --> [menor, que, 1, estrela].
nome(f-p, [menor, que, 2, estrelas]-nrating) --> [menor, que, 2, estrelas].
nome(f-p, [menor, que, 3, estrelas]-nrating) --> [menor, que, 3, estrelas].
nome(f-p, [menor, que, 4, estrelas]-nrating) --> [menor, que, 4, estrelas].
nome(f-p, [menor, que, 5, estrelas]-nrating) --> [menor, que, 5, estrelas].
nome(f-p, [menor, que, 6, estrelas]-nrating) --> [menor, que, 6, estrelas].
nome(f-s, [area]-char) --> [area].
nome(m-s, [tipo]-char) --> [tipo].
nome(m-s, [preco]-char) --> [preco].
nome(m-s, [preco, medio]-char) --> [preco, medio].
nome(m-p, [precos]-char) --> [precos].
nome(m-p, [precos, medios]-char) --> [precos, medios].
nome(f-s, [cidade]-char) --> [cidade].
nome(f-p, [cidades]-char) --> [cidades].
nome(_, [setubal]-city) --> [setubal].
nome(_, [braga]-city) --> [braga].
nome(_, [faro]-city) --> [faro].
nome(_, [lisboa]-city) --> [lisboa].
nome(_, [porto]-city) --> [porto].
nome(f-s, [regiao]-city) --> [regiao].
nome(f-p, [regioes]-city) --> [regioes].
nome(m-s, [centro, sul]-region) --> [centro, sul].
nome(m-s, [douro, litoral]-region) --> [douro, litoral].
nome(m-s, [algarve]-region) --> [algarve].
nome(m-s, [minho]-region) --> [minho].
nome(f-s, [area]-char) --> [area].
nome(f-p, [areas]-char) --> [areas].
nome(m-s, [citadino]-area) --> [citadino].
nome(f-s, [praia]-area) --> [praia].
nome(f-s, [rural]-area) --> [rural].
nome(f-s, [montanha]-area) --> [montanha].
nome(m-s, [hotel]-type) --> [hotel].
nome(m-p, [hoteis]-type) --> [hoteis].
nome(m-s, [motel]-type) --> [motel].
nome(m-p, [moteis]-type) --> [moteis].
nome(f-s, [pousada]-type) --> [pousada].
nome(f-p, [pousadas]-type) --> [pousadas].
nome(m-s, [hostel]-type) --> [hostel].
nome(m-p, [hosteis]-type) --> [hosteis].
nome(f-s, [caracteristica]-char) --> [caracteristica].
nome(f-p, [caracteristicas]-char) --> [caracteristicas].
nome(f-s, [piscina]-feature) --> [piscina].
nome(m-s, [ginasio]-feature) --> [ginasio].
nome(m-s, [restaurante]-feature) --> [restaurante].
nome(m-s, [parque, estacionamento]-feature) --> [parque, estacionamento].
nome(m-s, [golfe]-feature) --> [golfe].
nome(m-s, [parque, infantil]-feature) --> [parque, infantil].
nome(m-s, [servico]-char) --> [servico].
nome(m-p, [servicos]-char) --> [servicos].
nome(m-s, [servico, de, babysiting]-service) --> [servico, de, babysiting].
nome(m-s, [servico, de, despertar]-service) --> [servico, de, despertar].
nome(m-s, [servico, de, pequeno, almoco]-service) --> [servico, de, pequeno, almoco].
nome(m-s, [servico, de, cofre]-service) --> [servico, de, cofre].
nome(m-s, [servico, de, lavandaria]-service) --> [servico, de, lavandaria].
nome(m-s, [servico, de, aluguer, de, carro]-service) --> [servico, de, aluguer, de, carro].
nome(m-s, [servico, de, video, on, demand]-service) --> [servico, de, video, on, demand].
nome(m-_, [babysiting]-service) --> [babysiting].
nome(_, [despertar]-service) --> [despertar].
nome(m-_, [pequeno, almoco]-service) --> [pequeno, almoco].
nome(m-s, [cofre]-service) --> [cofre].
nome(f-s, [lavandaria]-service) --> [lavandaria].
nome(m-_, [aluguer, de, carro]-service) --> [aluguer, de, carro].
nome(m-_, [video, on, demand]-service) --> [video, on, demand].
nome(_-s, [quarto, de, casal]-room) --> [quarto, de, casal].
nome(_-s, [quarto, simples]-room) --> [quarto, simples].
nome(_-p, [quartos, de, casal]-room) --> [quarto, de, casal].
nome(_-p, [quartos, simples]-room) --> [quarto, simples].
nome(_-s, [quarto, duplo]-room) --> [quarto, duplo].
nome(_, [suite, de, nupcias]-room) --> [suite, de, nupcias].
nome(_, [suite, presidencial]-room) --> [suite, presidencial].
nome(_-s, [vila]-room) --> [vila].
nome(_-p, [vilas]-room) --> [vilas].
nome(m-s, [hotel, maria, josefina]-hotel) --> [hotel, maria, josefina].
nome(m-s, [hotel, praia, mar, 1]-hotel) --> [hotel, praia, mar, 1].
nome(m-s, [hotel, vilaverde]-hotel) --> [hotel, vilaverde].
nome(m-s, [motel, bairrada]-hotel) --> [motel, bairrada].
nome(m-s, [hilton]-hotel) --> [hilton].
nome(m-s, [motel, hardline]-hotel) --> [motel, hardline].
nome(f-s, [casa, dos, fonseca]-hotel) --> [casa, dos, fonseca].
nome(m-s, [hotel, frente, de, mar]-hotel) --> [hotel, frente, de, mar].
nome(m-s, [hotel, praia, mar, 2]-hotel) --> [hotel, praia, mar, 2].
nome(f-s, [rua, pascoal, faria, 324]-address) --> [rua, pascoal, faria, 324].
nome(f-s, [rua, augusto, sousa, 123]-address) --> [rua, augusto, sousa, 123].
nome(f-s, [rua, joao, almodovar, 789]-address) --> [rua, joao, almodovar, 789].
nome(f-s, [avenida, da, regua, 23]-address) --> [avenida, da, regua, 23].
nome(f-s, [avenida, armando, sousa, 1]-address) --> [avenida, armando, sousa, 1].
nome(f-s, [travessa, antonio, medeiros, 4]-address) --> [travessa, antonio, medeiros, 4].
nome(f-s, [rua, da, quinta, 1]-address) --> [rua, da, quinta, 1].
nome(f-s, [rua, pasceco, mangualde, 23]-address) --> [rua, pasceco, mangualde, 23].
nome(f-s, [alameda, fonseca, 78]-address) --> [alameda, fonseca, 78].
nome(_, [5000]-postal) --> [5000].
nome(_, [8954]-postal) --> [8954].
nome(_, [4200]-postal) --> [4200].
nome(_, [1542]-postal) --> [1542].
nome(_, [6251]-postal) --> [6251].
nome(_, [234555123]-phone) --> [234555123].
nome(_, [234666878]-phone) --> [234666878].
nome(_, [234777157]-phone) --> [234777157].
nome(_, [237855544]-phone) --> [237855544].
nome(_, [229849815]-phone) --> [229849815].
nome(_, [215484655]-phone) --> [215484655].
nome(_, [231889574]-phone) --> [231889574].
nome(_, [228781199]-phone) --> [228781199].
nome(_, [217336984]-phone) --> [217336984].
nome(m-s, [preco, de]-char) --> [preco, de].
nome(_, [300, euros]-price) --> [300, euros].
nome(_, [acima, de, 300, euros]-price) --> [acima, de, 300, euros].
nome(_, [300, euros]-price) --> [300, euros].
nome(_, [100, euros]-price) --> [100, euros].
nome(_, [acima, de, 100, euros]-price) --> [acima, de, 100, euros].
nome(_, [abaixo, de, 100, euros]-price) --> [abaixo, de,100, euros].
nome(_, [200, euros]-price) --> [200, euros].
nome(_, [acima, de, 200, euros]-price) --> [acima, de, 200, euros].
nome(_, [abaixo, de,200, euros]-price) --> [abaixo, de,200, euros].
nome(_, [150, euros]-price) --> [150, euros].
nome(_, [acima, de, 150, euros]-price) --> [acima, de, 150, euros].
nome(_, [abaixo, de,150, euros]-price) --> [abaixo, de,150, euros].
nome(_, [1000, euros]-price) --> [1000, euros].
nome(_, [acima, de, 1000, euros]-price) --> [acima, de, 1000, euros].
nome(_, [abaixo, de,1000, euros]-price) --> [abaixo, de,1000, euros].
nome(_, [50, euros]-price) --> [50, euros].
nome(_, [acima, de, 50, euros]-price) --> [acima, de, 50, euros].
nome(_, [abaixo, de,50, euros]-price) --> [abaixo, de,50, euros].
nome(_, [750, euros]-price) --> [750, euros].
nome(_, [acima, de, 750, euros]-price) --> [acima, de, 750, euros].
nome(_, [abaixo, de,750, euros]-price) --> [abaixo, de,750, euros].

%% Verbs
ter(hotel, rating).
ter(hotel, service).
ter(hotel, price).
ter(hotel, room).
ter(hotel, feature).
ficar(hotel, city).
ficar(hotel, region).
ficar(hotel, address).
ficar(hotel, area).
conter(hotel, service).
conter(hotel, feature).
possuir(hotel, service).
possuir(hotel, room).
existir(hotel, area).
existir(hotel, region).
existir(hotel, city).

% © RGeneral24 -- 2015 --