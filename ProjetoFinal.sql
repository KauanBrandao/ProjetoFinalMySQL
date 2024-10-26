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
    endereco VARCHAR(150),
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

ALTER TABLE USUARIOS AUTO_INCREMENT = 0;

INSERT INTO Usuarios (nome, cpf, email, telefone, tipo_deficiencia, formacao, experiencia, habilidades, curriculo) VALUES
('Lucas Pereira', '123.456.789-00', 'lucas.pereira@email.com', '11987654321', 'Visual', 'Ensino Médio Completo', '2 anos em atendimento ao cliente', 'Comunicação, Organização', 'curriculos/lucas_pereira.pdf'),
('Maria Silva', '234.567.890-01', 'maria.silva@email.com', '11998765432', 'Auditiva', 'Graduação em Administração', '3 anos como assistente administrativa', 'Gestão, Excel Avançado', 'curriculos/maria_silva.pdf'),
('João Santos', '345.678.901-02', 'joao.santos@email.com', NULL, 'Física', 'Graduação em Engenharia', '1 ano em projetos de acessibilidade', 'AutoCAD, Gestão de Projetos', NULL),
('Ana Moura', '456.789.012-03', 'ana.moura@email.com', '11987654322', NULL, 'Ensino Médio Completo', NULL, 'Trabalho em Equipe', 'curriculos/ana_moura.pdf'),
('Carlos Almeida', '567.890.123-04', 'carlos.almeida@email.com', NULL, 'Física', 'Graduação em Ciências da Computação', '5 anos em desenvolvimento de software', 'Java, SQL', 'curriculos/carlos_almeida.pdf'),
('Fernanda Costa', '678.901.234-05', 'fernanda.costa@email.com', '11965432198', 'Auditiva', NULL, 'Estágio em marketing', 'Redação, Criatividade', 'curriculos/fernanda_costa.pdf'),
('Roberto Lima', '789.012.345-06', 'roberto.lima@email.com', '11987654323', 'Visual', 'Ensino Técnico em Eletrotécnica', '3 anos como técnico', 'Manutenção, Eletrônica', 'curriculos/roberto_lima.pdf'),
('Patrícia Dias', '890.123.456-07', 'patricia.dias@email.com', NULL, 'Física', 'Graduação em Biomedicina', '2 anos em laboratório', 'Análise, Pesquisa', NULL),
('Mariana Santos', '901.234.567-08', 'mariana.santos@email.com', '11954321678', 'Auditiva', 'Pós-graduação em Psicologia', NULL, 'Aconselhamento', 'curriculos/mariana_santos.pdf'),
('Júlio Mendes', '012.345.678-09', 'julio.mendes@email.com', NULL, 'Visual', 'Graduação em Design Gráfico', '4 anos em criação de sites', 'Photoshop, HTML', NULL),
('Clara Nascimento', '123.456.789-10', 'clara.nascimento@email.com', '11987654324', 'Auditiva', 'Ensino Médio Completo', '2 anos em vendas', 'Persuasão, Atendimento', NULL),
('Pedro Rocha', '234.567.890-11', 'pedro.rocha@email.com', NULL, 'Física', 'Graduação em Física', NULL, 'Pesquisa, Experiência em laboratório', NULL),
('Juliana Martins', '345.678.901-12', 'juliana.martins@email.com', '11965432197', NULL, 'Pós-graduação em Educação', NULL, 'Educação Inclusiva', NULL),
('Victor Ferreira', '456.789.012-13', 'victor.ferreira@email.com', '11987654325', 'Auditiva', NULL, 'Experiência em ensino', 'Ensino', 'curriculos/victor_ferreira.pdf'),
('Tatiane Alves', '567.890.123-14', 'tatiane.alves@email.com', NULL, 'Visual', 'Ensino Superior em Gastronomia', '2 anos em restaurante', 'Culinária, Criatividade', 'curriculos/tatiane_alves.pdf'),
('Renato Ribeiro', '678.901.234-15', 'renato.ribeiro@email.com', NULL, 'Física', 'Graduação em Engenharia Civil', '1 ano em obras', NULL, NULL),
('Sérgio Pereira', '789.012.345-16', 'sergio.pereira@email.com', '11987654326', 'Auditiva', 'Graduação em História', '3 anos em museu', 'Organização de eventos', NULL),
('Eliane Soares', '890.123.456-17', 'eliane.soares@email.com', NULL, 'Visual', 'Graduação em Letras', NULL, 'Redação, Tradução', 'curriculos/eliane_soares.pdf'),
('Tiago Costa', '901.234.567-18', 'tiago.costa@email.com', '11954321679', NULL, NULL, 'Experiência em call center', 'Atendimento', NULL),
('Nathalia Campos', '012.345.678-19', 'nathalia.campos@email.com', '11987654327', 'Física', 'Graduação em Administração', '3 anos em vendas', 'Persuasão, Comunicação', 'curriculos/nathalia_campos.pdf'),
('Gustavo Lopes', '123.456.789-20', 'gustavo.lopes@email.com', NULL, 'Auditiva', 'Ensino Médio Completo', NULL, 'Liderança', 'curriculos/gustavo_lopes.pdf'),
('Kelly Andrade', '234.567.890-21', 'kelly.andrade@email.com', '11998765433', 'Visual', 'Graduação em Engenharia de Software', '1 ano em desenvolvimento', NULL, NULL),
('Fernando Dias', '345.678.901-22', 'fernando.dias@email.com', NULL, NULL, 'Graduação em Ciências Contábeis', '2 anos em escritório contábil', 'Contabilidade', 'curriculos/fernando_dias.pdf'),
('Camila Ribeiro', '456.789.012-23', 'camila.ribeiro@email.com', '11987654328', 'Auditiva', NULL, NULL, 'Atendimento ao público', NULL),
('Ricardo Almeida', '567.890.123-24', 'ricardo.almeida@email.com', '11976543210', 'Física', 'Ensino Técnico em Informática', '3 anos em suporte técnico', 'Assistência, Problemas de TI', 'curriculos/ricardo_almeida.pdf'),
('Bianca Martins', '678.901.234-25', 'bianca.martins@email.com', NULL, NULL, 'Pós-graduação em Saúde Mental', '2 anos como terapeuta', NULL, NULL),
('André Silva', '789.012.345-26', 'andre.silva@email.com', '11987654329', 'Visual', 'Graduação em Nutrição', NULL, 'Culinária, Consultoria', 'curriculos/andre_silva.pdf'),
('Priscila Sousa', '890.123.456-27', 'priscila.sousa@email.com', NULL, 'Física', 'Pós-graduação em Educação Especial', '1 ano em escola inclusiva', 'Educação Inclusiva', 'curriculos/priscila_sousa.pdf'),
('Hugo Lima', '901.234.567-28', 'hugo.lima@email.com', '11954321680', 'Auditiva', 'Graduação em Ciências Biológicas', '3 anos em pesquisa', 'Laboratório, Pesquisa', 'curriculos/hugo_lima.pdf'),
('Roberta Mendes', '012.345.678-29', 'roberta.mendes@email.com', NULL, NULL, 'Ensino Médio Completo', '2 anos em atendimento', 'Comunicação, Trabalho em equipe', NULL),
('Samuel Rocha', '123.456.789-30', 'samuel.rocha@email.com', '11987654330', 'Visual', NULL, NULL, 'Habilidades interpessoais', 'curriculos/samuel_rocha.pdf'),
('Tatiane Silva', '234.567.890-31', 'tatiane.silva@email.com', NULL, 'Auditiva', 'Ensino Médio', '1 ano como vendedora', 'Vendas', 'curriculos/tatiane_silva.pdf'),
('Leonardo Ferreira', '345.678.901-32', 'leonardo.ferreira@email.com', '11987654331', NULL, 'Graduação em Jornalismo', '2 anos em redação', NULL, NULL),
('Juliana Lima', '456.789.012-33', 'juliana.lima@email.com', NULL, 'Física', 'Pós-graduação em Sociologia', '1 ano em pesquisa social', 'Análise, Relatório', 'curriculos/juliana_lima.pdf'),
('Danilo Costa', '567.890.123-34', 'danilo.costa@email.com', '11976543211', 'Visual', 'Ensino Médio Completo', NULL, 'Assistência ao cliente', NULL),
('Tatiane Gomes', '678.901.234-35', 'tatiane.gomes@email.com', NULL, NULL, 'Graduação em Marketing', NULL, 'Vendas, Publicidade', 'curriculos/tatiane_gomes.pdf'),
('Renato Almeida', '789.012.345-36', 'renato.almeida@email.com', NULL, 'Auditiva', 'Pós-graduação em Finanças', NULL, 'Consultoria financeira', NULL),
('Marcelo Nascimento', '890.123.456-37', 'marcelo.nascimento@email.com', '11987654332', NULL, NULL, 'Experiência em logística', 'Logística', NULL);


