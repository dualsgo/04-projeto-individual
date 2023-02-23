
Table "Curso" {
  "nome_curso" VARCHAR(255)
  "Turno" VARCHAR(255)
  "data_inicio" INT
  "data_termino" INT
}

Table "Turmas" {
  "Facilitadores" VARCHAR(255)
  "Turno" VARCHAR(255)
  "Alunos" VARCHAR(255)
}

Table "Facilitadores" {
  "nome" VARCHAR(255)
}

Table "Alunos" {
  "nome" VARCHAR(255)
  "data_nascimento" INT
  "endereco" VARCHAR(255)
}
Table "Endereco" {
  "cep" VARCHAR(255)
  "rua" VARCHAR(255)
  "bairro" VARCHAR(255)
  "UF" INT [pk]

}

Ref:"Curso"."Turno" < "Turmas"."Turno"
Ref:"Curso"."nome_curso" < "Turmas"."Facilitadores"

Ref:"Alunos"."nome" < "Turmas"."Alunos"

Ref:"Facilitadores"."nome" < "Turmas"."Facilitadores"
Ref:"Facilitadores"."nome" < "Curso"."nome_curso"


Ref:"Alunos"."endereco" < "Endereco"."cep"
