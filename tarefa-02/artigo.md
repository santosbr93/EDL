# Introdução

Ruby é uma linguagem simples e prática, foi criada com o intuito de ser uma linguagem de script mais poderosa que o Perl e com uma estrutura ainda mais orientada a objetos comparada ao Python. 

Muito popular no desenvolvimento web por conta do framework Ruby on Rails, se encontra em 12º lugar no ranking das linguagens mais populares.

# Origens e Influências
Influenciada pelas linguagens Perl, Smalltalk, Eiffel, Ada e Lisp, Ruby foi criada por Yukihiro Matsumoto em 24 de fevereiro de 1993. Yukihiro não encontrava-se satisfeito com as linguagens que dominava então decidiu desenvolver uma nova que equilibrasse os conceitos de programação funcional e imperativa.

Apesar de começar a se tornar conhecida no Japão, Ruby não tinha notoriedade fora do país. Em 1998 com o intuito de reverter esta situação, foi criada a primeira lista de e-mail em inglês da linguagem, chamado Ruby-talk. A partir deste momento, Ruby começou a se expandir fora do Japão.

Em 2000, foi lançado o primeiro livro em inglês da linguagem chamado Programming Ruby, sendo mais tarde, lançado gratuitamente para o público. 

Em 2005, surgiu um novo framework escrito na linguagem, o chamado Ruby on Rails. Utilizado para desenvolvimento WEB é reconhecido pelo rapidez e praticidade durante o desenvolvimento.  A crescente popularidade deste framework ajudou com que a linguagem Ruby fosse cada vez mais utilizada, a tornando bastante reconhecida.

# Classificação
Ruby é uma linguagem interpretada multiparadigma, ou seja, ela suporte mais de um paradigma de programação, além disso possui tipagem forte e dinâmica. 

Uma de suas características é que todas as suas variáveis são tradas como objetos
Possui sintaxe simples inspirada por Eiffel e Ada e seus conceitos de orientação e objeto vieram do Smalltalk. 

# Avaliação Comparativa
Apesar de não ser tão rapidamente executada quando comparada a outras linguagens, Ruby compensa na agilidade com qual o programador consegue produzir programas funcionais com apenas algumas linhas de código.

## Exemplos de códigos

### Uso do for each

Ruby

```
array = ['a','b','c','d','e','f','g']
array2 = [1,2,3,4,5]
array.each do |i|
  puts i
end
array.each do |j|
  puts j
end
```
C

```
#include <stdio.h>
#include <stdlib.h>
#define foreach( ptrvar, strvar) char* ptrvar; for(ptrvar = strvar; (*ptrvar) != '\0'; *ptrvar++)

int main(int argc, char* argv[]){

	char* array1 = "abcdefg";
	char* array2 = "123456789";
	foreach(p1,array1){
	printf("%c\n", *p1);
        }
	foreach(p2, array2){
	printf("%c\n", *p2);
	}
}
```
### Imprimindo um array

Ruby

```
numeros = Array[1,2,3,4,5]
puts "#{numeros}"
```
Python

```
#include <stdio.h>

int main()
{
  int numeros[5] = {1,2,3,4,5};
  int i;
  for(i=0;i<5;i++){
    printf("%d", numeros[i]);
  }
}
```

### Função como variável

Em ruby ao utilizarmos um metodo sem a utilização de parentêses, ele chamará o mesmo sem nenhum parâmetro, invalidando o código abaixo:

Ruby

```
def ad(a,b)
  return a+b
end

def process_number(a,b,func)
  return func(a,b)
end

process_number(5,6,ad)
```

Já ao realizarmos a mesma ação em Python, o metodo irá se comportar como um objeto, permitindo que a funcção retorne um valor.

Python

```
def ad(a,b):
  return a+b

def process_number(a,b,func):
  return func(a,b)

process_number(5,6,ad)
```
# Conclusão
Como o próprio criado disse, Ruby foi desenvolvido para que os programadores pudesem se concentrar da diversão e na criatividade.

Seu uso é indicado quando há necessidade do tempo de desenvolvimento e maior do que o tempo de resposta.

# Bibliografia

* https://pt.wikipedia.org/wiki/Ruby_(linguagem_de_programa%C3%A7%C3%A3o)
* https://www.sitepoint.com/history-ruby/
* https://www.ruby-lang.org/en/community/mailing-lists/
* https://www.ruby-lang.org/pt/about/
* http://www.curiousvilla.com/top-most-popular-computer-coding-languages-in-the-world-history/Ruby-Language.php
* https://pt.wikipedia.org/wiki/Yukihiro_Matsumoto
* http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