INSERT INTO endereco_usuario (id_usuario, logradouro, numero, cidade, estado, cep) VALUES
(1, 'Rua A', '100', 'São Paulo', 'SP', '01000-000'),
(2, 'Avenida B', '200', 'Rio de Janeiro', 'RJ', '20000-000'),
(3, 'Travessa C', '300', 'Belo Horizonte', 'MG', '30000-000'),
(4, 'Praça D', '400', 'Salvador', 'BA', '40000-000'),
(5, 'Rua E', '500', 'Fortaleza', 'CE', '60000-000'),
(6, 'Avenida F', '600', 'Curitiba', 'PR', '80000-000'),
(7, 'Travessa G', '700', 'Manaus', 'AM', '69000-000'),
(8, 'Praça H', '800', 'Recife', 'PE', '50000-000'),
(9, 'Rua I', '900', 'Porto Alegre', 'RS', '90000-000'),
(10, 'Avenida J', '1000', 'Florianópolis', 'SC', '88000-000'),
(11, 'Travessa K', '1100', 'Belém', 'PA', '66000-000'),
(12, 'Praça L', '1200', 'Goiânia', 'GO', '74000-000'),
(13, 'Rua M', '1300', 'Maceió', 'AL', '57000-000'),
(14, 'Avenida N', '1400', 'Teresina', 'PI', '64000-000'),
(15, 'Travessa O', '1500', 'São Luís', 'MA', '65000-000'),
(16, 'Praça P', '1600', 'Natal', 'RN', '59000-000'),
(17, 'Rua Q', '1700', 'Campo Grande', 'MS', '79000-000'),
(18, 'Avenida R', '1800', 'João Pessoa', 'PB', '58000-000'),
(19, 'Travessa S', '1900', 'Aracaju', 'SE', '49000-000'),
(20, 'Praça T', '2000', 'Cuiabá', 'MT', '78000-000'),
(21, 'Rua U', '2100', 'Palmas', 'TO', '77000-000'),
(22, 'Avenida V', '2200', 'Macapá', 'AP', '68900-000'),
(23, 'Travessa W', '2300', 'Rio Branco', 'AC', '69900-000'),
(24, 'Praça X', '2400', 'Boa Vista', 'RR', '69300-000'),
(25, 'Rua Y', '2500', 'Porto Velho', 'RO', '76800-000'),
(26, 'Avenida Z', '2600', 'São Paulo', 'SP', '01000-000'),
(27, 'Travessa AA', '2700', 'Rio de Janeiro', 'RJ', '20000-000'),
(28, 'Praça AB', '2800', 'Belo Horizonte', 'MG', '30000-000'),
(29, 'Rua AC', '2900', 'Salvador', 'BA', '40000-000'),
(30, 'Avenida AD', '3000', 'Fortaleza', 'CE', '60000-000'),
(31, 'Travessa AE', '3100', 'Curitiba', 'PR', '80000-000'),
(32, 'Praça AF', '3200', 'Manaus', 'AM', '69000-000'),
(33, 'Rua AG', '3300', 'Recife', 'PE', '50000-000'),
(34, 'Avenida AH', '3400', 'Porto Alegre', 'RS', '90000-000'),
(35, 'Travessa AI', '3500', 'Florianópolis', 'SC', '88000-000'),
(36, 'Praça AJ', '3600', 'Belém', 'PA', '66000-000'),
(37, 'Rua AK', '3700', 'Goiânia', 'GO', '74000-000'),
(38, 'Avenida AL', '3800', 'Maceió', 'AL', '57000-000');

