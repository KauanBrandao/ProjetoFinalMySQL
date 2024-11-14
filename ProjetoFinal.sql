CREATE DATABASE EmpregabilidadePCD1;
USE EmpregabilidadePCD1;


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    tipo_deficiencia VARCHAR(50),
    formacao VARCHAR(100),
    experiencia TEXT,
    habilidades VARCHAR(255),
    curriculo VARCHAR(255) 
);

CREATE TABLE endereco_usuario (
    id_endereco_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL UNIQUE,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email_contato VARCHAR(100) NOT NULL UNIQUE,
    telefone_contato VARCHAR(15),
    setor VARCHAR(50),
    politica_inclusao TEXT
);

CREATE TABLE endereco_empresa (
    id_endereco_empresa INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa) ON DELETE CASCADE
);

CREATE TABLE vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    requisitos TEXT,
    salario DECIMAL(10, 2),
    tipo_contratacao VARCHAR(20),
    localizacao VARCHAR(100),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa) ON DELETE SET NULL
);


CREATE TABLE candidaturas (
    id_candidatura INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_vaga INT,
    data_aplicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Em análise',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_vaga) REFERENCES vagas(id_vaga) ON DELETE CASCADE
);


CREATE TABLE feedbacks (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_empresa INT,
    conteudo TEXT,
    data_feedback DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa) ON DELETE SET NULL
);

ALTER TABLE usuarios 
ADD COLUMN datanascimento DATE
AFTER telefone;


alter table enderecos_empresas auto_increment = 30;
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO usuarios (nome, email, cpf, telefone, tipo_deficiencia, formacao, experiencia, habilidades, curriculo, datanascimento) VALUES
('Ana Costa', 'ana.costa01@example.com', '111.111.111-11', '(11) 92345-6781', 'visual', 'Graduação em Psicologia', '5 anos em recursos humanos', 'Empatia, Comunicação, Gestão de Pessoas', 'curriculo_ana.pdf', '1992-03-12'),
('Bruno Souza', 'bruno.souza02@example.com', '222.222.222-22', '(11) 93345-6782', 'auditiva', 'Ensino Médio Completo', '2 anos em atendimento ao cliente', 'Resiliência, Atenção ao Cliente', 'curriculo_bruno.pdf', '1988-07-25'),
('Carla Mendes', 'carla.mendes03@example.com', '333.333.333-33', '(21) 94455-6677', 'física', 'Graduação em Engenharia', '3 anos em projetos', 'AutoCAD, Gestão de Projetos, Liderança', 'curriculo_carla.pdf', '1995-04-18'),
('Diego Silva', 'diego.silva04@example.com', '444.444.444-44', '(31) 95566-7788', 'nenhuma', 'Graduação em Economia', '2 anos em análise financeira', 'Excel, Estatística, Relatórios', 'curriculo_diego.pdf', '1991-11-05'),
('Elaine Santos', 'elaine.santos05@example.com', '555.555.555-55', '(41) 96677-8899', 'visual', 'Graduação em Design', '4 anos em design gráfico', 'Photoshop, Illustrator, Criatividade', 'curriculo_elaine.pdf', '1990-06-25'),
('Fernando Rocha', 'fernando.rocha06@example.com', '666.666.666-66', '(51) 97788-9900', 'auditiva', 'Ensino Técnico em Informática', '1 ano em suporte técnico', 'Comunicação, Suporte Técnico, Solução de Problemas', 'curriculo_fernando.pdf', '1998-09-30'),
('Gisele Lima', 'gisele.lima07@example.com', '777.777.777-77', '(61) 98899-0011', 'física', 'Graduação em Educação Física', '3 anos como instrutora', 'Empatia, Motivação, Planejamento de Aulas', 'curriculo_gisele.pdf', '1993-01-22'),
('Hugo Pereira', 'hugo.pereira08@example.com', '888.888.888-88', '(71) 99900-1122', 'nenhuma', 'Graduação em Marketing', '4 anos em marketing digital', 'SEO, Copywriting, Redes Sociais', 'curriculo_hugo.pdf', '1989-08-12'),
('Isabel Nunes', 'isabel.nunes09@example.com', '999.999.999-99', '(81) 90011-2233', 'visual', 'Graduação em Letras', '5 anos como revisora', 'Linguagem, Ortografia, Edição de Texto', 'curriculo_isabel.pdf', '1987-12-03'),
('João Campos', 'joao.campos10@example.com', '101.010.101-10', '(91) 91234-3344', 'nenhuma', 'Graduação em Direito', '6 anos como advogado', 'Argumentação, Análise Jurídica, Negociação', 'curriculo_joao.pdf', '1985-07-20'),
('Julia Ferreira', 'julia.ferreira11@example.com', '102.102.102-12', '(11) 92345-6782', 'nenhuma', 'Graduação em Administração', '5 anos em gestão de equipes', 'Liderança, Organização, Planejamento Estratégico', 'curriculo_julia.pdf', '1993-02-14'),
('Lucas Almeida', 'lucas.almeida12@example.com', '203.203.203-23', '(21) 93345-6783', 'visual', 'Ensino Médio Completo', '3 anos em vendas', 'Comunicação, Negociação, Persuasão', 'curriculo_lucas.pdf', '1990-05-18'),
('Mariana Silva', 'mariana.silva13@example.com', '304.304.304-34', '(31) 94455-6678', 'auditiva', 'Graduação em Turismo', '4 anos em atendimento ao cliente', 'Empatia, Organização, Trabalho em Equipe', 'curriculo_mariana.pdf', '1986-07-09'),
('Nicolas Teixeira', 'nicolas.teixeira14@example.com', '405.405.405-45', '(41) 95566-7789', 'nenhuma', 'Graduação em Ciências da Computação', '2 anos como desenvolvedor', 'Python, Java, SQL', 'curriculo_nicolas.pdf', '1995-11-25'),
('Olivia Mendes', 'olivia.mendes15@example.com', '506.506.506-56', '(51) 96677-8890', 'física', 'Ensino Técnico em Enfermagem', '3 anos como técnica em enfermagem', 'Cuidado ao Paciente, Trabalho em Equipe', 'curriculo_olivia.pdf', '1994-03-22'),
('Paulo Carvalho', 'paulo.carvalho16@example.com', '607.607.607-67', '(61) 97788-9901', 'nenhuma', 'Graduação em Engenharia Civil', '5 anos como engenheiro de obras', 'AutoCAD, Gestão de Projetos, Planejamento', 'curriculo_paulo.pdf', '1989-09-11'),
('Renata Lopes', 'renata.lopes17@example.com', '708.708.708-78', '(71) 98899-0012', 'visual', 'Graduação em Serviço Social', '6 anos como assistente social', 'Empatia, Trabalho Social, Orientação', 'curriculo_renata.pdf', '1987-04-28'),
('Sergio Pereira', 'sergio.pereira18@example.com', '809.809.809-89', '(81) 99900-1123', 'auditiva', 'Graduação em Contabilidade', '7 anos em auditoria', 'Contabilidade, Análise Financeira, Relatórios', 'curriculo_sergio.pdf', '1985-06-14'),
('Tatiana Rocha', 'tatiana.rocha19@example.com', '910.910.910-90', '(91) 90011-2234', 'física', 'Graduação em Arquitetura', '3 anos como arquiteta', 'AutoCAD, Design de Interiores, Sustentabilidade', 'curriculo_tatiana.pdf', '1992-12-10'),
('Vitor Santos', 'vitor.santos20@example.com', '011.011.011-01', '(11) 91234-3345', 'nenhuma', 'Graduação em Educação Física', '4 anos como instrutor de academia', 'Planejamento de Treinos, Motivação, Condicionamento Físico', 'curriculo_vitor.pdf', '1990-08-23'),
('Alice Martins', 'alice.martins21@example.com', '112.112.112-12', '(31) 91234-5678', 'física', 'Graduação em Biologia', '5 anos em laboratório', 'Pesquisa, Análise de Dados, Comunicação Científica', 'curriculo_alice.pdf', '1993-01-15'),
('Bruno Medeiros', 'bruno.medeiros22@example.com', '213.213.213-23', '(41) 92234-5679', 'nenhuma', 'Ensino Técnico em Eletrônica', '3 anos em manutenção', 'Eletrônica, Solução de Problemas, Trabalho em Equipe', 'curriculo_bruno_m.pdf', '1995-02-28'),
('Camila Silva', 'camila.silva23@example.com', '314.314.314-34', '(51) 93234-5680', 'visual', 'Graduação em História', '6 anos como professora', 'História, Ensino, Gestão de Sala', 'curriculo_camila.pdf', '1987-10-30'),
('Daniel Barbosa', 'daniel.barbosa24@example.com', '415.415.415-45', '(61) 94234-5681', 'auditiva', 'Ensino Médio Completo', '1 ano em atendimento ao cliente', 'Comunicação, Resiliência, Organização', 'curriculo_daniel.pdf', '1997-05-14'),
('Eduarda Ramos', 'eduarda.ramos25@example.com', '516.516.516-56', '(71) 95234-5682', 'nenhuma', 'Graduação em Administração', '3 anos como assistente administrativo', 'Organização, Planejamento, Atendimento', 'curriculo_eduarda.pdf', '1990-11-17'),
('Fábio Costa', 'fabio.costa26@example.com', '617.617.617-67', '(81) 96234-5683', 'física', 'Graduação em Engenharia Mecânica', '4 anos em engenharia de projetos', 'AutoCAD, Gestão de Projetos, Análise de Sistemas', 'curriculo_fabio.pdf', '1985-07-21'),
('Gabriela Sousa', 'gabriela.sousa27@example.com', '718.718.718-78', '(91) 97234-5684', 'visual', 'Graduação em Artes Visuais', '5 anos como ilustradora', 'Criatividade, Ilustração, Design', 'curriculo_gabriela.pdf', '1991-12-08'),
('Henrique Moreira', 'henrique.moreira28@example.com', '819.819.819-89', '(11) 98234-5685', 'auditiva', 'Ensino Técnico em Informática', '2 anos em suporte técnico', 'Suporte Técnico, Redes, Configuração de Sistemas', 'curriculo_henrique.pdf', '1998-03-19'),
('Ingrid Ferreira', 'ingrid.ferreira29@example.com', '920.920.920-90', '(21) 99234-5686', 'nenhuma', 'Graduação em Direito', '5 anos como advogada', 'Negociação, Análise Jurídica, Comunicação', 'curriculo_ingrid.pdf', '1984-09-05'),
('João Almeida', 'joao.almeida30@example.com', '021.021.021-01', '(31) 90234-5687', 'visual', 'Graduação em Jornalismo', '7 anos como jornalista', 'Reportagem, Redação, Edição de Texto', 'curriculo_joao_a.pdf', '1986-12-12'),
('Karina Santos', 'karina.santos31@example.com', '122.122.122-12', '(41) 91234-5671', 'auditiva', 'Graduação em Psicologia', '4 anos como psicóloga', 'Escuta Ativa, Diagnóstico, Orientação', 'curriculo_karina.pdf', '1992-03-20'),
('Leonardo Teixeira', 'leonardo.teixeira32@example.com', '233.233.233-23', '(51) 92345-5672', 'física', 'Ensino Técnico em Enfermagem', '6 anos como técnico de enfermagem', 'Cuidado ao Paciente, Trabalho em Equipe', 'curriculo_leonardo.pdf', '1991-06-14'),
('Marina Figueiredo', 'marina.figueiredo33@example.com', '344.344.344-34', '(61) 93456-5673', 'nenhuma', 'Graduação em Ciências Sociais', '3 anos em pesquisa social', 'Pesquisa, Análise de Dados, Relacionamento', 'curriculo_marina.pdf', '1989-07-03'),
('Nayara Lima', 'nayara.lima34@example.com', '455.455.455-45', '(71) 94567-5674', 'visual', 'Graduação em Pedagogia', '5 anos como professora', 'Ensino, Didática, Comunicação', 'curriculo_nayara.pdf', '1990-01-09'),
('Otávio Araujo', 'otavio.araujo35@example.com', '566.566.566-56', '(81) 95678-5675', 'auditiva', 'Graduação em Publicidade', '2 anos em publicidade digital', 'Marketing Digital, Comunicação Visual, Análise de Dados', 'curriculo_otavio.pdf', '1995-10-11'),
('Priscila Duarte', 'priscila.duarte36@example.com', '677.677.677-67', '(91) 96789-5676', 'nenhuma', 'Graduação em Enfermagem', '7 anos como enfermeira', 'Cuidados Intensivos, Planejamento de Tratamento', 'curriculo_priscila.pdf', '1987-02-25'),
('Rafael Moreira', 'rafael.moreira37@example.com', '788.788.788-78', '(11) 97890-5677', 'física', 'Graduação em Contabilidade', '8 anos como contador', 'Contabilidade, Planejamento Financeiro', 'curriculo_rafael.pdf', '1986-08-30'),
('Sabrina Lopes', 'sabrina.lopes38@example.com', '899.899.899-89', '(21) 98901-5678', 'visual', 'Ensino Técnico em Administração', '3 anos em administração de escritório', 'Organização, Atendimento ao Cliente, Gestão de Tarefas', 'curriculo_sabrina.pdf', '1993-09-18'),
('Thiago Campos', 'thiago.campos39@example.com', '900.900.900-90', '(31) 99912-5679', 'auditiva', 'Graduação em Sistemas de Informação', '5 anos como analista de sistemas', 'Desenvolvimento, SQL, Gestão de Sistemas', 'curriculo_thiago.pdf', '1985-12-07'),
('Vanessa Costa', 'vanessa.costa40@example.com', '011.011.011-10', '(41) 91123-5680', 'física', 'Graduação em Serviço Social', '6 anos em programas sociais', 'Empatia, Gestão de Projetos Sociais', 'curriculo_vanessa.pdf', '1989-11-21'),
('Walter Freitas', 'walter.freitas41@example.com', '122.122.122-21', '(51) 92123-5681', 'nenhuma', 'Graduação em Engenharia Civil', '5 anos em construção civil', 'AutoCAD, Planejamento de Obras', 'curriculo_walter.pdf', '1990-07-15'),
('Ximena Souza', 'ximena.souza42@example.com', '233.233.233-32', '(61) 93123-5682', 'auditiva', 'Graduação em Design Gráfico', '4 anos como designer', 'Photoshop, Illustrator, Criatividade', 'curriculo_ximena.pdf', '1989-04-04'),
('Yuri Almeida', 'yuri.almeida43@example.com', '344.344.344-43', '(71) 94123-5683', 'visual', 'Graduação em Ciências da Computação', '2 anos como desenvolvedor', 'Python, JavaScript, Banco de Dados', 'curriculo_yuri.pdf', '1997-05-19'),
('Zilda Tavares', 'zilda.tavares44@example.com', '455.455.455-54', '(81) 95123-5684', 'nenhuma', 'Ensino Técnico em Mecânica', '3 anos em manutenção mecânica', 'Mecânica, Solução de Problemas, Análise Técnica', 'curriculo_zilda.pdf', '1985-03-14'),
('Adriana Gomes', 'adriana.gomes45@example.com', '566.566.566-65', '(91) 96123-5685', 'física', 'Graduação em Educação Física', '6 anos como instrutora', 'Planejamento de Treinos, Condicionamento Físico', 'curriculo_adriana.pdf', '1987-08-10'),
('Bruno Rezende', 'bruno.rezende46@example.com', '677.677.677-76', '(11) 97123-5686', 'nenhuma', 'Graduação em Marketing', '4 anos em marketing digital', 'SEO, Estratégia Digital, Copywriting', 'curriculo_bruno_r.pdf', '1991-11-23'),
('Carla Fonseca', 'carla.fonseca47@example.com', '788.788.788-87', '(21) 98123-5687', 'auditiva', 'Graduação em Pedagogia', '5 anos em ensino infantil', 'Didática, Comunicação, Organização', 'curriculo_carla_f.pdf', '1986-02-07'),
('Diego Morais', 'diego.morais48@example.com', '899.899.899-98', '(31) 99123-5688', 'física', 'Ensino Técnico em Contabilidade', '3 anos como auxiliar contábil', 'Contabilidade, Relatórios Financeiros, Organização', 'curriculo_diego_m.pdf', '1994-09-01'),
('Elaine Castro', 'elaine.castro49@example.com', '900.900.900-09', '(41) 91123-5689', 'nenhuma', 'Graduação em Direito', '2 anos em advocacia', 'Argumentação Jurídica, Pesquisa, Redação', 'curriculo_elaine.pdf', '1992-12-15'),
('Fernando Silva', 'fernando.silva50@example.com', '011.011.011-11', '(51) 92123-5690', 'visual', 'Graduação em Ciências Contábeis', '6 anos como contador', 'Contabilidade, Auditoria, Análise Financeira', 'curriculo_fernando.pdf', '1988-05-30');


