-- Criar tabela aluno:

CREATE TABLE "aluno" (
  "id_aluno" serial PRIMARY KEY,
  "cpf" varchar(14),
  "nome" varchar(50),
  "email" varchar(50),
  "cep" varchar(9),
  "cidade" varchar(50),
  "estado" varchar(2),
  "celular" varchar(14),
  "data_nacimento" date,
  "escolaridade" varchar(50),
  "genero" varchar(20),
  "etnia" varchar(20),
  "id_curso" int,
  "status_empregabilidade" varchar(50)
);

-- Criar tabela matricula:

CREATE TABLE "matricula" (
  "id_matricula" serial primary key,
  "id_aluno" int,
  "id_curso" int,
  "status" varchar(50)
);


-- Criar tabela curso:

CREATE TABLE "curso" (
  "id_curso" serial PRIMARY KEY,
  "nome" varchar(50),
  "data_inicio" date,
  "data_enceramento" date,
  "status" varchar(50),
  "carga_horaria" int,
  "turno" varchar(30)
);

CREATE TABLE "modulo" (
  "id_modulo" serial PRIMARY KEY,
  "id_curso" int,
  "nivel" varchar(2),
  "ementa" varchar(250),
  "facilitador_soft" int,
  "facilitador_tech" int,
  "carga_horaria" int,
  "status_modulo" varchar(20)
);

-- Criar tabela facilitador: 

CREATE TABLE "facilitador" (
  "id_facilitador" serial PRIMARY KEY,
  "nome" varchar(50),
  "cpf" varchar(14),
  "area" varchar(50)
);

-- Criar relacionamentos:


ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_soft") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_tech") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "modulo" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "aluno" ADD  FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

-- Popular tabelas:

 
-- Popular tabela facilitador:

INSERT INTO facilitador (nome,cpf,area)
 
VALUES
  ('Hunter Blair','439.208.132-14',   'tech'),
  ('Cedric Payne','675.635.338-87',   'tech'),
  ('Sydnee Lester','328.121.498-02',  'tech'),
  ('Ethan Pearson','923.201.546-47',  'tech'),
  ('Quemby Mendez','854.330.578-60',  'tech'),
  ('Zachery Reeves','193.831.932-18', 'tech'),
  ('Adara Koch','528.635.334-85',     'soft'),
  ('Patience Bender','217.440.397-66','soft'),
  ('Callum Barber','351.461.900-31',  'soft'),
  ('Lyle Carroll','551.133.856-88',   'soft');

-- Popular tabela curso:

INSERT INTO curso (nome,  data_inicio, data_enceramento, status, carga_horaria, turno)
VALUES 
('WebDev Full Stack', '2019-02-06', '2019-08-06', 'Concluído'   , 672, 'Vespertino'), 
('Data Analytics'   , '2019-04-17', '2019-10-17', 'Concluído'   , 650, 'Vespertino'),
('WebDev Full Stack', '2019-06-22', '2019-12-20', 'Concluído'   , 696, 'Noturno'   ),
('Data Analytics'   , '2019-09-05', '2020-03-05', 'Concluído'   , 579, 'Noturno'   ),
('WebDev Full Stack', '2019-12-11', '2020-05-12', 'Concluído'   , 541, 'Noturno'   ),
('Data Analytics'   , '2020-03-15', '2020-09-18', 'Concluído'   , 563, 'Vespertino'),
('WebDev Full Stack', '2020-06-24', '2020-12-28', 'Concluído'   , 600, 'Noturno'   ),
('Data Analytics'   , '2020-08-20', '2021-02-25', 'Concluído'   , 609, 'Noturno'   ),
('WebDev Full Stack', '2020-10-03', '2021-04-07', 'Concluído'   , 591, 'Noturno'   ),
('Data Analytics'   , '2020-12-18', '2021-05-18', 'Concluído'   , 581, 'Vespertino'),
('WebDev Full Stack', '2021-02-08', '2021-08-08', 'Concluído'   , 656, 'Noturno'   ),
('Data Analytics'   , '2021-05-26', '2021-11-28', 'Concluído'   , 650, 'Noturno'   ),
('WebDev Full Stack', '2021-09-26', '2022-03-30', 'Concluído'   , 660, 'Vespertino'),
('Data Analytics'   , '2021-11-14', '2022-04-18', 'Concluído'   , 615, 'Vespertino'),
('WebDev Full Stack', '2021-12-20', '2022-05-20', 'Concluído'   , 632, 'Noturno'   ),
('Data Analytics'   , '2022-01-30', '2022-08-01', 'Concluído'   , 678, 'Noturno'   ),
('Data Analytics'   , '2022-03-02', '2022-09-05', 'Em Andamento', 657, 'Vespertino'),
('WebDev Full Stack', '2022-04-22', '2022-10-31', 'Em andamento', 604, 'Noturno'   ),
('Data Analytics'   , '2022-05-16', '2022-11-18', 'Em andamento', 682, 'Vespertino'),
('WebDev Full Stack', '2022-08-29', '2023-03-02', 'Em andamento', 650, 'Noturno'   ),
('Data Analytics'   , '2023-01-17', '2023-07-18', 'Programado'  , 650, 'Noturno'   );
 

