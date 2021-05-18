# Projeto de Desenvolvimento de processador MIPS de 8 bits
<p align="center">
<img src="https://github.com/MatheusOrange211/AOC_Matheus_Kevin_UFRR_2020/blob/main/logo-processador.png">
</p>


## Autores do Projeto 🤝
* [**Matheus Naranjo Corrêa**](https://github.com/MatheusOrange211)
* [**Kevin Willyn Conceição Barros**](https://github.com/KvWIlY) 
---
## Sobre 📚
Projeto de conclusão de semestre referente a matéria de **Arquitetura e Organização de Computadores**, ofertada no 3° Semestre do curso de **Ciências da Computação**, ministrada por Hebert Oliveira, na **Universidade Federal de Roraima - UFRR**.

O objetivo é desenvolver um processador MIPS de 8 bits, levando em conta as limitações existentes pela pequena quantidade de bits dentre outros.

A organização dos diretórios é a seguinte e cada um possui as seguintes informações:
* **COMPONENTS** : diretórios contendo os arquivos de extensão `.vhd` utilizados para desenvolvimento do processador;
* **DATAPATH** : diretório contendo arquivo visual da organização dos componentes;
* **RELATÓRIO**: contém arquivo explicando o funcionamento e resultado de testes do projeto.

---
## Ferramentas Utilizadas ⚙
### Intel Quartus
<p align='center'>
<img src="https://www.jackenhack.com/wp-content/uploads/2020/01/Quartus_prime_icon.png">
</p>

> Intel Quartus Prime é um software de design de dispositivo lógico programável produzido pela Intel; antes da aquisição da Altera pela Intel, a ferramenta era chamada Altera Quartus Prime, anteriormente Altera Quartus II. (fonte: [Wikipedia](https://en.wikipedia.org/wiki/Intel_Quartus_Prime))

## Códigos de exemplo

* Teste de Fatorial
> Abaixo você pode visualizar o código que foi usado no arquivo de memória ROM para gerar o teste de **Fatorial** no nosso processador. Os comentários ilustram melhor o comportamento de cada instrução.
```
    -- Fatorial que vai até 120 (depois estoura a memoria)
    0 => "10001111", -- li S3 3
    1 => "00011111", -- addi S3 3 == 6
    2 => "10001001", -- li S2 1
    3 => "10000001", -- li S0 1
    4 => "01000010", -- mul S0 S2
    5 => "10111011", -- if S2 == S3
    6 => "00011001", -- addi S2 1
    7 => "10100100", -- bne S2 != S3 jump 0100
    8 => "10000000", -- li S0 0
    9 => "10000100", -- li S1 0
    10=> "10001000", -- li S2 0
	 OTHERS => "00000000"

```

* Teste de Fibonacci
> O código abaixo demonstra a sequência de fibonacci.
```
	 --Sequencia de Fibonacci que pega 9 primeiros numeros
	 0 =>  "10001111", --li S3 3
	 1 =>  "01001111", --mul S3 S3
	 2 =>  "00011101", --addi S3 1
	 3 =>  "00011110", --addi S3 2
	 4 =>  "00011110", --addi S3 2
	 5 =>  "10001000", --li S2 0
	 6 =>  "10000000", --li S0 0
	 7 =>  "01100000", --sw S0 RAM(00)
	 8 =>  "10000001", --li S0 1
	 9 =>  "01100001", --sw S0 RAM(01)
	 10 => "01010000", --lw S0 RAM(00)
	 11 => "00000100", --add S1 S0
	 12 => "01010001", --lw S0 RAM(01)
	 13 => "00000100", --add S1 S0
	 14 => "01100000", --sw S0 RAM(00)
	 15 => "01100101", --sw S1 RAM(01)
	 16 => "00011001", --addi S2 1
	 17 => "10111011", --if S2 S3
	 18 => "10101010", -- bne 1010
	 OTHERS => "00000000"
```	 
---
## Fontes Bibliográficas 📚

<p>
<img align="left" width="200" height="270" src="https://lojasaraiva.vteximg.com.br/arquivos/ids/5850674/1007021321.jpg?v=637064175427000000"><br>
<b> Livro</b>: <i>Arquitetura e Organização de Computadores - 8° Edição</i> <br>
<b> Autor</b>: <b>William Stallings</b> <br>
 <b>Disponível em</b>: <a href="http://www.telecom.uff.br/orgarqcomp/arq/arquitetura-e-organizacao-computadores-8a.pdf">Link</a>
</p>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<p>
<img align="left" width="200" height="270" src="https://images-na.ssl-images-amazon.com/images/I/8118crB0kyL.jpg"><br>
<b> Livro</b>: <i>Organização e Projeto de Computadores - 4° Edição</i> <br>
<b> Autor</b>: <b>David A. Patterson</b> e <b>John L. Hennessy</b> <br>
 <b>Disponível em</b>: <a href=https://www.academia.edu/29853525/Arquitetura_de_Computadores_Uma_Abordagem_Quantitativa_David_A_Patterson_e_John_L_Hennessy">Link</a>
</p>