INSERT INTO usuarios (nome, email, cpf, telefone, tipo_deficiencia, formacao, experiencia, habilidades, curriculo, datanascimento) VALUES
('Alberto Machado', 'alberto.machado351@example.com', '132.333.444-55', '(11) 93212-3456', 'nenhuma', 'Graduação em História', '5 anos como professor', 'Didática, Pesquisa, Comunicação', 'curriculo_alberto.pdf', '1985-04-13'),
('Bianca Ribeiro', 'bianca.riibeiro52@example.com', '133.434.555-66', '(21) 94321-4567', 'auditiva', 'Graduação em Artes', '3 anos como designer', 'Photoshop, Illustrator, Criatividade', 'curriculo_bianca.pdf', '1990-11-03'),
('Caio Martins', 'caio.martins53@example.com', '144.555.666-77', '(31) 95432-5678', 'física', 'Graduação em Administração', '4 anos em gestão financeira', 'Organização, Planejamento, Finanças', 'curriculo_caio.pdf', '1992-06-24'),
('Diana Souza', 'diana.souza54@example.com', '155.666.777-88', '(41) 96543-6789', 'visual', 'Graduação em Psicologia', '6 anos como psicóloga clínica', 'Psicoterapia, Escuta Ativa, Empatia', 'curriculo_diana.pdf', '1987-03-10'),
('Eduardo Nunes', 'eduardo.nunes55@example.com', '166.777.888-99', '(51) 97654-7890', 'nenhuma', 'Ensino Técnico em Eletrônica', '3 anos em manutenção', 'Eletrônica, Análise de Circuitos, Solução de Problemas', 'curriculo_eduardo.pdf', '1994-09-02'),
('Fernanda Silva', 'fernanda.silva56@example.com', '177.888.999-11', '(61) 98765-8901', 'auditiva', 'Graduação em Economia', '5 anos em análise de dados', 'Análise, Planejamento, Excel', 'curriculo_fernanda.pdf', '1991-08-14'),
('Guilherme Santos', 'guilherme.santos57@example.com', '188.999.111-22', '(71) 99876-9012', 'nenhuma', 'Ensino Médio Completo', '2 anos em vendas', 'Comunicação, Negociação, Persuasão', 'curriculo_guilherme.pdf', '1988-12-08'),
('Helena Souza', 'helena.souza58@example.com', '199.111.222-33', '(81) 90987-0123', 'visual', 'Graduação em Pedagogia', '6 anos como professora', 'Ensino Infantil, Didática, Planejamento', 'curriculo_helena.pdf', '1992-10-10'),
('Igor Almeida', 'igor.almeida59@example.com', '200.222.333-44', '(91) 90123-2345', 'física', 'Ensino Técnico em Informática', '3 anos em suporte técnico', 'Configuração, Suporte ao Cliente', 'curriculo_igor.pdf', '1989-05-25'),
('Jéssica Lima', 'jessica.lima60@example.com', '211.333.444-55', '(11) 90234-3456', 'auditiva', 'Graduação em Serviço Social', '4 anos em atendimento', 'Empatia, Comunicação, Organização', 'curriculo_jessica.pdf', '1993-02-14'),
('Kaique Ribeiro', 'kaique.ribeiro61@example.com', '222.444.555-66', '(21) 91345-4567', 'nenhuma', 'Graduação em Engenharia', '2 anos em engenharia de projetos', 'AutoCAD, Cálculos, Planejamento', 'curriculo_kaique.pdf', '1995-09-09'),
('Lara Batista', 'lara.batista62@example.com', '233.555.666-77', '(31) 92456-5678', 'visual', 'Graduação em Nutrição', '3 anos em consultoria alimentar', 'Nutrição, Educação Alimentar', 'curriculo_lara.pdf', '1994-07-20'),
('Marcelo Andrade', 'marcelo.andrade63@example.com', '244.666.777-88', '(41) 93567-6789', 'física', 'Ensino Técnico em Mecânica', '5 anos como mecânico', 'Manutenção, Conserto de Equipamentos', 'curriculo_marcelo.pdf', '1986-03-01'),
('Nayara Barros', 'nayara.barros64@example.com', '255.777.888-99', '(51) 94678-7890', 'nenhuma', 'Graduação em Psicologia', '6 anos como psicóloga organizacional', 'Escuta Ativa, Desenvolvimento Organizacional', 'curriculo_nayara.pdf', '1991-06-15'),
('Otávio Ferreira', 'otavio.ferreira65@example.com', '266.888.999-11', '(61) 95789-8901', 'auditiva', 'Ensino Médio Completo', '2 anos como atendente', 'Atendimento, Organização, Empatia', 'curriculo_otavio.pdf', '1988-09-14'),
('Paula Almeida', 'paula.almeida66@example.com', '277.999.111-22', '(71) 96890-9012', 'visual', 'Graduação em Administração', '5 anos em administração de empresas', 'Liderança, Planejamento', 'curriculo_paula.pdf', '1993-12-12'),
('Renato Gonçalves', 'renato.goncalves67@example.com', '288.111.222-33', '(81) 97901-0123', 'nenhuma', 'Graduação em Física', '4 anos em pesquisa científica', 'Pesquisa, Análise de Dados', 'curriculo_renato.pdf', '1987-11-18'),
('Sônia Silva', 'sonia.silva68@example.com', '299.222.333-44', '(91) 98012-1234', 'auditiva', 'Graduação em Letras', '7 anos como professora de literatura', 'Didática, Literatura, Comunicação', 'curriculo_sonia.pdf', '1990-05-22'),
('Tiago Alves', 'tiago.alves69@example.com', '300.333.444-55', '(11) 98123-2345', 'física', 'Graduação em Engenharia Civil', '8 anos em projetos de obras', 'AutoCAD, Planejamento, Gerenciamento', 'curriculo_tiago.pdf', '1985-08-10'),
('Viviane Moraes', 'viviane.moraes70@example.com', '311.444.555-66', '(21) 98234-3456', 'nenhuma', 'Ensino Técnico em Enfermagem', '5 anos como técnica de enfermagem', 'Cuidados com Pacientes, Auxílio Médico', 'curriculo_viviane.pdf', '1992-01-28'),

