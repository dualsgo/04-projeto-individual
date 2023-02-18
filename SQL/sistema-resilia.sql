
CREATE TABLE `Curso` (
    `nome_curso` VARCHAR(255),
    `Turno` VARCHAR(255),
    `data_inicio` INT,
    `data_termino` INT
);

CREATE TABLE `Turmas` (
    `Facilitadores` VARCHAR(255),
    `Turno` VARCHAR(255),
    `Alunos` VARCHAR(255)
);
CREATE TABLE `Facilitadores` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `data_nascimento` INT
);

CREATE TABLE `Alunos` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(255),
    `data_nascimento` INT,
    `endereco` VARCHAR(255)
);

ALTER TABLE `Turmas` ADD FOREIGN KEY (`Turno`) REFERENCES `Curso` (`Turno`);

ALTER TABLE `Turmas` ADD FOREIGN KEY (`Alunos`) REFERENCES `Alunos` (`id`);

ALTER TABLE `Turmas` ADD FOREIGN KEY (`Facilitadores`) REFERENCES `Facilitadores` (`nome`);