alter table empresas auto_increment = 0;
INSERT INTO empresas (nome_empresa, cnpj, email_contato, telefone_contato, setor, endereco, politica_inclusao) VALUES
("InovaTech", "12.345.678/0001-90", "contato@inovatech.com.br", "11 91234-5678", "Tecnologia", "Av. das Nações, 100", "Comprometida com a inclusão de PCDs em tecnologia."),
("EcoAmbiente", "23.456.789/0001-01", "contato@ecoambiente.com.br", "11 93456-7890", "Meio Ambiente", "Rua Verde, 200", "Valorização da diversidade e sustentabilidade."),
("Saúde em Foco", "34.567.890/0001-02", "contato@saudeemfoco.com.br", "11 95678-9012", "Saúde", "Av. da Saúde, 300", "Inclusão de talentos de diferentes origens."),
("Design Criativo", "45.678.901/0001-03", "contato@designcriativo.com.br", "11 97890-1234", "Design", "Rua da Criatividade, 400", "Promoção da diversidade em design."),
("Delícias do Sabor", "56.789.012/0001-04", "contato@deliciasdosabor.com.br", "11 99012-3456", "Alimentação", "Av. dos Sabores, 500", "Abertura para PCDs na equipe."),
("Educação Transformadora", "67.890.123/0001-05", "contato@educacaotransformadora.com.br", "11 90123-4567", "Educação", "Rua do Conhecimento, 600", "Inclusão e diversidade na educação."),
("SmartHome Solutions", "78.901.234/0001-06", "contato@smarthomesolutions.com.br", "11 91234-5678", "Tecnologia", "Av. da Inovação, 700", "Apoio a talentos diversos."),
("Rápido e Prático", "89.012.345/0001-07", "contato@rapidopratica.com.br", "11 92345-6789", "Logística", "Rua da Logística, 800", "Valorizamos a inclusão em nossa equipe."),
("Papelaria Moderna", "90.123.456/0001-08", "contato@papelariamoderna.com.br", "11 93456-7890", "Comércio", "Av. do Papel, 900", "Compromisso com a diversidade."),
("Construtora Confiável", "01.234.567/0001-09", "contato@construtoraconfiavel.com.br", "11 94567-8901", "Construção", "Rua das Obras, 1000", "Inclusão em nossos projetos."),
("Global Consulting", "12.345.678/0001-10", "contato@globalconsulting.com.br", "11 95678-9012", "Consultoria", "Av. das Consultorias, 1100", "Diversidade na consultoria."),
("Auto Mecânica Prime", "23.456.789/0001-11", "contato@automecanicaprime.com.br", "11 96789-0123", "Automotivo", "Rua do Motor, 1200", "Abertura para PCDs."),
("Estilo Fashion", "34.567.890/0001-12", "contato@estilofashion.com.br", "11 97890-1234", "Moda", "Av. da Moda, 1300", "Inclusão em nosso setor."),
("Soluções Financeiras", "45.678.901/0001-13", "contato@solucoesfinanceiras.com.br", "11 98901-2345", "Financeiro", "Rua do Dinheiro, 1400", "Diversidade em nossa equipe."),
("Turismo Aventura", "56.789.012/0001-14", "contato@turismoaventura.com.br", "11 99012-3456", "Turismo", "Av. da Aventura, 1500", "Valorização de todos os talentos."),
("Pet Shop da Alegria", "67.890.123/0001-15", "contato@petshopalegria.com.br", "11 90123-4567", "Animais de Estimação", "Rua dos Pets, 1600", "Inclusão de PCDs."),
("Café do Ponto", "78.901.234/0001-16", "contato@cafedoponto.com.br", "11 91234-5678", "Alimentação", "Av. do Café, 1700", "Política de inclusão na contratação."),
("Manutenção Ágil", "89.012.345/0001-17", "contato@manutencaoagil.com.br", "11 92345-6789", "Manutenção", "Rua da Manutenção, 1800", "Inclusão em nossa equipe."),
("Estúdios Criativos", "90.123.456/0001-18", "contato@estudioscriativos.com.br", "11 93456-7890", "Criatividade", "Av. da Criação, 1900", "Diversidade em nossa equipe."),
("Transporte Seguro", "01.234.567/0001-19", "contato@transporteseguro.com.br", "11 94567-8901", "Transporte", "Rua da Mobilidade, 2000", "Promoção da inclusão."),
("Agência Digital", "12.345.678/0001-20", "contato@agenciadigital.com.br", "11 95678-9012", "Marketing", "Av. das Redes, 2100", "Apoio à diversidade em marketing."),
("Serviços Gerais", "23.456.789/0001-21", "contato@servicosgerais.com.br", "11 96789-0123", "Serviços", "Rua dos Serviços, 2200", "Compromisso com a inclusão de todos."),
("Conexão Saúde", "34.567.890/0001-22", "contato@conexaosaude.com.br", "11 97890-1234", "Saúde", "Av. da Conexão, 2300", "Inclusão de PCDs no setor de saúde."),
("Empreendendo Juntos", "45.678.901/0001-23", "contato@empreendendojuntos.com.br", "11 98901-2345", "Empreendedorismo", "Rua do Empreendedor, 2400", "Promoção da diversidade e inclusão.");