('Alfredo Lira', 'alfredo.lira71@example.com', '322.555.666-77', '(31) 98345-4567', 'visual', 'Graduação em Direito', '3 anos como advogado', 'Redação Jurídica, Argumentação', 'curriculo_alfredo.pdf', '1987-04-30'),
('Beatriz Nogueira', 'beatriz.nogueira72@example.com', '333.666.777-88', '(41) 98456-5678', 'auditiva', 'Graduação em Fisioterapia', '6 anos como fisioterapeuta', 'Reabilitação, Cuidado ao Paciente', 'curriculo_beatriz.pdf', '1990-02-02'),
('Carlos Silva', 'carlos.silva73@example.com', '344.777.888-99', '(51) 98567-6789', 'nenhuma', 'Graduação em Ciências Contábeis', '4 anos como contador', 'Contabilidade, Planejamento', 'curriculo_carlos.pdf', '1988-08-25'),
('Daniela Souza', 'daniela.souza74@example.com', '355.888.999-11', '(61) 98678-7890', 'visual', 'Ensino Técnico em Logística', '3 anos em logística', 'Organização, Planejamento, Gerenciamento', 'curriculo_daniela.pdf', '1993-03-12'),
('Eduardo Vieira', 'eduardo.vieira75@example.com', '366.999.111-22', '(71) 98789-8901', 'auditiva', 'Graduação em Ciências da Computação', '6 anos como desenvolvedor', 'Python, Java, SQL', 'curriculo_eduardo_v.pdf', '1991-11-04'),
('Fabiana Santos', 'fabiana.santos76@example.com', '377.111.222-33', '(81) 98890-9012', 'física', 'Graduação em Ciências Biológicas', '3 anos em pesquisa biológica', 'Pesquisa, Análise de Amostras', 'curriculo_fabiana.pdf', '1986-07-07'),
('Gabriel Souza', 'gabriel.souza77@example.com', '388.222.333-44', '(91) 98901-0123', 'nenhuma', 'Ensino Médio Completo', '4 anos em atendimento ao cliente', 'Atendimento, Organização', 'curriculo_gabriel.pdf', '1994-02-15'),
('Heloísa Martins', 'heloisa.martins78@example.com', '399.333.444-55', '(11) 99012-1234', 'visual', 'Graduação em Química', '5 anos em laboratório', 'Análises Químicas, Solução de Problemas', 'curriculo_heloisa.pdf', '1992-05-30'),
('Ivo Rocha', 'ivo.rocha79@example.com', '400.444.555-66', '(21) 99123-2345', 'física', 'Ensino Técnico em Mecânica', '4 anos como mecânico', 'Manutenção, Ajuste de Equipamentos', 'curriculo_ivo.pdf', '1989-04-18'),
('Joana Lopes', 'joana.lopes80@example.com', '411.555.666-77', '(31) 99234-3456', 'nenhuma', 'Graduação em Artes Visuais', '3 anos como ilustradora', 'Ilustração, Desenho', 'curriculo_joana.pdf', '1995-07-14'),

('Kevin Rocha', 'kevin.rocha81@example.com', '422.666.777-88', '(41) 99345-4567', 'visual', 'Ensino Técnico em Eletrônica', '5 anos em suporte técnico', 'Configuração de Sistemas, Manutenção', 'curriculo_kevin.pdf', '1990-03-21'),
('Livia Castro', 'livia.castro82@example.com', '433.777.888-99', '(51) 99456-5678', 'nenhuma', 'Graduação em Farmácia', '4 anos em farmácia clínica', 'Prescrição, Atendimento ao Cliente', 'curriculo_livia.pdf', '1987-06-06'),
('Marcos Almeida', 'marcos.almeida83@example.com', '444.888.999-11', '(61) 99567-6789', 'auditiva', 'Graduação em Engenharia de Produção', '6 anos como engenheiro de produção', 'AutoCAD, Planejamento', 'curriculo_marcos.pdf', '1992-02-21'),
('Natalia Silva', 'natalia.silva84@example.com', '455.999.111-22', '(71) 99678-7890', 'física', 'Graduação em Ciências Sociais', '2 anos como assistente de pesquisa', 'Análise de Dados, Trabalho em Equipe', 'curriculo_natalia.pdf', '1994-08-08'),
('Otávia Mendes', 'otavia.mendes85@example.com', '466.111.222-33', '(81) 99789-8901', 'nenhuma', 'Ensino Técnico em Administração', '3 anos como auxiliar administrativo', 'Organização, Planejamento', 'curriculo_otavia.pdf', '1990-12-01'),
('Paulo Martins', 'paulo.martins86@example.com', '477.222.333-44', '(91) 99890-9012', 'visual', 'Graduação em Ciências Contábeis', '4 anos como assistente contábil', 'Contabilidade, Relatórios', 'curriculo_paulo.pdf', '1986-09-25'),
('Renata Barros', 'renata.barros87@example.com', '488.333.444-55', '(11) 99901-0123', 'auditiva', 'Ensino Técnico em Recursos Humanos', '4 anos em recrutamento', 'Entrevistas, Seleção de Candidatos', 'curriculo_renata.pdf', '1985-11-20'),
('Simone Vieira', 'simone.vieira88@example.com', '499.444.555-66', '(21) 99012-1234', 'nenhuma', 'Graduação em Moda', '6 anos como estilista', 'Criação, Design', 'curriculo_simone.pdf', '1992-02-05'),
('Tatiane Souza', 'tatiane.souza89@example.com', '500.555.666-77', '(31) 90123-2345', 'física', 'Graduação em Nutrição', '5 anos como nutricionista', 'Dieta, Educação Nutricional', 'curriculo_tatiane.pdf', '1991-03-18'),
('Vitor Lopes', 'vitor.lopes90@example.com', '511.666.777-88', '(41) 91234-3456', 'nenhuma', 'Ensino Técnico em Enfermagem', '2 anos como técnico em enfermagem', 'Cuidado com Pacientes', 'curriculo_vitor_l.pdf', '1995-09-11'),

('Amanda Rocha', 'amanda.rocha91@example.com', '522.777.888-99', '(51) 92345-4567', 'auditiva', 'Graduação em Letras', '7 anos como revisora', 'Ortografia, Gramática, Redação', 'curriculo_amanda.pdf', '1987-10-27'),
('Bernardo Silva', 'bernardo.silva92@example.com', '533.888.999-11', '(61) 93456-5678', 'nenhuma', 'Graduação em Administração', '4 anos em recursos humanos', 'Gestão de Pessoas, Entrevistas', 'curriculo_bernardo.pdf', '1993-04-01'),
('Camila Martins', 'camila.martins93@example.com', '544.999.111-22', '(71) 94567-6789', 'visual', 'Graduação em Biomedicina', '2 anos como biomédica', 'Análises Clínicas, Microbiologia', 'curriculo_camila.pdf', '1994-10-17'),
('Diego Nascimento', 'diego.nascimento94@example.com', '555.111.222-33', '(81) 95678-7890', 'auditiva', 'Graduação em Economia', '3 anos como economista', 'Análise de Mercado, Relatórios Financeiros', 'curriculo_diego.pdf', '1986-05-30'),
('Elaine Gonçalves', 'elaine.goncalves95@example.com', '566.222.333-44', '(91) 96789-8901', 'nenhuma', 'Ensino Técnico em Eletrônica', '6 anos em manutenção eletrônica', 'Eletrônica, Manutenção', 'curriculo_elaine.pdf', '1988-09-12'),
('Felipe Soares', 'felipe.soares96@example.com', '577.333.444-55', '(11) 97890-9012', 'física', 'Graduação em Engenharia Civil', '7 anos como engenheiro de obras', 'AutoCAD, Planejamento', 'curriculo_felipe.pdf', '1991-08-03'),
('Gabriela Alves', 'gabriela.alves97@example.com', '588.444.555-66', '(21) 98901-0123', 'visual', 'Ensino Médio Completo', '2 anos como recepcionista', 'Atendimento, Organização', 'curriculo_gabriela.pdf', '1990-01-05'),
('Hugo Monteiro', 'hugo.monteiro98@example.com', '599.555.666-77', '(31) 99012-1234', 'auditiva', 'Graduação em Matemática', '4 anos como professor', 'Ensino, Matemática, Didática', 'curriculo_hugo.pdf', '1987-07-02'),
('Isabela Lopes', 'isabela.lopes99@example.com', '600.666.777-88', '(41) 90123-2345', 'nenhuma', 'Ensino Técnico em Informática', '3 anos em suporte de TI', 'Suporte, Configuração', 'curriculo_isabela.pdf', '1993-03-10'),
('Juliana Ferreira', 'juliana.ferreira100@example.com', '611.777.888-99', '(51) 91234-3456', 'visual', 'Graduação em Ciências Biológicas', '5 anos em laboratório', 'Biologia, Pesquisa, Análise', 'curriculo_juliana.pdf', '1992-05-11');

