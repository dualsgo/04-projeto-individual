# PROJETO INDIVIDUAL Módulo 4 – Sistema Resilia
### Contexto
A Resilia está pensando em lançar um novo sistema de acompanhamento e para isso precisa de ajuda para modelar um banco de dados que vai armazenar seus cursos, turmas e alunos.

### O que é para fazer?
Para apoiar nesse sistema recebemos a tarefa de realizar essa modelagem e responder algumas perguntas com nosso modelo:

 - Existem outras entidades além dessas três?
 
 Foi adicionada a entidade Facilitadores.

- Quais são os principais campos e tipos?

 Os principais campos são Turma, Turno, Facilitadores e Alunos. O tipo predominante e varchar.

- Como essas entidades estão relacionadas?

 Cada turma possui um facilitador e um certo número de alunos. Os alunos só podem estar em uma turma e em um turno. Isso varia mas os facilitadores podem estar em duas turmas em turnos diferentes. A organização é feita utilizando chaves estrangeiras (FK)


Vamos tentar pensar em 2 registros para cada entidade para checar o preenchimento das informações no nosso modelo.4

### O que devo entregar? 

A entrega deve ser realizada em um repositório do Github com um print do modelo proposto e um arquivo README respondendo as perguntas anteriores e apontando para os detalhes da modelagem proposta.


<img src="./assets/sistema-resilia.png">