INSERT INTO endereco_empresa (id_empresa, logradouro, numero, cidade, estado, cep) VALUES
(1, "Av. das Nações", "100", "São Paulo", "SP", "01000-000"),
(2, "Rua Verde", "200", "Rio de Janeiro", "RJ", "22000-000"),
(3, "Av. da Saúde", "300", "Belo Horizonte", "MG", "31000-000"),
(4, "Rua da Criatividade", "400", "Salvador", "BA", "40000-000"),
(5, "Av. dos Sabores", "500", "Curitiba", "PR", "80000-000"),
(6, "Rua do Conhecimento", "600", "Fortaleza", "CE", "60000-000"),
(7, "Av. da Inovação", "700", "Manaus", "AM", "69000-000"),
(8, "Rua da Logística", "800", "Recife", "PE", "50000-000"),
(9, "Av. do Papel", "900", "Porto Alegre", "RS", "90000-000"),
(10, "Rua das Obras", "1000", "Natal", "RN", "59000-000"),
(11, "Av. das Consultorias", "1100", "Belém", "PA", "66000-000"),
(12, "Rua do Motor", "1200", "Goiânia", "GO", "74000-000"),
(13, "Av. da Moda", "1300", "São Luís", "MA", "65000-000"),
(14, "Rua do Dinheiro", "1400", "Maceió", "AL", "57000-000"),
(15, "Av. da Aventura", "1500", "Teresina", "PI", "64000-000"),
(16, "Rua dos Pets", "1600", "Campo Grande", "MS", "79000-000"),
(17, "Av. do Café", "1700", "João Pessoa", "PB", "58000-000"),
(18, "Rua da Manutenção", "1800", "Aracaju", "SE", "49000-000"),
(19, "Av. da Criação", "1900", "Florianópolis", "SC", "88000-000"),
(20, "Rua da Mobilidade", "2000", "Vitória", "ES", "29000-000"),
(21, "Av. das Redes", "2100", "Cuiabá", "MT", "78000-000"),
(22, "Rua dos Serviços", "2200", "Rio Branco", "AC", "69900-000"),
(23, "Av. da Conexão", "2300", "Boa Vista", "RR", "69300-000"),
(24, "Rua do Empreendedor", "2400", "Palmas", "TO", "77000-000");