alter table enderecos_usuarios auto_increment = 100;
INSERT INTO endereco_usuario (id_usuario, logradouro, numero, cidade, estado, cep) VALUES
(1, 'Rua das Flores', '120', 'São Paulo', 'SP', '01001-000'),
(2, 'Av. Paulista', '500', 'São Paulo', 'SP', '01310-000'),
(3, 'Rua XV de Novembro', '150', 'Curitiba', 'PR', '80020-310'),
(4, 'Avenida Atlântica', '1000', 'Rio de Janeiro', 'RJ', '22021-001'),
(5, 'Rua das Palmeiras', '55', 'Belo Horizonte', 'MG', '30130-060'),
(6, 'Rua Goiás', '300', 'Porto Alegre', 'RS', '90010-030'),
(7, 'Av. Brasil', '180', 'Brasília', 'DF', '70040-000'),
(8, 'Rua Santa Catarina', '45', 'Florianópolis', 'SC', '88020-100'),
(9, 'Avenida das Nações', '200', 'Recife', 'PE', '50010-110'),
(10, 'Rua Bahia', '80', 'Salvador', 'BA', '40020-200'),
(11, 'Rua Amazonas', '65', 'Fortaleza', 'CE', '60060-000'),
(12, 'Avenida Ipiranga', '230', 'São Paulo', 'SP', '01046-010'),
(13, 'Rua Maranhão', '40', 'Campinas', 'SP', '13010-100'),
(14, 'Rua Pará', '85', 'Ribeirão Preto', 'SP', '14010-120'),
(15, 'Rua Piauí', '70', 'Sorocaba', 'SP', '18010-030'),
(16, 'Rua Sergipe', '90', 'São José do Rio Preto', 'SP', '15010-000'),
(17, 'Avenida Santos Dumont', '110', 'São Vicente', 'SP', '11310-070'),
(18, 'Avenida Paulista', '1250', 'São Paulo', 'SP', '01310-200'),
(19, 'Rua das Pedras', '250', 'Búzios', 'RJ', '28950-000'),
(20, 'Rua da Harmonia', '360', 'Olinda', 'PE', '53020-000'),
(21, 'Rua Rio Grande do Norte', '100', 'Natal', 'RN', '59010-000'),
(22, 'Rua Paraíba', '120', 'Aracaju', 'SE', '49010-050'),
(23, 'Rua Bahia', '180', 'Maceió', 'AL', '57010-020'),
(24, 'Rua São Francisco', '200', 'Vitória', 'ES', '29010-000'),
(25, 'Rua Goiás', '300', 'Porto Velho', 'RO', '76801-000'),
(26, 'Rua Amazonas', '400', 'Boa Vista', 'RR', '69301-000'),
(27, 'Rua Ceará', '500', 'Palmas', 'TO', '77001-000'),
(28, 'Rua Pernambuco', '600', 'Macapá', 'AP', '68901-000'),
(29, 'Avenida Paraná', '700', 'Manaus', 'AM', '69001-000'),
(30, 'Rua Goiás', '800', 'Belém', 'PA', '66001-000'),
(31, 'Avenida São João', '1000', 'São Paulo', 'SP', '01036-000'),
(32, 'Rua Liberdade', '1200', 'São Paulo', 'SP', '01503-000'),
(33, 'Rua das Pedras', '1400', 'Brasília', 'DF', '70000-100'),
(34, 'Avenida Independência', '1600', 'Porto Alegre', 'RS', '90030-060'),
(35, 'Rua Tupi', '1800', 'Campo Grande', 'MS', '79020-100'),
(36, 'Rua Tupinambás', '2000', 'Belo Horizonte', 'MG', '30140-000'),
(37, 'Avenida do Contorno', '2200', 'Belo Horizonte', 'MG', '30110-060'),
(38, 'Rua Espírito Santo', '2400', 'Belo Horizonte', 'MG', '30150-050'),
(39, 'Avenida Sete de Setembro', '2600', 'Salvador', 'BA', '40020-500'),
(40, 'Rua dos Andradas', '2800', 'Porto Alegre', 'RS', '90020-200'),
(41, 'Rua Floriano Peixoto', '3000', 'Fortaleza', 'CE', '60025-000'),
(42, 'Rua Independência', '3200', 'Juiz de Fora', 'MG', '36010-040'),
(43, 'Rua XV de Novembro', '3400', 'Curitiba', 'PR', '80020-300'),
(44, 'Rua Carlos Gomes', '3600', 'Campinas', 'SP', '13025-000'),
(45, 'Avenida Brasil', '3800', 'Foz do Iguaçu', 'PR', '85851-000'),
(46, 'Rua Tijuca', '4000', 'Brasília', 'DF', '70030-000'),
(47, 'Rua dos Trilhos', '4200', 'Sorocaba', 'SP', '18030-040'),
(48, 'Rua Tapajós', '4400', 'Aracaju', 'SE', '49032-000'),
(49, 'Rua Tocantins', '4600', 'Manaus', 'AM', '69032-000'),
(50, 'Rua Barão de Mauá', '4800', 'São Vicente', 'SP', '11310-300'),
(51, 'Rua Princesa Isabel', '5000', 'São Paulo', 'SP', '04601-000'),
(52, 'Rua da Paz', '5200', 'Salvador', 'BA', '40000-200'),
(53, 'Rua Marquês de Pombal', '5400', 'Recife', 'PE', '50030-400'),
(54, 'Rua da Esperança', '5600', 'São Luís', 'MA', '65010-000'),
(55, 'Rua Marechal Deodoro', '5800', 'Belo Horizonte', 'MG', '30140-300'),
(56, 'Avenida Senador Vergueiro', '6000', 'São Bernardo do Campo', 'SP', '09610-000'),
(57, 'Avenida Rangel Pestana', '6200', 'São Paulo', 'SP', '03010-000'),
(58, 'Avenida do Estado', '6400', 'São Paulo', 'SP', '01516-000'),
(59, 'Rua dos Prazeres', '6600', 'Rio de Janeiro', 'RJ', '22210-000'),
(60, 'Rua Nova Esperança', '6800', 'Niterói', 'RJ', '24220-000');

INSERT INTO enderecos_usuarios (id_usuario, logradouro, numero, cidade, estado, cep) VALUES
(51, 'Rua das Palmeiras', '101', 'São Paulo', 'SP', '01010-000'),
(52, 'Av. das Flores', '202', 'Rio de Janeiro', 'RJ', '20020-010'),
(53, 'Rua dos Pioneiros', '303', 'Curitiba', 'PR', '80030-020'),
(54, 'Av. das Nações', '404', 'Porto Alegre', 'RS', '90040-030'),
(55, 'Rua do Sol', '505', 'Brasília', 'DF', '70050-040'),
(56, 'Rua das Estrelas', '606', 'Florianópolis', 'SC', '88060-050'),
(57, 'Av. Paulista', '707', 'São Paulo', 'SP', '01310-200'),
(58, 'Rua dos Lírios', '808', 'Belo Horizonte', 'MG', '30120-060'),
(59, 'Rua dos Girassóis', '909', 'Salvador', 'BA', '40020-100'),
(60, 'Av. das Américas', '1010', 'Rio de Janeiro', 'RJ', '22631-100'),
(61, 'Rua das Magnólias', '1111', 'Curitiba', 'PR', '81510-110'),
(62, 'Rua dos Jacarandás', '1212', 'Manaus', 'AM', '69020-120'),
(63, 'Av. Central', '1313', 'Fortaleza', 'CE', '60130-130'),
(64, 'Rua das Oliveiras', '1414', 'Belém', 'PA', '66020-140'),
(65, 'Av. do Estado', '1515', 'São Paulo', 'SP', '01510-150'),
(66, 'Rua da Paz', '1616', 'Recife', 'PE', '50020-160'),
(67, 'Rua do Porto', '1717', 'Santos', 'SP', '11020-170'),
(68, 'Rua dos Pinheiros', '1818', 'Porto Alegre', 'RS', '90020-180'),
(69, 'Av. dos Bandeirantes', '1919', 'Campinas', 'SP', '13030-190'),
(70, 'Rua do Comércio', '2020', 'São Luís', 'MA', '65020-200'),
(71, 'Rua dos Cajueiros', '2121', 'Maceió', 'AL', '57020-210'),
(72, 'Av. Brasil', '2222', 'São Paulo', 'SP', '01030-220'),
(73, 'Rua das Gaivotas', '2323', 'Florianópolis', 'SC', '88030-230'),
(74, 'Av. dos Navegantes', '2424', 'Vitória', 'ES', '29020-240'),
(75, 'Rua dos Jatobás', '2525', 'Goiânia', 'GO', '74020-250'),
(76, 'Rua do Oceano', '2626', 'Niterói', 'RJ', '24020-260'),
(77, 'Av. Perimetral', '2727', 'Belém', 'PA', '66030-270'),
(78, 'Rua das Hortênsias', '2828', 'Campinas', 'SP', '13040-280'),
(79, 'Av. Senador Vergueiro', '2929', 'São Bernardo do Campo', 'SP', '09720-290'),
(80, 'Rua do Bosque', '3030', 'Barueri', 'SP', '06440-300'),
(81, 'Rua das Flores', '3131', 'Jundiaí', 'SP', '13210-310'),
(82, 'Av. Santo Antônio', '3232', 'Sorocaba', 'SP', '18020-320'),
(83, 'Rua das Pitangueiras', '3333', 'Guarulhos', 'SP', '07120-330'),
(84, 'Rua dos Flamboyants', '3434', 'Osasco', 'SP', '06220-340'),
(85, 'Av. George Corbisier', '3535', 'São Paulo', 'SP', '04310-350'),
(86, 'Rua do Horto', '3636', 'São Paulo', 'SP', '02310-360'),
(87, 'Rua do Triunfo', '3737', 'Diadema', 'SP', '09920-370'),
(88, 'Av. Dr. Ricardo Jafet', '3838', 'São Paulo', 'SP', '04110-380'),
(89, 'Rua Alfredo Pujol', '3939', 'São Paulo', 'SP', '02010-390'),
(90, 'Rua Nove de Julho', '4040', 'Franca', 'SP', '14400-400'),
(91, 'Rua dos Poetas', '4141', 'Piracicaba', 'SP', '13400-410'),
(92, 'Rua das Orquídeas', '4242', 'Taubaté', 'SP', '12000-420'),
(93, 'Rua dos Jacarandás', '4343', 'Itapevi', 'SP', '06610-430'),
(94, 'Av. Presidente Kennedy', '4444', 'Indaiatuba', 'SP', '13330-440'),
(95, 'Rua da Luz', '4545', 'São José dos Campos', 'SP', '12200-450'),
(96, 'Rua das Esmeraldas', '4646', 'Santo André', 'SP', '09120-460'),
(97, 'Av. Prudente de Morais', '4747', 'Belo Horizonte', 'MG', '30320-470'),
(98, 'Rua do Sol', '4848', 'Campo Grande', 'MS', '79020-480'),
(99, 'Av. Mato Grosso', '4949', 'Cuiabá', 'MT', '78020-490'),
(100, 'Rua das Palmeiras', '5050', 'Porto Velho', 'RO', '76820-500');

