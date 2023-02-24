CREATE TABLE disciplinas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    descricao TEXT
);

CREATE TABLE professores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INTEGER NOT NULL,
);

CREATE TABLE professores_disciplinas (
    id SERIAL PRIMARY KEY,
    professor_id INTEGER NOT NULL,
    disciplina_id INTEGER NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professores(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);


CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INTEGER NOT NULL,
    data_nascimento DATE NOT NULL,
    especialidade VARCHAR(50)
);