-- Popular tabela aluno:

INSERT INTO Aluno (cpf,nome,email,cep,cidade,estado,celular,data_nacimento,escolaridade,genero,etnia,id_curso ,status_empregabilidade)
VALUES

('624.783.240-08','Carolina Márcia Sarah Jesus','carolina.jesus@outlook.com','29500970','Alegre','ES','(98)98319-4520','1990-07-12','Ensino Médio Completo','Feminino','negro',1,'Buscando Emprego'),
('134.957.110-58','Sebastiana Isis Carvalho','sebastiana.carvalho@outlook.com','25251043','Duque de Caxias','RJ','(68)99648-6921','1990-09-25','Ensino Médio Completo','Não-binário','negro',2,'Empregado - Tech'),
('319.725.970-00','Francisca Yasmin Rafaela Bernardes','francisca.bernardes@outlook.com','21843970','Rio de Janeiro','RJ','(61)97279-8964','2001-10-28','Ensino Médio Incompleto','Feminino','branco',3,'Empregado - Tech'),
('376.133.930-54','Osvaldo Diogo Corte Real','osvaldo.real@outlook.com','68702180','Capanema','PA','(32)97936-3914','1991-07-02','Ensino Superior Completo','Masculino','indigena',4,'Buscando Emprego'),
('548.636.900-02','Sarah Betina Eloá Galvão','sarah.galvao@outlook.com','89282545','São Bento do Sul','SC','(68)97524-4347','1996-04-17','Ensino Superior Completo','Feminino','negro',5,'Buscando Emprego'),
('031.515.740-25','Bernardo Bento Nascimento','bernado.nascimento@outlook.com','29101360','Vila Velha','ES','(96)98769-7425','2000-11-18','Ensino Superiro Incompleto','Não-binário','branco',6,'Buscando Emprego'),
('040.893.270-83','Manoel Benício Jorge Campos','manoel.campos@outlook.com','41307230','Salvador','BA','(84)98205-4547','1991-11-19','Ensino Médio Completo','Masculino','branco',7,'Empregado - Tech'),
('734.806.390-03','Milena Aurora Tatiane Melo','milena.melo@outlook.com','69098600','Manaus','AM','(66)99177-2628','12-07-1990','Ensino Fundamental Completo','Masculino','branco',8,'Buscando Emprego'),
('243.520.230-00','Leandro Jorge Thomas Rocha','leandro.rocha@outlook.com','29500970','Alegre','ES','(93)96739-0536','2000-02-23','Ensino Médio Completo','Feminino','negro',9,'Buscando Emprego'),
('544.528.720-34','Noah Elias Costa','noah.costa@outlook.com','59124010','Natal','RN','(11)98117-1891','2002-11-15','Ensino Médio Completo','Masculino','negro',10,'Buscando Emprego'),
('335.833.950-50','Lucas Fábio da Paz','lucas.paz@outlook.com','13275650','Valinhos','SP','(77)98587-7351','1996-03-01','Ensino Médio Completo','Não-binário','branco',11,'Buscando Emprego'),
('009.344.610-15','Elaine Silvana Jaqueline Santos','elaine.santos@outlook.com','17065411','Bauru','SP','(92)98260-1704','2001-04-11','Ensino Médio Completo','Feminino','negro',12,'Buscando Emprego'),
('098.660.450-05','Fernanda Sebastiana Nogueira','fernanda.nogueira@outlook.com','12223400','São José dos Campos','SP','(96)96707-4750','1994-11-26','Ensino Médio Completo','Feminino','negro',13,'Buscando Emprego'),
('738.985.310-74','Isabelly Carla da Luz','isabelly.luz@outlook.com','29500970','Alegre','ES','(24)98623-6788','1996-01-05','Ensino Médio Completo','Feminino','indigena',14,'Empregado - Tech'),
('642.993.950-26','Gabrielly Antônia Rafaela da Mata','gabrielly.mata@outlook.com','21843970','Rio de Janeiro','RJ','(91)97146-9961','12-07-1990','Ensino Médio Incompleto','Feminino','negro',15,'Buscando Emprego'),
('508.776.320-06','Hadassa Analu Stella Pereira','hadassa.perreira@outlook.com','68702180','Capanema','PA','(82)98752-3446','1993-10-14','Ensino Superior Completo','Feminino','branco',16,'Buscando Emprego'),
('564.098.550-01','Filipe Márcio Nathan Gonçalves','filipe.goncalves@outlook.com','89282545','São Bento do Sul','SC','(84)99984-2612','1991-12-25','Ensino Médio Completo','Masculino','branco',17,'Buscando Emprego'),
('054.596.290-04','Sarah Alana Freitas','sarah.freitas@outlook.com','29101360','Vila Velha','ES','(67)99813-1215','1996-08-11','Ensino Médio Completo','Feminino','branco',18,'Buscando Emprego'),
('336.199.830-11','Anthony Manuel Barbosa','anthony.barbosa@outlook.com','78035565','Cuiabá','MT','(79)98880-7032','1991-12-20','Ensino Médio Completo','Masculino','negro',19,'Buscando Emprego'),
('624.783.240-08','João Kauê Porto','joao.porto@outlook.com','76829312','Porto Velho','RO','(62)98957-7116','1997-11-28','Ensino Médio Completo','Masculino','negro',20,'Buscando Emprego'),
('410.468.538-48','Imani Hull','imanihull3339@aol.edu','67335-295','Parauapebas','PA','(67)14666-2379','1993-04-12','Ensino Médio Completo','feminino','branco',7,'Buscando Emprego'),
('159.612.404-19','Aphrodite Noel','aphroditenoel@aol.com','66419-102','Cametá','PA','(41)26114-2467','1994-10-24','Ensino Superior Incompleto','masculino','indígena',6,'Empregado - Tech'),
('733.648.858-90','Sydnee Bentley','sydneebentley@outlook.org','97441-468','Novo Hamburgo','RS','(21)38694-2374','1993-10-14','Ensino Superior Completo','masculino','negro',12,'Empregado - Não Tech'),
('034.631.518-44','Alec Murray','alecmurray@protonmail.org','76741-401','Goiânia','GO','(39)29321-3513','2002-05-20','Ensino Médio Completo','feminino','branco ',7,'Empregado - Tech'),
('558.608.525-53','Driscoll Erickson','driscollerickson4379@icloud.net','83768-056','Foz do Iguaçu','PR','(34)67936-2018','1994-11-26','Ensino Médio Completo','masculino','negro',19,'Buscando Emprego'),
('037.101.211-65','Ferdinand Conrad','ferdinandconrad@icloud.net','21248-132','Petrópolis','RJ','(21)71229-7858','1994-08-07','Ensino Superior Incompleto','masculino','branco',6,'Empregado - Tech'),
('277.955.328-17','Alika Pittman','alikapittman7519@google.edu','34674466','Juiz de Fora','MG','(72)27054-5407','1999-07-23','Ensino Superior Completo','feminino','indígena',2,'Empregado - Não Tech'),
('311.888.637-17','Lewis Ashley','lewisashley@hotmail.ca','66336-618','Santarém','PA','(34)38504-2354','1999-12-10','Ensino Médio Completo','masculino','negro',18,'Empregado - Tech'),
('733.065.348-68','Clayton Hebert','claytonhebert@icloud.org','65547-266','Timon','MA','(15)33413-2556','1991-07-23','Ensino Médio Completo','masculino','branco ',10,'Buscando Emprego'),
('141.678.101-62','Grace Roach','graceroach7526@hotmail.edu','34366841','Governador Valadares','MG','(84)98275-7598','1991-11-15','Ensino Superior Incompleto','feminino','negro',12,'Empregado - Tech'),
('871.521.154-30','Drake Jones','drakejones@hotmail.net','44742-560','Lauro de Freitas','BA','(58)61814-0384','1997-11-15','Ensino Superior Completo','masculino','branco',12,'Empregado - Não Tech'),
('364.833.157-18','Camden Buck','camdenbuck2578@google.edu','19532-156','Campinas','SP','(82)78886-5576','1996-01-05','Ensino Médio Completo','masculino','indígena',10,'Empregado - Tech'),
('462.889.414-78','Hilary Mullins','hilarymullins5608@google.net','75711-735','Aparecida de Goiânia','GO','(65)61606-2628','1997-10-24','Ensino Médio Completo','feminino','negro',4,'Buscando Emprego'),
('875.524.616-36','Hakeem Jensen','hakeemjensen@aol.couk','86863-772','Maringá','PR','(28)37845-0258','1997-10-07','Ensino Superior Incompleto','masculino','branco ',18,'Empregado - Tech'),
('518.227.840-67','Samuel Bentley','samuelbentley2747@protonmail.ca','27274-274','Petrópolis','RJ','(40)16739-2669','1991-12-25','Ensino Superior Completo','masculino','negro',4,'Empregado - Não Tech'),
('558.141.752-39','Octavia Oneil','octaviaoneil2693@google.com','58584-175','Cajazeiras','PB','(22)14432-3008','1997-09-25','Ensino Médio Completo','feminino','branco',2,'Empregado - Tech'),
('743.093.424-00','Fritz Cervantes','fritzcervantes9225@google.edu','87632-515','Guarapuava','PR','(42)24102-0189','1992-09-29','Ensino Médio Completo','masculino','indígena',4,'Buscando Emprego'),
('189.973.118-62','Velma Roman','velmaroman@icloud.net','24636-651','São João de Meriti','RJ','(62)64848-2252','1994-10-30','Ensino Superior Incompleto','masculino','negro',8,'Empregado - Tech'),
('051.513.544-78','Penelope Woods','penelopewoods@icloud.couk','60247-615','Itapipoca','CE','(81)87684-2424','1999-07-22','Ensino Superior Completo','feminino','branco ',5,'Empregado - Não Tech'),
('226.551.268-21','Octavia Sosa','octaviasosa9636@icloud.edu','68646-582','Ananindeua','PA','(33)58435-7732','1997-08-28','Ensino Médio Completo','masculino','negro',12,'Empregado - Tech'),
('387.467.873-59','Ora Dale','oradale@aol.com','42846-529','Camaçari','BA','(52)10103-6782','2002-11-16','Ensino Médio Completo','masculino','branco',10,'Buscando Emprego'),
('726.112.033-71','Ira Buckley','irabuckley1866@google.couk','65628-820','Codó','MA','(95)89267-8393','2003-01-01','Ensino Superior Incompleto','feminino','indígena',9,'Empregado - Tech'),
('752.256.894-54','Carol Alvarado','carolalvarado1179@hotmail.ca','74741-415','Aparecida de Goiânia','GO','(72)56663-8282','1999-10-21','Ensino Superior Completo','masculino','negro',16,'Empregado - Não Tech'),
('165.153.811-08','Ariel Cochran','arielcochran@google.couk','32240042','Santa Luzia','MG','(15)71888-5447','1998-10-04','Ensino Médio Completo','masculino','branco ',19,'Empregado - Tech'),
('303.551.362-77','Raphael Armstrong','raphaelarmstrong1972@protonmail.edu','32856505','Uberlândia','MG','(34)28219-3733','1996-12-28','Ensino Médio Completo','feminino','negro',9,'Buscando Emprego'),
('967.814.085-42','Willa Rodgers','willarodgers@yahoo.net','75743-767','Valparaíso de GO','GO','(18)62153-1702','1990-07-05','Ensino Superior Incompleto','masculino','branco',4,'Empregado - Tech'),
('883.232.419-43','Christopher Larson','christopherlarson@outlook.net','26946-133','Duque de Caxias','RJ','(61)61187-2353','1998-02-02','Ensino Superior Completo','masculino','indígena',11,'Empregado - Não Tech'),
('835.312.257-92','Alden Mayer','aldenmayer@protonmail.ca','88460-882','São José','SC','(77)52605-5913','2001-03-21','Ensino Médio Completo','feminino','negro',19,'Empregado - Tech'),
('503.340.749-39','Christen Marks','christenmarks6880@icloud.ca','27218-422','Belford Roxo','RJ','(06)15466-4075','1996-03-01','Ensino Médio Completo','masculino','branco ',3,'Buscando Emprego'),
('681.582.353-39','Kevin Finley','kevinfinley@yahoo.com','19769-879','Mauá','SP','(71)06135-1959','1990-08-26','Ensino Superior Incompleto','masculino','negro',18,'Empregado - Tech'),
('896.736.335-22','Iris Mcconnell','irismcconnell9470@outlook.org','27216-727','São João de Meriti','RJ','(43)34268-3830','2001-04-11','Ensino Superior Completo','feminino','branco',6,'Empregado - Não Tech'),
('769.719.589-87','Mari Farmer','marifarmer282@google.com','58428-126','Bayeux','PB','(54)06344-8514','2001-11-02','Ensino Médio Completo','masculino','indígena',14,'Empregado - Tech'),
('611.462.289-48','Ashton Stokes','ashtonstokes3956@hotmail.couk','42895-293','Juazeiro','BA','(37)57241-3848','1993-01-26','Ensino Médio Completo','masculino','negro',14,'Buscando Emprego'),
('948.068.738-82','Amaya Golden','amayagolden@protonmail.net','55445-165','Olinda','PE','(64)78287-7760','2002-11-15','Ensino Superior Incompleto','feminino','branco ',8,'Empregado - Tech'),
('281.492.818-28','Axel Mitchell','axelmitchell3616@yahoo.ca','76780-134','Anápolis','GO','(21)03738-3266','2001-09-21','Ensino Superior Completo','masculino','negro',16,'Empregado - Não Tech'),
('324.592.637-35','Hayes Mann','hayesmann8383@icloud.edu','24180-898','São Gonçalo','RJ','(11)68400-1196','2001-08-20','Ensino Médio Completo','masculino','branco',12,'Empregado - Tech'),
('327.484.787-41','Kelsie Hodge','kelsiehodge903@hotmail.org','61511-568','Itapipoca','CE','(56)27598-5184','1999-04-24','Ensino Médio Completo','feminino','indígena',18,'Buscando Emprego'),
('918.232.660-85','Ulric Clarke','ulricclarke@icloud.ca','26558-115','Duque de Caxias','RJ','(13)12363-7726','1997-07-31','Ensino Superior Incompleto','masculino','negro',4,'Empregado - Tech'),
('415.622.531-57','Carlos Schroeder','carlosschroeder@hotmail.ca','60169-758','Sobral','CE','(24)94363-4462','2000-01-10','Ensino Superior Completo','masculino','branco ',15,'Empregado - Não Tech'),
('520.588.627-64','Cruz Crawford','cruzcrawford@icloud.edu','87291-387','Paranaguá','PR','(23)36062-6551','1993-07-15','Ensino Médio Completo','feminino','negro',6,'Empregado - Tech'),
('775.323.799-70','Venus Dunlap','venusdunlap50@hotmail.ca','81397-645','Maringá','PR','(82)37488-4530','1995-11-26','Ensino Médio Completo','masculino','branco',16,'Buscando Emprego'),
('179.454.747-53','Malik Dale','malikdale@google.edu','58786-314','Campina Grande','PB','(64)65851-8724','1996-03-31','Ensino Superior Incompleto','masculino','indígena',6,'Empregado - Tech'),
('725.486.194-78','Ulla Mcknight','ullamcknight2267@hotmail.com','25525-333','Rio de Janeiro','RJ','(50)52760-9071','1993-09-22','Ensino Superior Completo','feminino','negro',13,'Empregado - Não Tech'),
('795.946.377-49','Axel Rivas','axelrivas2613@icloud.ca','93313-743','Caxias do Sul','RS','(46)62863-3747','2001-10-05','Ensino Médio Completo','masculino','branco ',8,'Empregado - Tech'),
('713.112.761-48','Fletcher Strickland','fletcherstrickland6015@hotmail.ca','55785-868','Camaragibe','PE','(04)16494-7228','1997-01-23','Ensino Médio Completo','masculino','negro',18,'Buscando Emprego'),
('023.163.944-59','Colby Villarreal','colbyvillarreal8124@hotmail.ca','11113-967','Carapicuíba','SP','(86)27880-4513','1991-04-09','Ensino Superior Incompleto','feminino','branco',10,'Empregado - Tech'),
('486.258.057-54','Dylan Garza','dylangarza3968@google.couk','87597-758','Cascavel','PR','(62)15448-3227','1996-02-03','Ensino Superior Completo','masculino','indígena',10,'Empregado - Não Tech'),
('526.046.712-38','Reece Long','reecelong@hotmail.edu','54358-418','Cabo de Santo Agostinho','PE','(13)07538-6761','1989-10-19','Ensino Médio Completo','masculino','negro',16,'Empregado - Tech'),
('755.151.213-54','Jarrod Phillips','jarrodphillips6318@aol.net','32167142','Uberaba','MG','(15)52771-5173','1991-07-23','Ensino Médio Completo','feminino','branco ',1,'Buscando Emprego'),
('164.742.553-56','Hu Duran','huduran@aol.ca','50231-706','Olinda','PE','(48)46366-2776','1990-06-12','Ensino Superior Incompleto','masculino','negro',18,'Empregado - Tech'),
('261.974.481-82','Marah Beach','marahbeach@aol.ca','67152-275','Ananindeua','PA','(88)28496-1489','1996-03-21','Ensino Superior Completo','masculino','branco',16,'Empregado - Não Tech'),
('464.594.617-43','Vivian Terrell','vivianterrell2892@google.ca','67479-751','Bragança','PA','(11)77161-3054','1996-08-11','Ensino Médio Completo','feminino','indígena',15,'Empregado - Tech'),
('712.237.605-91','Karleigh Parsons','karleighparsons@aol.couk','85345-153','São José dos Pinhais','PR','(78)25255-4417','1991-12-20','Ensino Médio Completo','masculino','negro',15,'Buscando Emprego'),
('137.845.174-62','Elliott Brock','elliottbrock@yahoo.net','66570-570','Castanhal','PA','(11)46808-1220','1989-09-20','Ensino Superior Incompleto','masculino','branco ',10,'Empregado - Tech'),
('428.486.815-27','Camilla Navarro','camillanavarro@google.edu','67023-443','Abaetetuba','PA','(78)74667-4426','1990-09-25','Ensino Superior Completo','feminino','negro',2,'Empregado - Não Tech'),
('713.504.112-82','Calvin Gay','calvingay303@yahoo.edu','58104-785','Santa Rita','PB','(77)99498-2657','1992-12-29','Ensino Médio Completo','masculino','branco',5,'Empregado - Tech'),
('581.474.992-01','Leonard Lindsay','leonardlindsay3256@outlook.com','61835-844','Fortaleza','CE','(32)53585-1715','1992-06-30','Ensino Médio Completo','masculino','indígena',12,'Buscando Emprego'),
('631.264.384-95','Mara Raymond','mararaymond7558@google.ca','43085-496','Vitória da Conquista','BA','(25)05640-6457','1994-06-25','Ensino Superior Incompleto','feminino','negro',13,'Empregado - Tech'),
('345.912.047-76','Leah Acevedo','leahacevedo3543@google.org','67525-560','Castanhal','PA','(64)61432-5781','1995-05-08','Ensino Superior Completo','masculino','branco ',8,'Empregado - Não Tech'),
('343.632.234-13','Neil Kidd','neilkidd@aol.org','91525-111','Novo Hamburgo','RS','(46)85496-6708','1998-02-28','Ensino Médio Completo','masculino','negro',13,'Empregado - Tech'),
('345.865.488-54','Alden Lester','aldenlester3634@icloud.ca','58435-666','João Pessoa','PB','(71)12635-3579','2001-10-28','Ensino Médio Completo','feminino','branco',7,'Buscando Emprego'),
('651.372.929-82','Lara Hawkins','larahawkins@icloud.ca','52189-771','Cabo de Santo Agostinho','PE','(57)21863-1355','1991-08-22','Ensino Superior Incompleto','masculino','indígena',17,'Empregado - Tech'),
('991.961.862-97','Iola Evans','iolaevans234@outlook.ca','65359-135','Imperatriz','MA','(22)98592-2671','1992-11-14','Ensino Superior Completo','masculino','negro',7,'Empregado - Não Tech'),
('862.794.641-62','Willow Forbes','willowforbes@aol.com','88763-935','Itajaí','SC','(67)46723-4938','1992-10-11','Ensino Médio Completo','feminino','branco ',8,'Empregado - Tech'),
('757.246.161-69','Keaton Rogers','keatonrogers@icloud.couk','84196-356','Guarapuava','PR','(62)44917-3174','1997-11-28','Ensino Médio Completo','masculino','negro',18,'Buscando Emprego'),
('433.298.787-41','Demetria Little','demetrialittle3521@aol.couk','52297-985','Camaragibe','PE','(25)09231-8372','1996-04-17','Ensino Superior Incompleto','masculino','branco',9,'Empregado - Tech'),
('268.755.777-02','Igor Byrd','igorbyrd6140@outlook.org','32108984','Uberlândia','MG','(82)12317-8875','1993-06-06','Ensino Superior Completo','feminino','indígena',11,'Empregado - Não Tech'),
('967.068.496-22','Steel Riley','steelriley@outlook.net','80054-431','Ponta Grossa','PR','(99)85984-6989','2001-02-04','Ensino Médio Completo','masculino','negro',3,'Empregado - Tech'),
('747.154.610-33','Abbot Parsons','abbotparsons@hotmail.edu','65061-643','Balsas','MA','(62)05574-8231','2000-11-18','Ensino Médio Completo','masculino','branco ',6,'Buscando Emprego'),
('715.206.769-71','Karleigh Stout','karleighstout@protonmail.net','52660-566','Olinda','PE','(61)92337-7015','2000-11-21','Ensino Superior Incompleto','feminino','negro',7,'Empregado - Tech'),
('258.104.220-96','Brenna Shaffer','brennashaffer8126@aol.edu','33534438','Juiz de Fora','MG','(87)32964-3737','1992-10-04','Ensino Superior Completo','masculino','branco',10,'Empregado - Não Tech'),
('258.406.335-36','Oren Buchanan','orenbuchanan470@protonmail.org','53138-794','Jaboatão dos Guararapes','PE','(68)66283-2201','1991-11-19','Ensino Médio Completo','masculino','indígena',4,'Empregado - Tech'),
('513.636.857-23','Palmer Gonzales','palmergonzales@aol.com','43586-144','Lauro de Freitas','BA','(17)25587-4438','2000-02-23','Ensino Médio Completo','feminino','negro',14,'Buscando Emprego'),
('275.874.848-58','Wendy Price','wendyprice@yahoo.edu','65580-135','Paço do Lumiar','MA','(39)16295-6112','1997-11-12','Ensino Superior Incompleto','masculino','branco ',10,'Empregado - Tech'),
('183.899.747-82','Lillian Baker','lillianbaker609@yahoo.org','17803-146','Jundiaí','SP','(65)27237-3416','1999-11-28','Ensino Superior Completo','masculino','negro',19,'Empregado - Não Tech'),
('657.143.707-14','Oren Snider','orensnider221@outlook.net','17443-870','Jundiaí','SP','(96)78152-8668','1990-01-12','Ensino Médio Completo','feminino','branco',10,'Empregado - Tech'),
('303.543.667-29','Fleur Morse','fleurmorse@aol.edu','75737-271','Luziânia','GO','(30)14428-8664','1991-12-12','Ensino Médio Completo','masculino','indígena',2,'Buscando Emprego'),
('618.332.204-47','Hayfa Donaldson','hayfadonaldson@protonmail.net','97529-834','Porto Alegre','RS','(52)58378-9693','2000-05-03','Ensino Superior Incompleto','masculino','negro',6,'Empregado - Tech'),
('161.396.587-59','Charde Kinney','chardekinney@google.edu','39518841','Ipatinga','MG','(75)74366-4434','1989-12-12','Ensino Superior Completo','feminino','branco ',6,'Empregado - Não Tech'),
('714.866.985-26','Clio Donovan','cliodonovan@yahoo.net','83942-822','Cascavel','PR','(48)63534-6316','1996-08-03','Ensino Médio Completo','masculino','negro',12,'Empregado - Tech');