INSERT INTO vagas (titulo, descricao, requisitos, salario, tipo_contratacao, localizacao, id_empresa) VALUES
("Desenvolvedor Backend", "Atuar no desenvolvimento de APIs e integrações.", "Conhecimento em Node.js e bancos de dados.", 8000.00, "CLT", "São Paulo, SP", 1),
("Analista Ambiental", "Monitorar e implementar políticas de sustentabilidade.", "Formação em Biologia ou Engenharia Ambiental.", 6000.00, "CLT", "Rio de Janeiro, RJ", 2),
("Médico Generalista", "Atender pacientes em clínica geral.", "Registro no CRM e experiência em atendimento.", 15000.00, "CLT", "São Paulo, SP", 3),
("Designer de Produto", "Desenvolver produtos e experiências inovadoras.", "Experiência em design de produtos e prototipagem.", 9000.00, "CLT", "Belo Horizonte, MG", 4),
("Cozinheiro Chefe", "Responsável pela criação de pratos e gerenciamento da cozinha.", "Experiência em cozinha profissional e liderança.", 5000.00, "CLT", "Curitiba, PR", 5),
("Professor de Educação Infantil", "Ministrar aulas para crianças de 0 a 6 anos.", "Formação em Pedagogia e experiência com crianças.", 4000.00, "CLT", "Salvador, BA", 6),
("Técnico de Automação", "Realizar manutenção em sistemas de automação.", "Experiência em sistemas elétricos e automação industrial.", 4500.00, "CLT", "Fortaleza, CE", 7),
("Motorista de Caminhão", "Realizar entregas e transporte de mercadorias.", "CNH categoria E e experiência na função.", 3000.00, "CLT", "Manaus, AM", 8),
("Assistente de Recursos Humanos", "Auxiliar nas rotinas de recrutamento e seleção.", "Cursando Psicologia ou Administração.", 2500.00, "CLT", "Recife, PE", 9),
("Consultor de Vendas", "Vender produtos e serviços da empresa.", "Experiência em vendas e relacionamento com clientes.", 3500.00, "CLT", "Porto Alegre, RS", 10),
("Gerente de Operações", "Gerenciar a equipe e processos operacionais.", "Experiência em gestão de equipes e operações.", 12000.00, "CLT", "Natal, RN", 11),
("Analista de Controle de Qualidade", "Garantir a qualidade dos produtos e processos.", "Experiência em laboratório e controle de qualidade.", 5000.00, "CLT", "Goiânia, GO", 12),
("Veterinário Clínico", "Atender e tratar animais em clínica veterinária.", "CRMV ativo e experiência em clínica.", 10000.00, "CLT", "São Luís, MA", 13),
("Farmacêutico Clínico", "Orientar pacientes sobre uso de medicamentos.", "CRF ativo e experiência em farmácia.", 7000.00, "CLT", "Maceió, AL", 14),
("Psicólogo Clínico", "Realizar atendimentos psicológicos e terapias.", "CRP ativo e experiência em consultório.", 8000.00, "CLT", "Teresina, PI", 15),
("Estagiário em Marketing", "Auxiliar nas atividades de marketing digital.", "Cursando Marketing ou Comunicação.", 1500.00, "Estágio", "Campo Grande, MS", 16),
("Estagiário em Engenharia", "Apoiar a equipe de engenharia em projetos.", "Cursando Engenharia.", 1200.00, "Estágio", "João Pessoa, PB", 17),
("Auxiliar de Limpeza", "Executar serviços de limpeza e organização.", "Experiência em serviços de limpeza será um diferencial.", 1500.00, "CLT", "Aracaju, SE", 18),
("Técnico de Manutenção Predial", "Realizar manutenção predial e serviços gerais.", "Experiência em elétrica e hidráulica.", 4000.00, "CLT", "Florianópolis, SC", 19),
("Analista de Sistemas", "Desenvolver e manter sistemas de informação.", "Conhecimento em programação e análise de sistemas.", 7000.00, "CLT", "Vitória, ES", 20),
("Supervisor de Logística", "Gerenciar a logística e distribuição de produtos.", "Experiência em logística e gestão de equipes.", 9500.00, "CLT", "Cuiabá, MT", 21),
("Analista de Suporte Técnico", "Prestar suporte a clientes e resolver problemas técnicos.", "Experiência em atendimento ao cliente.", 4500.00, "CLT", "Rio Branco, AC", 22),
("Coordenador de Projetos de Construção", "Liderar projetos de construção e reformas.", "Experiência em gestão de obras.", 13000.00, "PJ", "Boa Vista, RR", 23),
("Estagiário em Design Gráfico", "Auxiliar na criação de peças gráficas e campanhas.", "Cursando Design Gráfico.", 1000.00, "Estágio", "Palmas, TO", 24),
("Gerente de Compras", "Gerenciar o setor de compras da empresa.", "Experiência em compras e negociações.", 12000.00, "CLT","Rio de Janeiro, RJ", 1);

 
 SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO candidaturas (id_usuario, id_vaga) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 1),