INSERT INTO empresas (nome_empresa, cnpj, email_contato, telefone_contato, setor, politica_inclusao) VALUES
('Tech Solutions', '12.345.678/0001-90', 'contato@techsolutions.com', '(11) 3344-5566', 'Tecnologia', 'Inclusão de pessoas com deficiência em áreas técnicas e administrativas'),
('Admin Consultoria', '98.765.432/0001-10', 'contato@adminconsultoria.com', '(21) 3322-4455', 'Consultoria', 'Fomentar diversidade e inclusão no ambiente corporativo'),
('Saúde Total', '23.456.789/0001-80', 'contato@saudetotal.com', '(31) 2233-5566', 'Saúde', 'Acesso a profissionais com deficiência em áreas de suporte'),
('Educa Brasil', '34.567.890/0001-70', 'contato@educabrasil.com', '(41) 3344-6677', 'Educação', 'Inclusão de profissionais com deficiência em ensino e suporte técnico'),
('Eco Verdes', '45.678.901/0001-60', 'contato@ecoverdes.com', '(51) 4455-7788', 'Meio Ambiente', 'Promover acessibilidade em projetos ambientais'),
('Construtora Real', '56.789.012/0001-50', 'contato@construtorareal.com', '(61) 5566-8899', 'Construção Civil', 'Política de inclusão de operários e engenheiros com deficiência'),
('Agro Brasil', '67.890.123/0001-40', 'contato@agrobrasil.com', '(71) 6677-9900', 'Agronegócio', 'Inclusão de profissionais com deficiência em atividades rurais e de pesquisa'),
('Financeira União', '78.901.234/0001-30', 'contato@financeirauniao.com', '(81) 7788-0011', 'Financeiro', 'Acessibilidade em áreas de atendimento e suporte administrativo'),
('Design Criativo', '89.012.345/0001-20', 'contato@designcriativo.com', '(91) 8899-1122', 'Design', 'Contratação inclusiva de designers e profissionais criativos'),
('Legal Solutions', '60.123.456/0001-10', 'contato@legalsolutions.com', '(11) 9900-2233', 'Jurídico', 'Inclusão de advogados e paralegais com deficiência'),
('Travel Brasil', '01.234.567/0001-01', 'contato@travelbrasil.com', '(21) 1234-3344', 'Turismo', 'Inclusão em atividades de atendimento ao cliente e guias turísticos'),
('Shop Fácil', '12.345.678/0001-02', 'contato@shopfacil.com', '(31) 2345-4455', 'Varejo', 'Promoção da inclusão em todas as funções do varejo'),
('Inovação Tech', '23.456.789/0001-03', 'contato@inovacaotech.com', '(41) 3456-5566', 'Tecnologia', 'Contratação de desenvolvedores e analistas com deficiência'),
('Pet Amigo', '34.567.890/0001-04', 'contato@petamigo.com', '(51) 4567-6677', 'Veterinária', 'Inclusão em atendimento e suporte veterinário'),
('Auto Premium', '45.678.901/0001-05', 'contato@autopremium.com', '(61) 5678-7788', 'Automotivo', 'Inclusão de profissionais com deficiência em áreas de manutenção e atendimento'),
('Segurança Total', '56.789.012/0001-06', 'contato@segurancatotal.com', '(71) 6789-8899', 'Segurança', 'Inclusão em funções de segurança patrimonial e administrativa'),
('Editora Nacional', '67.890.123/0001-07', 'contato@editoranacional.com', '(81) 7890-9900', 'Editorial', 'Inclusão em áreas de revisão e diagramação'),
('Energia Forte', '78.901.234/0001-08', 'contato@energiaforte.com', '(91) 8901-0011', 'Energia', 'Inclusão de técnicos e engenheiros com deficiência em áreas de energia renovável'),
('Construção e Cia', '89.012.345/0001-09', 'contato@construcaoecia.com', '(11) 9012-1122', 'Construção Civil', 'Política inclusiva em obras e projetos de engenharia'),
('Mundo Verde', '90.123.456/0001-10', 'contato@mundoverde.com', '(21) 0123-2233', 'Meio Ambiente', 'Inclusão de profissionais com deficiência em áreas de pesquisa ambiental'),
('Fast Logística', '01.234.567/0001-11', 'contato@fastlogistica.com', '(31) 1234-3345', 'Logística', 'Promoção da acessibilidade em armazéns e transporte'),
('Moda Brasil', '12.345.678/0001-12', 'contato@modabrasil.com', '(41) 2345-4456', 'Moda', 'Inclusão em atividades de costura e design de moda'),
('Saúde Mais', '23.456.789/0001-13', 'contato@saudemais.com', '(51) 3456-5567', 'Saúde', 'Promoção da inclusão em áreas de atendimento médico e hospitalar'),
('Alimentos Frescos', '34.567.890/0001-14', 'contato@alimentosfrescos.com', '(61) 4567-6678', 'Alimentício', 'Contratação inclusiva em setores de produção e atendimento ao cliente'),
('Banco Real', '45.678.901/0001-15', 'contato@bancoreal.com', '(71) 5678-7789', 'Financeiro', 'Inclusão em áreas de atendimento e suporte financeiro'),
('Academia Forte', '56.789.012/0001-16', 'contato@academiaforte.com', '(81) 6789-8890', 'Educação Física', 'Inclusão em atividades de suporte e treinamento físico'),
('Café com Sabor', '67.890.123/0001-17', 'contato@cafecomsabor.com', '(91) 7890-9901', 'Alimentício', 'Promoção de acessibilidade em produção e atendimento'),
('Universidade Aberta', '78.901.234/0001-18', 'contato@universidadeaberta.com', '(11) 8901-0012', 'Educação', 'Inclusão de professores e administrativos com deficiência'),
('Fabrica Global', '89.012.345/0001-19', 'contato@fabricaglobal.com', '(21) 9012-1123', 'Indústria', 'Inclusão de operários com deficiência em setores de produção'),
('Clinica Bem Estar', '90.123.456/0001-20', 'contato@clinicabemestar.com', '(31) 0123-2234', 'Saúde', 'Promoção de acessibilidade em atendimento e áreas de suporte');
alter table enderecos_empresas auto_increment = 0;

INSERT INTO enderecos_empresas (id_empresa, logradouro, numero, cidade, estado, cep) VALUES
(1, 'Rua da Inovação', '100', 'São Paulo', 'SP', '01001-000'),
(2, 'Av. das Empresas', '500', 'Rio de Janeiro', 'RJ', '20040-000'),
(3, 'Rua do Hospital', '200', 'Belo Horizonte', 'MG', '30130-060'),
(4, 'Av. do Conhecimento', '300', 'Curitiba', 'PR', '80020-310'),
(5, 'Rua da Natureza', '50', 'Florianópolis', 'SC', '88020-100'),
(6, 'Av. das Obras', '120', 'Porto Alegre', 'RS', '90010-030'),
(7, 'Rua do Campo', '210', 'Brasília', 'DF', '70040-000'),
(8, 'Rua do Dinheiro', '350', 'Recife', 'PE', '50010-110'),
(9, 'Rua das Artes', '90', 'Salvador', 'BA', '40020-200'),
(10, 'Av. da Justiça', '400', 'Fortaleza', 'CE', '60060-000'),
(11, 'Rua do Turismo', '250', 'São Luís', 'MA', '65010-000'),
(12, 'Av. das Compras', '150', 'Belém', 'PA', '66010-200'),
(13, 'Rua da Tecnologia', '450', 'Campinas', 'SP', '13010-100'),
(14, 'Rua dos Animais', '80', 'Natal', 'RN', '59010-000'),
(15, 'Av. dos Motores', '330', 'Maceió', 'AL', '57010-020'),
(16, 'Rua da Proteção', '70', 'Aracaju', 'SE', '49010-050'),
(17, 'Av. dos Livros', '60', 'Boa Vista', 'RR', '69301-000'),
(18, 'Rua da Luz', '140', 'Porto Velho', 'RO', '76801-000'),
(19, 'Av. das Estruturas', '90', 'Macapá', 'AP', '68901-000'),
(20, 'Rua da Sustentabilidade', '180', 'Manaus', 'AM', '69001-000'),
(21, 'Av. das Cargas', '190', 'São Paulo', 'SP', '01036-000'),
(22, 'Rua das Costureiras', '170', 'Rio de Janeiro', 'RJ', '20030-000'),
(23, 'Rua da Saúde', '260', 'Brasília', 'DF', '70030-000'),
(24, 'Av. das Frutas', '110', 'São Vicente', 'SP', '11310-000'),
(25, 'Rua do Tesouro', '50', 'Guarulhos', 'SP', '07010-010'),
(26, 'Rua do Esporte', '30', 'Campinas', 'SP', '13015-000'),
(27, 'Av. do Café', '40', 'Ribeirão Preto', 'SP', '14010-000'),
(28, 'Rua da Educação', '180', 'Sorocaba', 'SP', '18010-030'),
(29, 'Av. das Máquinas', '250', 'Jundiaí', 'SP', '13210-000'),
(30, 'Rua do Bem Estar', '200', 'São Bernardo do Campo', 'SP', '09610-000');