-- Popular tabela modulo:
INSERT into modulo (id_curso, nivel, ementa, facilitador_soft, facilitador_tech, carga_horaria, status_modulo)
VALUES
(1, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7, 1, 60, 'Concluído'),       
(1, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 1, 60, 'Concluído'),       
(1, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.',7,1, 60, 'Concluído'),       
(1, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',  7, 1, 60, 'Concluído'),    
(1, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',  7, 1, 60, 'Concluído'),
(3, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.',  7, 2, 60, 'Concluído'),       
(3, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github. Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 2, 60, 'Concluído'),       
(3, '3º', 'Hard:Modelagem de banco de dados com foco em BI. Soft: Metodologias Ágeis: SCRUM.', 7, 2, 60, 'Concluído'),       
(3, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7, 2, 60, 'Concluído'),    
(3, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 7, 2, 60, 'Concluído'),     
(5, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7, 3, 60, 'Concluído'),       
(5, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.',  7, 3, 60,  'Concluído'),       
(5, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3 , 60 ,'Concluído'),       
(5, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',  7, 3, 60,'Concluído'),    
(5, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',  7, 3, 60, 'Concluído'),    
(7, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 9,2 ,60, 'Concluído'),       
(7, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 9,2,60, 'Concluído'),       
(7, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 9,3 ,60, 'Concluído'),       
(7, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 9,2, 60, 'Concluído'),    
(7, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,2,60,  'Concluído'),
(9, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,3 ,60, 'Concluído'),       
(9, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7,3, 60,'Concluído'),       
(9, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3,60, 'Concluído'),       
(9, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,3, 60,'Concluído'),    
(9, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',7,3, 60,'Concluído'), 
(11, '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,2 ,60, 'Concluído'),       
(11, '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 2,60, 'Concluído'),       
(11, '3º','Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,2 , 60,'Concluído'),       
(11, '4º','Hard: Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,2 ,60, 'Concluído'),    
(11, '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 7,2, 60,'Concluído'),   
(13, '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,3,60,  'Concluído'),       
(13, '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7,3 , 60,'Concluído'),       
(13, '3º','Hard: Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3,60, 'Concluído'),       
(13, '4º','Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,3, 60,'Concluído'),    
(13, '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,5, 60, 'Concluído'), 
(15, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 9,5, 60, 'Concluído'),       
(15, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 9,5, 60,'Concluído'),       
(15, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 9,5, 60,'Concluído'),       
(15, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 9,5,60, 'Concluído'),    
(15, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,5,60, 'Concluído'),  
(18, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 10,5, 72,'Concluído'),       
(18, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 10,5, 72,'Concluído'),       
(18, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 10,5, 72, 'Concluído'),       
(18, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',10,5, 72,'Em andamento'),    
(18, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 10,5, 72,'Não iniciado'),    
(20, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 8,3, 72, 'Em andamento'),       
(20, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 8,3, 72, 'Não iniciado'),       
(20, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 8,3, 72, 'Não iniciado'),      
(20, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.' , 8,3, 72,'Não iniciado'),    
(20, '5º', 'Hard:Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 8,3,72, 'Não iniciado'),   
(2, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 8,2,72, 'Concluído'),
(2, '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 8,2,72, 'Concluído'),
(2, '3º',  'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 8,2, 72,'Concluído'),
(2, '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 8,2, 72, 'Concluído'),
(2, '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 8,2,72, 'Concluído'),
(4, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,4,72, 'Concluído'),
(4, '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,4, 72,'Concluído'),
(4, '3º',  'Hard: Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,4, 72, 'Concluído'),
(4, '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 7,4,72, 'Concluído'),
(4, '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,4,72, 'Concluído'),
(6, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,5, 72,'Concluído'),
(6, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,5, 72,'Concluído'),
(6, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,5,72, 'Concluído'),
(6, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',7,5, 72, 'Concluído'),
(6, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,5,72, 'Concluído'),
(8, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.',9,6,72, 'Concluído'),
(8, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.',9,6,72, 'Concluído'),
(8, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,6, 72,'Concluído'),
(8, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,6, 72, 'Concluído'),
(8, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 9,6, 72,'Concluído'),
(10, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 8,1, 72,'Concluído'),
(10, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 8,1,72, 'Concluído'),
(10, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.',8,1,72, 'Concluído'),
(10, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',8,1,72, 'Concluído'),
(10, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 8,1,72, 'Concluído'),
(12, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 9,4, 72,'Concluído'),
(12, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 9,4, 72, 'Concluído'),
(12, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,4,72, 'Concluído'),
(12, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,4, 72, 'Concluído'),
(12, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,1, 72, 'Concluído'),
(14, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,1, 72 ,'Concluído'),
(14, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,1, 72,'Concluído'),
(14, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,1,72, 'Concluído'),
(14, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 10,1, 72, 'Concluído'),
(14, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,1, 72,'Concluído'),
(16, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,5,72, 'Concluído'),
(16, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,5,72, 'Concluído'),
(16, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,5,72, 'Concluído'),
(16, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',10,5,72, 'Concluído'),
(16, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,5, 72,'Concluído'),
(17, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,4,72, 'Concluído'),
(17, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,4, 72, 'Concluído'),
(17, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,4,72, 'Concluído'),
(17, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 10,4,72, 'Concluído'),
(17, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,4, 72,'Em andamento'),
(19, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,4,72, 'Concluído'),
(19, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,4,72, 'Concluído'),
(19, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,4,72, 'Em andamento'),
(19, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 7,4,72, 'Não iniciado'),
(19, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,4,72, 'Não iniciado'),
(21, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 9,3,72, 'Não iniciado'),
(21, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 9,3,72,'Não iniciado'),
(21, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,3,72,'Não iniciado'),
(21, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,3,72,'Não iniciado'),
(21, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 9,3,72,'Não iniciado');


-- Popular tabela matricula:
 
INSERT INTO matricula (id_aluno, id_curso, status)
VALUES 
(1,1,'Concluído'),
(2,2,'Concluído'),
(3,3,'Concluído'),
(4,4,'Concluído'),
(5,5,'Concluído'),
(6,6,'Concluído'),
(7,7,'Concluído'),
(8,8,'Concluído'),
(9,9,'Concluído'),
(10,10,'Concluído'),
(11,11,'Concluído'),
(12,12,'Concluído'),
(13,13,'Concluído'),
(14,14,'Concluído'),
(15,15,'Concluído'),
(16,16,'Concluído'),
(17,17,'Em Andamento'),
(18,18,'Em andamento'),
(19,19,'Em andamento'),
(20,20,'Em andamento'),
(21,7,'Concluído'),
(22,6,'Concluído'),
(23,12,'Concluído'),
(24,7,'Concluído'),
(25,19,'Em andamento'),
(26,6,'Concluído'),
(27,2,'Concluído'),
(28,18,'Em andamento'),
(29,10,'Concluído'),
(30,12,'Concluído'),
(31,12,'Concluído'),
(32,10,'Concluído'),
(33,4,'Concluído'),
(34,18,'Em andamento'),
(35,4,'Concluído'),
(36,2,'Concluído'),
(37,4,'Concluído'),
(38,8,'Concluído'),
(39,5,'Concluído'),
(40,12,'Concluído'),
(41,10,'Concluído'),
(42,9,'Concluído'),
(43,16,'Concluído'),
(44,19,'Em andamento'),
(45,9,'Concluído'), 
(46,4,'Concluído'),
(47,11,'Concluído'),
(48,19,'Em andamento'),
(49,3,'Concluído'),
(50,18,'Em andamento'),
(51,6,'Concluído'),
(52,14,'Concluído'),
(53,14,'Concluído'),
(54,8,'Concluído'),
(55,16,'Concluído'),
(56,12,'Concluído'),
(57,18,'Em andamento'),
(58,4,'Concluído'),
(59,15,'Concluído'),
(60,6,'Concluído'),
(61,16,'Concluído'),
(62,6,'Concluído'),
(63,13,'Concluído'),
(64,8,'Concluído'),
(65,18,'Em andamento'),
(66,10,'Concluído'),
(67,10,'Concluído'),
(68,16,'Concluído'),
(69,1,'Concluído'),
(70,18,'Em andamento'),
(71,16,'Concluído'),
(72,15,'Concluído'),
(73,15,'Concluído'),
(74,10,'Concluído'),
(75,2,'Concluído'),
(76,5,'Concluído'),
(77,12,'Concluído'),
(78,13,'Concluído'),
(79,8,'Concluído'),
(80,13,'Concluído'),
(81,7,'Concluído'),
(82,17,'Em Andamento'),
(83,7,'Concluído'),
(84,8,'Concluído'),
(85,18,'Em andamento'),
(86,9,'Concluído'),
(87,11,'Concluído'),
(88,3,'Concluído'),
(89,6,'Concluído'),
(90,7,'Concluído'),
(91,10,'Concluído'),
(92,4,'Concluído'),
(93,14,'Concluído'),
(94,10,'Concluído'),
(95,19,'Em andamento'),
(96,10,'Concluído'),
(97,2,'Concluído'),
(98,6,'Concluído'),
(99,6,'Concluído'),
(100,12,'Concluído');

-- QUERIES:
 
--  QUERY 1: Selecionar a quantidade total de estudantes cadastrados no banco;
 
-- QUERY 2: Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
 
-- QUERY 3: Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
 
-- QUERY 4: Qual a quantidade de pessoas do gênero feminino que fizeram /fazem o curso de WebDev por turma?;
 
-- QUERY 5: Qual a quantidade de alunos que já finalizaram o curso de WebDev e Análise de Dados que já estão trabalhando na área tech?;
 
-- QUERY 6: Qual a porcentagem de alunos avaliados como "colocou tudo em prática" e "provou seu diferencial" no projeto final do módulo 2 da turma atual de Data Analytics?.