import Html exposing (text)

-- Considere uma turma de 50 alunos.
-- Cada aluno possui duas notas.
-- O aluno que ficou com média maior ou igual a sete é considerado aprovado.

-- Considere as seguintes definições em Elm para os tipos Aluno e Turma:

type alias Aluno = (String, Float, Float) -- Aluno é um tipo tupla com o nome e as duas notas
type alias Turma = List Aluno             -- Turma é um tipo lista de alunos

-- O nome ou a média de um aluno pode ser obtido através das seguintes funções:

media: Aluno -> Float
media (_,n1,n2) = (n1+n2)/2     -- o nome é ignorado

nome: Aluno -> String
nome (nm,_,_) = nm              -- as notas são ignoradas

somaMedia: Float -> Float -> Float
somaMedia num1 num2 = (num1+num2)

acimaMedia: Aluno -> Bool
acimaMedia (_,n1,n2) = (((n1+n2)/2)>=7)

gabaritou: Aluno -> Bool
gabaritou (nm,n1,n2) = n1==10

notas1: Aluno -> Float
notas1 (_,n1,n2) = n1

notas2: Aluno -> Float
notas2 (_,n1,n2) = n2
-- Por fim, considere as assinaturas para as funções map, filter, e fold a seguir:

--List.map: (a->b) -> (List a) -> (List b)
  -- mapeia uma lista de a's para uma lista de b's com uma função de a para b

--List.filter: (a->Bool) -> (List a) -> (List a)
  -- filtra uma lista de a's para uma nova lista de a's com uma função de a para Bool

--List.foldl : (a->b->b) -> b -> List a -> b
  -- reduz uma lista de a's para um valor do tipo b
        -- usa um valor inicial do tipo b
        -- usa uma função de acumulacao que
            -- recebe um elemento da lista de a
            -- recebe o atual valor acumulado
            -- retorna um novo valor acumulado

-- Usando as definições acima, forneça a implementação para os três trechos marcados com <...>:

turma: Turma
turma = [ ("Joao",7,4), ("Maria",10,8), ("Brayan",10,7),("Erika",8,9),("Ricardo",5,6) ]       -- 50 alunos

-- a) LISTA COM AS MÉDIAS DOS ALUNOS DE "turma" ([5.5, 9, ...])
medias: List Float
medias = List.map media turma

-- b) LISTA COM OS NOMES DOS ALUNOS DE "turma" APROVADOS (["Maria", ...])
mediaSete = List.filter acimaMedia turma

aprovados: List String
aprovados = List.map nome mediaSete

--c) MÉDIA FINAL DOS ALUNOS DE "turma" (média de todas as médias)
total: Float
total = (List.foldl somaMedia 0 medias)/5

--d) LISTA DE ALUNOS QUE GABARITARAM A P1 ([("Maria",10,8), ...])
--notaDez = List.filter gabaritou turma

turma_dez_p1: Turma
turma_dez_p1 = List.filter gabaritou turma

-- e) LISTA COM OS NOMES E MEDIAS DOS ALUNOS APROVADOS ([("Maria",9), ...])
--aprovados2: List (String,Float)
--aprovados2 = 

-- f) LISTA COM TODAS AS NOTAS DE TODAS AS PROVAS ([7,4,10,8,...])
--notas: List Float
--notas = List.map notas1 turma

-- É permitido usar funções auxiliares, mas não é necessário.
-- (As soluções são pequenas.)

--main = text (toString medias)
--main = text (toString aprovados)
--main = text (toString total)
--main = text (toString turma_dez_p1)
main = text (toString aprovados2)