(32, 2),
(33, 3),
(34, 4),
(35, 5),
(36, 6),
(37, 7),
(38, 8),
(39, 9),
(40, 1);
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO feedbacks (id_usuario, id_empresa, conteudo) VALUES
(1, 1, 'Ótima empresa, com um ambiente muito acolhedor.'),
(2, 1, 'Atendimento excelente e suporte eficiente.'),
(3, 2, 'As oportunidades de crescimento são muito boas.'),
(4, 2, 'Me senti muito valorizado como funcionário.'),
(5, 3, 'A cultura da empresa é inspiradora.'),
(6, 3, 'A equipe é unida e todos se ajudam.'),
(7, 4, 'Ambiente de trabalho desafiador, mas gratificante.'),
(8, 4, 'Feedbacks constantes que ajudam no desenvolvimento.'),
(9, 5, 'Flexibilidade de horários é um grande diferencial.'),
(10, 5, 'Ótimas condições de trabalho e benefícios.'),
(11, 1, 'O processo seletivo foi muito transparente.'),
(12, 2, 'Os líderes estão sempre abertos a ouvir os colaboradores.'),
(13, 3, 'Uma empresa que realmente se preocupa com seus funcionários.'),
(14, 4, 'Tive uma ótima experiência desde o início.'),
(15, 5, 'Bom equilíbrio entre vida profissional e pessoal.'),
(16, 1, 'Sempre há espaço para sugestões e melhorias.'),
(17, 2, 'Treinamentos frequentes que ajudam no aprendizado.'),
(18, 3, 'É uma satisfação trabalhar aqui.'),
(19, 4, 'O clima organizacional é leve e colaborativo.'),
(20, 5, 'As metas são desafiadoras, mas alcançáveis.'),
(21, 1, 'As reuniões são produtivas e bem organizadas.'),
(22, 2, 'Muito aprendizado e desenvolvimento pessoal.'),
(23, 3, 'Os benefícios são atrativos e bem estruturados.'),
(24, 4, 'Sinto que posso crescer na carreira aqui.'),
(25, 5, 'Recomendo para quem busca um ambiente saudável.'),
(26, 1, 'A liderança é acessível e disposta a ajudar.'),
(27, 2, 'A empresa tem um forte compromisso com a diversidade.'),
(28, 3, 'Um ótimo lugar para aprender e evoluir.'),
(29, 4, 'Ambiente inclusivo e acolhedor.'),
(30, 5, 'As feedbacks são construtivas e ajudam a melhorar.'),
(31, 1, 'Uma empresa que valoriza a ética e a transparência.'),
(32, 2, 'Ótima comunicação entre as equipes.'),
(33, 3, 'Sinto que faço a diferença aqui.'),
(34, 4, 'A rotina de trabalho é bem dinâmica.'),
(35, 5, 'Os projetos são desafiadores e interessantes.'),
(36, 1, 'A empresa investe em tecnologia e inovação.'),
(37, 2, 'Os colegas de trabalho são super colaborativos.'),
(38, 3, 'A possibilidade de home office é um grande diferencial.'),
(39, 4, 'As atividades são bem divididas e organizadas.'),
(40, 5, 'A empresa está sempre em busca de melhorias.'),
(41, 1, 'Uma experiência muito positiva até agora.'),
(42, 2, 'O reconhecimento pelo trabalho é frequente.'),
(43, 3, 'Ambiente propício para a criatividade.'),
(44, 4, 'Valorização do funcionário é evidente.'),
(45, 5, 'A comunicação é clara e objetiva.'),
(46, 1, 'A empresa promove a saúde mental dos colaboradores.'),
(47, 2, 'Os líderes incentivam o feedback constante.'),
(48, 3, 'As tarefas são desafiadoras, mas motivadoras.'),
(49, 4, 'Estou satisfeito com as oportunidades de aprendizado.'),
(50, 5, 'Um ótimo lugar para se trabalhar!');



drop table empresas;
drop table  endereco_empresa;
drop table vagas;
drop table candidaturas;
drop table feedbacks;