INSERT INTO vagas (titulo, descricao, requisitos, salario, tipo_contratacao, localizacao, id_empresa) VALUES
('Desenvolvedor Front-End', 'Desenvolvimento de interfaces para aplicativos e sites.', 'HTML, CSS, JavaScript', 4000.00, 'CLT', 'São Paulo', 1),
('Analista de Suporte', 'Atendimento técnico ao cliente e suporte interno.', 'Conhecimento em redes e atendimento ao cliente', 3200.00, 'CLT', 'Rio de Janeiro', 2),
('Enfermeiro', 'Cuidados com pacientes e auxílio em procedimentos médicos.', 'Graduação em Enfermagem e registro no COREN', 4800.00, 'CLT', 'Belo Horizonte', 3),
('Professor de Matemática', 'Ensino de Matemática para ensino fundamental.', 'Licenciatura em Matemática', 3600.00, 'CLT', 'Curitiba', 4),
('Engenheiro Ambiental', 'Atuação em projetos de impacto ambiental.', 'Graduação em Engenharia Ambiental', 5500.00, 'PJ', 'Florianópolis', 5),
('Pedreiro', 'Execução de obras e reformas.', 'Experiência na construção civil', 2300.00, 'CLT', 'Porto Alegre', 6),
('Técnico Agrícola', 'Auxílio na gestão de plantações e criações.', 'Curso técnico em Agricultura', 2800.00, 'CLT', 'Brasília', 7),
('Analista Financeiro', 'Gestão e controle de finanças e orçamentos.', 'Graduação em Administração ou Economia', 4200.00, 'CLT', 'Recife', 8),
('Designer Gráfico', 'Criação de materiais visuais para marketing e publicidade.', 'Photoshop, Illustrator', 3500.00, 'PJ', 'Salvador', 9),
('Advogado Trabalhista', 'Assessoria e representação em processos trabalhistas.', 'Graduação em Direito e OAB ativa', 7000.00, 'CLT', 'Fortaleza', 10),
('Agente de Viagens', 'Planejamento e venda de pacotes turísticos.', 'Experiência em atendimento ao cliente', 3000.00, 'CLT', 'São Luís', 11),
('Caixa de Loja', 'Atendimento ao cliente e operações de caixa.', 'Ensino médio completo', 1900.00, 'CLT', 'Belém', 12),
('Programador Full Stack', 'Desenvolvimento de aplicações web.', 'Experiência com PHP, Python e bancos de dados', 6000.00, 'PJ', 'Campinas', 13),
('Veterinário', 'Atendimento clínico de animais de pequeno porte.', 'Graduação em Medicina Veterinária e CRMV ativo', 4500.00, 'CLT', 'Natal', 14),
('Mecânico de Autos', 'Manutenção de veículos leves e pesados.', 'Experiência em mecânica automotiva', 3200.00, 'CLT', 'Maceió', 15),
('Vigilante', 'Monitoramento e proteção de áreas e pessoas.', 'Curso de Vigilante e reciclagem em dia', 2200.00, 'CLT', 'Aracaju', 16),
('Editor de Textos', 'Revisão e edição de livros e revistas.', 'Formação em Letras ou Comunicação', 2900.00, 'CLT', 'Boa Vista', 17),
('Eletricista', 'Manutenção e reparos em instalações elétricas.', 'Curso de Eletricista e NR10', 2800.00, 'CLT', 'Porto Velho', 18),
('Engenheiro Civil', 'Planejamento e execução de projetos de obras.', 'Graduação em Engenharia Civil e CREA', 8000.00, 'PJ', 'Macapá', 19),
('Assistente Ambiental', 'Apoio em projetos ambientais e de sustentabilidade.', 'Curso técnico em Meio Ambiente', 3200.00, 'CLT', 'Manaus', 20),
('Motorista de Caminhão', 'Transporte de cargas e entregas.', 'CNH categoria E', 2500.00, 'CLT', 'São Paulo', 21),
('Costureira', 'Confecção e reparo de peças de vestuário.', 'Experiência com máquina de costura', 2000.00, 'CLT', 'Rio de Janeiro', 22),
('Auxiliar de Enfermagem', 'Apoio em atividades de cuidados e tratamentos.', 'Curso técnico em Enfermagem e COREN ativo', 3000.00, 'CLT', 'Brasília', 23),
('Auxiliar de Produção', 'Montagem e embalagem de produtos.', 'Ensino fundamental completo', 1600.00, 'CLT', 'São Vicente', 24),
('Gerente de Banco', 'Gestão de equipe e atendimento ao cliente.', 'Experiência em gestão financeira', 7500.00, 'CLT', 'Guarulhos', 25),
('Instrutor de Academia', 'Planejamento e orientação de treinos físicos.', 'Formação em Educação Física e CREF', 3500.00, 'CLT', 'Campinas', 26),
('Barista', 'Preparação e venda de bebidas de café.', 'Curso de Barista', 2100.00, 'CLT', 'Ribeirão Preto', 27),
('Professor Universitário', 'Ministração de aulas em curso superior.', 'Mestrado ou Doutorado', 9000.00, 'CLT', 'Sorocaba', 28),
('Operador de Máquina', 'Operação de máquinas de produção.', 'Curso de Operador de Máquinas', 2800.00, 'CLT', 'Jundiaí', 29),
('Fisioterapeuta', 'Atendimento e tratamento de pacientes.', 'Graduação em Fisioterapia e CREFITO', 4500.00, 'CLT', 'São Bernardo do Campo', 30),
('Desenvolvedor Mobile', 'Desenvolvimento de aplicativos para dispositivos móveis.', 'Conhecimento em Swift e Kotlin', 5000.00, 'PJ', 'São Paulo', 1),
('Especialista em Redes', 'Gerenciamento e manutenção de redes de computadores.', 'CCNA ou similar', 6000.00, 'CLT', 'Rio de Janeiro', 2),
('Biomédico', 'Análises clínicas e processamento de amostras.', 'Graduação em Biomedicina', 4200.00, 'CLT', 'Belo Horizonte', 3),
('Instrutor de Inglês', 'Ensino de Inglês para diferentes faixas etárias.', 'Certificação TOEFL ou equivalente', 3000.00, 'CLT', 'Curitiba', 4),
('Analista Ambiental', 'Avaliação de impacto ambiental e relatórios.', 'Formação em Gestão Ambiental', 4800.00, 'PJ', 'Florianópolis', 5),
('Engenheiro de Obras', 'Planejamento e acompanhamento de construções.', 'Experiência em obras civis', 7500.00, 'CLT', 'Porto Alegre', 6),
('Zootecnista', 'Gestão de criação animal e nutrição.', 'Graduação em Zootecnia', 4500.00, 'CLT', 'Brasília', 7),
('Auditor Interno', 'Execução de auditorias internas.', 'Experiência com auditorias financeiras', 5500.00, 'CLT', 'Recife', 8),
('Diretor de Arte', 'Desenvolvimento de campanhas publicitárias.', 'Portfólio em design gráfico', 7000.00, 'PJ', 'Salvador', 9),
('Consultor Jurídico', 'Assessoria jurídica para clientes.', 'Graduação em Direito e OAB', 10000.00, 'PJ', 'Fortaleza', 10),
('Consultor de Vendas', 'Vendas externas e prospecção de clientes.', 'Experiência em vendas', 4000.00, 'CLT', 'São Luís', 11),
('Repositor de Mercadorias', 'Organização de produtos nas prateleiras.', 'Ensino fundamental completo', 1800.00, 'CLT', 'Belém', 12),
('Engenheiro de Software', 'Desenvolvimento de sistemas e softwares.', 'Graduação em Ciências da Computação', 8000.00, 'PJ', 'Campinas', 13),
('Técnico em Radiologia', 'Operação de equipamentos de radiologia.', 'Curso técnico em Radiologia', 3500.00, 'CLT', 'Natal', 14),
('Soldador', 'Soldagem e reparo de peças metálicas.', 'Experiência em soldagem e curso de soldador', 2500.00, 'CLT', 'Maceió', 15),
('Atendente de SAC', 'Atendimento ao cliente em central de atendimento.', 'Boa comunicação e ensino médio completo', 2100.00, 'CLT', 'Aracaju', 16);

INSERT INTO vagas (titulo, descricao, requisitos, salario, tipo_contratacao, localizacao, id_empresa) VALUES
('Especialista em Logística', 'Coordenar operações logísticas e de distribuição.', 'Experiência em logística, planejamento e controle', 5500.00, 'CLT', 'Curitiba', 1),
('Analista de Marketing Digital', 'Planejar e executar campanhas digitais.', 'Experiência com SEO, Google Ads, redes sociais', 4800.00, 'CLT', 'São Paulo', 2),
('Engenheiro de Segurança do Trabalho', 'Supervisão e controle de segurança em obras.', 'Formação em Engenharia e especialização em segurança', 6500.00, 'PJ', 'Recife', 3),
('Farmacêutico', 'Atendimento e dispensação de medicamentos.', 'Graduação em Farmácia e CRF ativo', 4200.00, 'CLT', 'Porto Alegre', 4),
('Especialista em Recursos Humanos', 'Recrutamento, seleção e desenvolvimento de pessoal.', 'Graduação em Psicologia ou RH', 7000.00, 'CLT', 'Brasília', 5),
('Engenheiro de Software', 'Desenvolvimento de sistemas robustos e escaláveis.', 'Conhecimento em Java, SQL, arquitetura de software', 8500.00, 'CLT', 'Campinas', 6),
('Técnico em Enfermagem', 'Apoio e assistência em procedimentos médicos.', 'Curso técnico e COREN ativo', 2800.00, 'CLT', 'São Paulo', 7),
('Gerente de Vendas', 'Gerenciar equipe e estratégias de vendas.', 'Experiência em liderança e estratégias de vendas', 7500.00, 'CLT', 'Rio de Janeiro', 8),
('Engenheiro Elétrico', 'Projetos e execução de sistemas elétricos.', 'Graduação em Engenharia Elétrica e CREA', 7000.00, 'CLT', 'Curitiba', 9),
('Cozinheiro', 'Preparação de pratos e organização da cozinha.', 'Experiência como cozinheiro', 2500.00, 'CLT', 'Salvador', 10),
('Estagiário em Direito', 'Auxiliar em atividades jurídicas e processos.', 'Cursando Direito, boa redação', 1500.00, 'Estágio', 'São Luís', 11),
('Auxiliar Administrativo', 'Apoio em atividades de organização e atendimento.', 'Ensino médio completo, pacote Office', 1800.00, 'CLT', 'Belém', 12),
('Desenvolvedor Backend', 'Desenvolvimento de APIs e integrações.', 'Experiência com Node.js, Python ou Java', 6000.00, 'PJ', 'Campinas', 13),
('Especialista em E-commerce', 'Gerenciar plataformas e-commerce e campanhas.', 'Experiência em plataformas online e marketing digital', 5000.00, 'CLT', 'Natal', 14),
('Motorista', 'Transporte de materiais e pessoas.', 'CNH categoria D e experiência na área', 2300.00, 'CLT', 'Fortaleza', 15),
('Zelador', 'Limpeza e organização de áreas comuns.', 'Experiência como zelador', 1800.00, 'CLT', 'Porto Velho', 16),
('Desenvolvedor Java', 'Desenvolvimento de sistemas e softwares em Java.', 'Conhecimento avançado em Java, Spring', 6500.00, 'PJ', 'São Paulo', 1),
('Analista de Qualidade', 'Inspeção e controle de qualidade de produtos.', 'Experiência em controle de qualidade', 4000.00, 'CLT', 'Brasília', 17),
('Coordenador de Projetos', 'Gestão de projetos e recursos.', 'Formação em Administração, gestão de equipes', 7000.00, 'CLT', 'São Paulo', 18),
('Atendente de Loja', 'Atendimento ao cliente e operações de caixa.', 'Ensino médio completo', 1800.00, 'CLT', 'Curitiba', 19),
('Agente de Atendimento', 'Atendimento ao cliente e suporte técnico.', 'Boa comunicação e ensino médio', 2200.00, 'CLT', 'São Paulo', 20),
('Contador', 'Gestão de finanças e relatórios contábeis.', 'CRC ativo e experiência em contabilidade', 5500.00, 'CLT', 'Recife', 21),
('Técnico em Informática', 'Suporte e manutenção de equipamentos.', 'Curso técnico em Informática', 2800.00, 'CLT', 'Fortaleza', 22),
('Vendedor Externo', 'Prospecção e vendas externas.', 'Experiência em vendas externas', 3000.00, 'CLT', 'Campinas', 23),
('Redator', 'Criação de conteúdos para blog e redes sociais.', 'Formação em Comunicação ou Marketing', 3200.00, 'CLT', 'São Paulo', 24),
('Analista de Dados', 'Análise de dados e criação de relatórios.', 'Conhecimento em SQL e ferramentas de análise', 5000.00, 'PJ', 'Rio de Janeiro', 25),
('Cientista de Dados', 'Desenvolvimento de modelos preditivos e análise.', 'Formação em Matemática, Estatística ou Ciência de Dados', 8500.00, 'CLT', 'Brasília', 26),
('Técnico de Laboratório', 'Análises e controle de amostras em laboratório.', 'Curso técnico em Laboratório', 2500.00, 'CLT', 'Curitiba', 27),
('Porteiro', 'Controle de acesso e segurança.', 'Ensino médio completo', 1800.00, 'CLT', 'Salvador', 28),
('Gerente de Projetos', 'Coordenação de equipes e cronogramas.', 'Experiência em gerenciamento de projetos', 7500.00, 'CLT', 'São Paulo', 29),
('Técnico de Segurança', 'Implementação de normas de segurança.', 'Curso técnico em segurança do trabalho', 3200.00, 'CLT', 'Fortaleza', 30),
('Arquiteto de Soluções', 'Desenvolvimento de arquitetura para soluções de TI.', 'Experiência em arquitetura de sistemas', 9000.00, 'PJ', 'Campinas', 1),
('Gerente de Produção', 'Coordenação de equipes de produção.', 'Experiência em gestão de produção', 6500.00, 'CLT', 'Manaus', 2),
('Motorista Particular', 'Condução de pessoas para eventos e compromissos.', 'CNH categoria B e experiência', 2500.00, 'CLT', 'Recife', 3),
('Auxiliar de Cozinha', 'Apoio em preparação e limpeza na cozinha.', 'Ensino fundamental completo', 1500.00, 'CLT', 'São Paulo', 4);

