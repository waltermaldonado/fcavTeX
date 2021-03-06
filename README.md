# fcavTeX

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1286606.svg)](https://doi.org/10.5281/zenodo.1286606)

A **fcavTeX** é uma classe LaTeX criada para atender às [normas para elaboração de dissertações e teses](http://www.fcav.unesp.br/Home/posgraduacao/normas_disss_tese.pdf) da Faculdade de Ciências Agrárias e Veterinárias de Jaboticabal - UNESP. 

É desenvolvida com base na tradicional classe [memoir](https://www.ctan.org/pkg/memoir) e em modificações da classe [abntex2](https://github.com/abntex/abntex2), de Lauro César Araujo. Contém uma classe para a formatação automática do documento, pacotes de citação e de formatação de estilos bibliográficos. Basta preparar um banco de dados com suas citações (BiBTeX) utilizando, por exemplo, o [Zotero](http://www.zotero.org/) e elaborar um arquivo .tex somente com o conteúdo de seu trabalho, sem precisar se preocupar com formatação alguma!

### Não sabe o que é LaTeX? ###

Consulte a página do pacote abnTeX2: [Por Onde Começar?](https://github.com/abntex/abntex2/wiki/PorOndeComecar)

Você pode utilizar os arquivos deste repositório em um serviço online como o [Overleaf](https://www.overleaf.com) ou o [shareLaTeX](https://pt.sharelatex.com/), que não necessitam que seja feita uma instalação em seu computador. Se desejar, você pode compilar os arquivos localmente, procedendo a instalação de uma distribuição LaTeX:

  * [MiKTeX](http://www.miktex.org/) ou [proTeXt](http://www.tug.org/protext/) para Windows;
  * [TeX Live 2013/2014](http://www.tug.org/texlive/) para Windows e Linux;
  * [MacTeX 2013/2014](http://tug.org/mactex/) para Mac;

Sugestões de cursos/tutoriais

  * [Introdução ao LaTeX](http://www.lcmaquino.org/category/introducao-ao-latex/), de Luiz Cláudio Mesquita de Aquino

### Overleaf ###

Disponibilizei um modelo (template) pronto, basta trocar os campos com os dados da sua tese e ela será gerada automaticamente. Confiram:
  
  * [Modelo pronto de Tese - Overleaf](https://www.overleaf.com/latex/templates/univeresidade-estadual-paulista-unesp-thesis-template/tgggvvxccvqv)

### shareLaTeX ###

Há também um exemplo em funcionamento no site do [shareLaTeX](https://pt.sharelatex.com/). O projeto não pode ser editado, mas você pode criar a sua conta e utilizá-lo como referência para o seu trabalho. Basta manter os arquivos *fcavtex.cls* e *fcavtex.bst* na mesma pasta dos seus arquivos .tex.

  * [Projeto exemplo](https://pt.sharelatex.com/project/558eb0eed8509a876d9e2e51)