INSERT INTO candidaturas (id_usuario, id_vaga, data_aplicacao, status) VALUES
(1, 1, '2024-05-15 09:30:00', 'Em análise'),
(2, 2, '2024-05-18 10:00:00', 'Aprovado'),
(3, 3, '2024-05-20 11:15:00', 'Rejeitado'),
(4, 4, '2024-05-22 14:45:00', 'Em análise'),
(5, 5, '2024-05-25 13:30:00', 'Aprovado'),
(6, 6, '2024-05-28 16:20:00', 'Em análise'),
(7, 7, '2024-05-30 10:50:00', 'Rejeitado'),
(8, 8, '2024-06-01 11:40:00', 'Aprovado'),
(9, 9, '2024-06-03 13:00:00', 'Em análise'),
(10, 10, '2024-06-05 14:30:00', 'Rejeitado'),
(11, 11, '2024-06-08 10:00:00', 'Em análise'),
(12, 12, '2024-06-10 09:40:00', 'Aprovado'),
(13, 13, '2024-06-12 15:10:00', 'Em análise'),
(14, 14, '2024-06-14 13:20:00', 'Rejeitado'),
(15, 15, '2024-06-15 14:10:00', 'Em análise'),
(16, 16, '2024-06-17 11:30:00', 'Aprovado'),
(17, 17, '2024-06-20 15:30:00', 'Em análise'),
(18, 18, '2024-06-22 09:50:00', 'Rejeitado'),
(19, 19, '2024-06-25 12:15:00', 'Em análise'),
(20, 20, '2024-06-27 11:40:00', 'Aprovado'),
(21, 21, '2024-06-30 16:30:00', 'Em análise'),
(22, 22, '2024-07-02 10:45:00', 'Rejeitado'),
(23, 23, '2024-07-05 09:10:00', 'Em análise'),
(24, 24, '2024-07-07 15:40:00', 'Aprovado'),
(25, 25, '2024-07-10 13:10:00', 'Em análise'),
(26, 26, '2024-07-12 11:25:00', 'Rejeitado'),
(27, 27, '2024-07-15 14:35:00', 'Em análise'),
(28, 28, '2024-07-17 12:50:00', 'Aprovado'),
(29, 29, '2024-07-20 10:40:00', 'Em análise'),
(30, 30, '2024-07-22 13:25:00', 'Rejeitado'),
(31, 1, '2024-07-25 09:20:00', 'Em análise'),
(32, 2, '2024-07-27 11:00:00', 'Aprovado'),
(33, 3, '2024-07-30 12:10:00', 'Em análise'),
(34, 4, '2024-08-02 10:05:00', 'Rejeitado'),
(35, 5, '2024-08-04 13:45:00', 'Em análise'),
(36, 6, '2024-08-06 15:30:00', 'Aprovado'),
(37, 7, '2024-08-08 10:50:00', 'Rejeitado'),
(38, 8, '2024-08-10 09:35:00', 'Em análise'),
(39, 9, '2024-08-13 14:20:00', 'Aprovado'),
(40, 10, '2024-08-15 12:25:00', 'Rejeitado'),
(41, 11, '2024-08-17 10:15:00', 'Em análise'),
(42, 12, '2024-08-20 09:30:00', 'Aprovado'),
(43, 13, '2024-08-23 16:45:00', 'Em análise'),
(44, 14, '2024-08-26 13:05:00', 'Rejeitado'),
(45, 15, '2024-08-28 11:20:00', 'Em análise'),
(46, 16, '2024-08-31 15:10:00', 'Aprovado'),
(47, 17, '2024-09-02 13:40:00', 'Em análise'),
(48, 18, '2024-09-04 10:30:00', 'Rejeitado'),
(49, 19, '2024-09-06 09:20:00', 'Em análise'),
(50, 20, '2024-09-08 12:10:00', 'Aprovado'),
(1, 21, '2024-09-10 14:00:00', 'Em análise'),
(2, 22, '2024-09-13 10:55:00', 'Rejeitado'),
(3, 23, '2024-09-15 15:20:00', 'Em análise'),
(4, 24, '2024-09-18 13:30:00', 'Aprovado'),
(5, 25, '2024-09-20 09:10:00', 'Rejeitado'),
(6, 26, '2024-09-22 11:50:00', 'Em análise'),
(7, 27, '2024-09-25 10:40:00', 'Aprovado'),
(8, 28, '2024-09-27 13:35:00', 'Em análise'),
(9, 29, '2024-09-30 15:25:00', 'Rejeitado'),
(10, 30, '2024-10-02 12:20:00', 'Em análise'),
(11, 1, '2024-10-04 11:45:00', 'Aprovado'),
(12, 2, '2024-10-06 09:15:00', 'Em análise'),
(13, 3, '2024-10-09 14:55:00', 'Rejeitado'),
(14, 4, '2024-10-11 15:30:00', 'Aprovado'),
(15, 5, '2024-10-14 11:20:00', 'Em análise'),
(16, 6, '2024-10-16 13:00:00', 'Rejeitado'),
(17, 7, '2024-10-18 09:30:00', 'Em análise'),
(18, 8, '2024-10-20 10:00:00', 'Aprovado'),
(19, 9, '2024-10-22 12:10:00', 'Em análise'),
(20, 10, '2024-10-24 15:10:00', 'Rejeitado'),
(21, 11, '2024-10-26 09:45:00', 'Em análise'),
(22, 12, '2024-10-28 11:30:00', 'Aprovado'),
(23, 13, '2024-10-30 13:10:00', 'Em análise'),
(24, 14, '2024-11-01 16:20:00', 'Rejeitado'),
(25, 15, '2024-11-03 12:00:00', 'Em análise'),
(26, 16, '2024-11-05 10:25:00', 'Aprovado'),
(27, 17, '2024-11-07 09:50:00', 'Em análise'),
(28, 18, '2024-11-09 15:45:00', 'Rejeitado'),
(29, 19, '2024-11-11 13:05:00', 'Em análise'),
(30, 20, '2024-11-13 10:30:00', 'Aprovado'),
(31, 21, '2024-11-15 12:45:00', 'Em análise'),
(32, 22, '2024-11-17 09:30:00', 'Rejeitado'),
(33, 23, '2024-11-19 14:40:00', 'Aprovado'),
(34, 24, '2024-11-21 11:10:00', 'Em análise'),
(35, 25, '2024-11-23 15:25:00', 'Rejeitado'),
(36, 26, '2024-11-25 10:50:00', 'Aprovado'),
(37, 27, '2024-11-27 12:15:00', 'Em análise'),
(38, 28, '2024-11-29 14:10:00', 'Rejeitado'),
(39, 29, '2024-12-01 16:20:00', 'Aprovado'),
(40, 30, '2024-12-03 11:55:00', 'Em análise');

INSERT INTO candidaturas (id_usuario, id_vaga, data_aplicacao, status) VALUES
(51, 1, '2024-06-05 10:00:00', 'Em análise'),
(52, 3, '2024-06-10 11:30:00', 'Aprovado'),
(53, 5, '2024-06-15 09:45:00', 'Rejeitado'),
(54, 7, '2024-06-18 13:20:00', 'Em análise'),
(55, 2, '2024-06-22 14:00:00', 'Aprovado'),
(56, 4, '2024-06-25 10:30:00', 'Rejeitado'),
(57, 8, '2024-06-27 15:45:00', 'Em análise'),
(58, 6, '2024-07-01 09:20:00', 'Aprovado'),
(59, 10, '2024-07-04 16:30:00', 'Em análise'),
(60, 9, '2024-07-08 14:10:00', 'Rejeitado'),
(61, 11, '2024-07-12 13:30:00', 'Em análise'),
(62, 13, '2024-07-14 11:50:00', 'Aprovado'),
(63, 15, '2024-07-17 15:10:00', 'Rejeitado'),
(64, 17, '2024-07-20 12:00:00', 'Em análise'),
(65, 12, '2024-07-23 10:15:00', 'Aprovado'),
(66, 14, '2024-07-26 09:00:00', 'Em análise'),
(67, 16, '2024-07-28 15:40:00', 'Rejeitado'),
(68, 18, '2024-08-01 11:20:00', 'Em análise'),
(69, 20, '2024-08-03 14:30:00', 'Aprovado'),
(70, 19, '2024-08-06 10:50:00', 'Rejeitado'),
(71, 22, '2024-08-10 09:45:00', 'Em análise'),
(72, 23, '2024-08-12 15:25:00', 'Aprovado'),
(73, 24, '2024-08-15 10:05:00', 'Rejeitado'),
(74, 25, '2024-08-18 11:15:00', 'Em análise'),
(75, 21, '2024-08-20 13:35:00', 'Aprovado');

INSERT INTO candidaturas (id_usuario, id_vaga, data_aplicacao, status) VALUES
(51, 31, '2024-07-02 09:30:00', 'Em análise'),
(52, 32, '2024-07-04 10:15:00', 'Aprovado'),
(53, 33, '2024-07-06 11:45:00', 'Rejeitado'),
(54, 34, '2024-07-08 14:20:00', 'Em análise'),
(55, 35, '2024-07-10 13:00:00', 'Aprovado'),
(56, 36, '2024-07-12 09:50:00', 'Rejeitado'),
(57, 37, '2024-07-14 15:30:00', 'Em análise'),
(58, 38, '2024-07-16 10:40:00', 'Aprovado'),
(59, 39, '2024-07-18 12:25:00', 'Rejeitado'),
(60, 40, '2024-07-20 11:10:00', 'Em análise'),
(61, 41, '2024-07-22 14:00:00', 'Aprovado'),
(62, 42, '2024-07-24 16:30:00', 'Rejeitado'),
(63, 43, '2024-07-26 13:20:00', 'Em análise'),
(64, 44, '2024-07-28 09:40:00', 'Aprovado'),
(65, 45, '2024-07-30 11:30:00', 'Rejeitado'),
(66, 46, '2024-08-01 10:00:00', 'Em análise'),
(67, 47, '2024-08-03 15:00:00', 'Aprovado'),
(68, 48, '2024-08-05 12:45:00', 'Rejeitado'),
(69, 49, '2024-08-07 09:25:00', 'Em análise'),
(70, 50, '2024-08-09 13:50:00', 'Aprovado'),
(71, 31, '2024-08-11 14:10:00', 'Rejeitado'),
(72, 32, '2024-08-13 16:15:00', 'Em análise'),
(73, 33, '2024-08-15 10:50:00', 'Aprovado'),
(74, 34, '2024-08-17 11:20:00', 'Rejeitado'),
(75, 35, '2024-08-19 12:30:00', 'Em análise');

INSERT INTO feedbacks (id_usuario, id_empresa, conteudo, data_feedback) VALUES
(1, 1, 'Ótimo ambiente de trabalho e equipe colaborativa.', '2024-06-01 10:30:00'),
(2, 2, 'Processo de recrutamento bem organizado e rápido.', '2024-06-03 14:45:00'),
(3, 3, 'Benefícios excelentes, mas pode melhorar o salário.', '2024-06-05 09:20:00'),
(4, 4, 'Ambiente de trabalho agradável e inclusivo.', '2024-06-08 11:15:00'),
(5, 5, 'Processo seletivo demorado, mas feedbacks construtivos.', '2024-06-10 15:00:00'),
(6, 6, 'Ótima empresa para crescer profissionalmente.', '2024-06-12 13:30:00'),
(7, 7, 'A empresa valoriza a diversidade e a inclusão.', '2024-06-15 16:40:00'),
(8, 8, 'Equipe acolhedora, mas o trabalho é muito exigente.', '2024-06-18 12:20:00'),
(9, 9, 'Oportunidades de crescimento limitadas.', '2024-06-20 09:50:00'),
(10, 10, 'Ambiente de trabalho colaborativo e salário justo.', '2024-06-23 14:10:00'),
(11, 11, 'Feedback rápido e processo bem organizado.', '2024-06-25 10:30:00'),
(12, 12, 'A empresa oferece bons treinamentos.', '2024-06-28 11:00:00'),
(13, 13, 'Ótima empresa para desenvolvimento de carreira.', '2024-07-01 13:45:00'),
(14, 14, 'Processo seletivo foi longo, mas muito informativo.', '2024-07-03 15:20:00'),
(15, 15, 'Equipe receptiva, mas precisa melhorar comunicação.', '2024-07-06 09:30:00'),
(16, 16, 'Benefícios e salário são muito competitivos.', '2024-07-08 12:10:00'),
(17, 17, 'Processo seletivo eficiente e feedbacks detalhados.', '2024-07-10 10:50:00'),
(18, 18, 'A cultura da empresa é bastante inclusiva.', '2024-07-13 14:55:00'),
(19, 19, 'Ambiente de trabalho colaborativo e inclusivo.', '2024-07-15 11:35:00'),
(20, 20, 'Empresa valoriza o desenvolvimento dos funcionários.', '2024-07-18 13:00:00'),
(21, 21, 'Feedbacks rápidos e processos claros.', '2024-07-20 16:25:00'),
(22, 22, 'O processo seletivo foi muito acolhedor.', '2024-07-23 15:40:00'),
(23, 23, 'A empresa oferece boas oportunidades de aprendizado.', '2024-07-25 09:15:00'),
(24, 24, 'Ambiente de trabalho inclusivo e diversificado.', '2024-07-28 10:00:00'),
(25, 25, 'Salário abaixo do mercado, mas bons benefícios.', '2024-07-30 14:30:00'),
(26, 26, 'Processo seletivo com retorno rápido e claro.', '2024-08-01 13:10:00'),
(27, 27, 'Ótima empresa para adquirir experiência.', '2024-08-03 11:50:00'),
(28, 28, 'Benefícios e cultura organizacional excelentes.', '2024-08-05 15:20:00'),
(29, 29, 'Ambiente de trabalho desafiador e recompensador.', '2024-08-07 10:40:00'),
(30, 30, 'Oportunidade de crescimento profissional.', '2024-08-10 09:55:00');

SET FOREIGN_KEY_CHECKS = 1;

# CRIAR MODELO LÓGICO
# CRIAR SELECTS
# CRIAR JOINS
# CRIAR GROUP BY
# CRIAR 10 VIEWS
# CRIAR 5+ STORED PROCEDURES 
# CRIAR 5+ FUNCTIONS 
# CRIAR 5+ TRIGGERS



SELECT * 
FROM usuarios 
WHERE experiencia LIKE CONCAT ('%', 5 , '%');

SELECT *
FROM candidaturas 
WHERE data_aplicacao BETWEEN '2024-01-01' AND '2024-10-01';

SELECT *
FROM empresas
WHERE setor = 'tecnologia' OR setor = 'saude';

SELECT * 
FROM usuarios
WHERE tipo_deficiencia = 'nenhuma';


SELECT * 
FROM usuarios 
WHERE tipo_deficiencia = 'Visual';

SELECT * 
FROM vagas 
WHERE salario > 5000 AND NOT localizacao = 'Sao Paulo';

SELECT * 
FROM enderecos_empresas 
WHERE estado IN ('BA', 'PE', 'CE');

CREATE VIEW v_informacoes_vagas AS 
SELECT 
	titulo,
	descricao,
	requisitos,
	salario,
	tipo_contratacao,
	localizacao,
	e.nome_empresa,
    COUNT(c.id_usuario) AS total_candidaturas
	FROM vagas v
    JOIN empresas e
		ON v.id_empresa = e.id_empresa
	LEFT JOIN candidaturas c
		ON v.id_vaga = c.id_vaga
	GROUP BY v.titulo, v.descricao, v.requisitos, v.salario, 
			v.tipo_contratacao, v.localizacao, e.nome_empresa
	ORDER BY v.titulo;
    
    SELECT *
    FROM v_informacoes_vagas;
    
    
    -- Procedure para criar uma nova vaga e retornar o ID da vaga criada 
    DELIMITER $$
    
    CREATE PROCEDURE p_adicionar_vaga (
    IN p_titulo VARCHAR(100),
    IN p_descricao TEXT,
    IN p_requisitos TEXT,
    IN p_salario DECIMAL(10,2),
    IN p_tipo_contracao VARCHAR(20),
    IN p_localizacao VARCHAR(100),
    IN p_id_empresa INT
    ) 
    BEGIN 
    INSERT INTO vagas(titulo, descricao, requisitos, salario, tipo_contratacao, localizacao, id_empresa)
    VALUES (p_titulo, p_descricao, p_requisitos, p_salario, p_tipo_contracao, p_localizacao, p_id_empresa);
    
    SELECT LAST_INSERT_ID() AS id_vaga_criada;
		
    END $$
    
    DELIMITER ;
    
    CALL p_adicionar_vaga('Scrum Master', 'Ter experiencia em Scrum', 'Graduacao em engenharia de Software', 8000, 'CLT', 'Bahia', 1);
    
    
    
    -- Function para retornar as vagas em uma determinada regiao 
    DELIMITER $$
    
CREATE FUNCTION f_vagas_localidade (f_localizacao VARCHAR(100)) 
RETURNS INT 
DETERMINISTIC
BEGIN 
	DECLARE total_vagas INT;
    
	SELECT COUNT(*) INTO total_vagas
    FROM vagas
    WHERE localizacao = f_localizacao;
	
    RETURN total_vagas;
END $$
	
    
    CREATE TABLE controle_usuario (
    id_usuario INT,
    nome VARCHAR(100),
    email VARCHAR(100),
    cpf VARCHAR(14),
    data_exclusao DATETIME
    );
    
DELIMITER ;

SELECT f_vagas_localidade('Sao Paulo');

DELIMITER $$

CREATE TRIGGER 	controle_delete
BEFORE DELETE ON usuarios 
FOR EACH ROW 
BEGIN 
	INSERT INTO controle_usuario(id_usuario, nome, email, cpf, data_exclusao) VALUES 
    (OLD.id_usuario, OLD.nome, OLD.email, OLD.cpf, NOW());
    
END $$

DELIMITER ;

DROP TRIGGER controle_delete;

DELETE FROM 
usuarios 
WHERE id_usuario = 101;

CREATE VIEW usuarios_vagas AS
SELECT u.nome AS nome_usuario,
       u.email AS email_usuario,
       v.titulo AS titulo_vaga,
       c.status AS status_candidatura,
       c.data_aplicacao
FROM usuarios u
JOIN candidaturas c ON u.id_usuario = c.id_usuario
JOIN vagas v ON c.id_vaga = v.id_vaga;

CREATE VIEW empresas_vagas AS
SELECT e.nome_empresa,
       v.titulo AS titulo_vaga,
       v.descricao,
       v.salario,
       v.tipo_contratacao
FROM empresas e
JOIN vagas v ON e.id_empresa = v.id_empresa;

CREATE VIEW feedbacks_usuario AS
SELECT u.nome AS nome_usuario,
       e.nome_empresa AS nome_empresa,
       f.conteudo AS conteudo_feedback,
       f.data_feedback
FROM feedbacks f
JOIN usuarios u ON f.id_usuario = u.id_usuario
JOIN empresas e ON f.id_empresa = e.id_empresa;

CREATE TRIGGER atualiza_data_feedback
BEFORE UPDATE ON feedbacks
FOR EACH ROW
SET NEW.data_feedback = CURRENT_TIMESTAMP;


DELIMITER $$

CREATE TRIGGER verifica_vaga_contratacao
BEFORE INSERT ON vagas
FOR EACH ROW
BEGIN
   IF NEW.tipo_contratacao IS NULL OR NEW.tipo_contratacao = '' THEN
      SET NEW.tipo_contratacao = 'CLT';
   END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION contar_vagas_empresa(emp_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE total_vagas INT;
   SELECT COUNT(*) INTO total_vagas
   FROM vagas
   WHERE id_empresa = emp_id;
   RETURN total_vagas;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE atualizar_status_candidatura(
    IN candidatura_id INT,
    IN novo_status VARCHAR(20)
)
BEGIN
   UPDATE candidaturas
   SET status = novo_status
   WHERE id_candidatura = candidatura_id;
END $$

DELIMITER ;



CREATE VIEW v_RELATORIO_VAGAS_EMPRESAS AS
SELECT 
    e.nome_empresa,
    v.titulo AS titulo_vaga,
    COUNT(CASE WHEN c.status = 'Em análise' OR c.status = 'Disponível' THEN 1 END) AS vagas_disponiveis,
    COUNT(CASE WHEN c.status = 'Ocupada' THEN 1 END) AS vagas_ocupadas
FROM 
    empresas e
JOIN 
    vagas v ON e.id_empresa = v.id_empresa
LEFT JOIN 
    candidaturas c ON v.id_vaga = c.id_vaga
GROUP BY 
    e.nome_empresa, v.titulo
HAVING 
    vagas_disponiveis > 0 OR vagas_ocupadas > 0;

select * from v_relatorio_vagas_empresas;


