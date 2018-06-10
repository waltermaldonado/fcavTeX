#!/bin/bash

echo
echo -----------------------------------------------------
echo fcavTeX BUILDER SCRIPT
echo https://github.com/waltermaldonado/fcavTeX
echo build compressed files
echo -----------------------------------------------------

VERSAO=""
ZIP_DOC=""
ZIP_TDS=""
ZIP_CTAN="target/fcavtex.zip"
TAR_FILE=""

# compile LaTeX
# $1 main latex file without extension
function compileLaTeX(){
#        pdflatex -interaction=nonstopmode $1
#        bibtex $1
#        makeindex $1.idx
#        makeindex $1.nlo -s nomencl.ist -o $1.nls
#       makeglossaries $1
#        pdflatex -interaction=nonstopmode $1
#        pdflatex -interaction=nonstopmode $1
        latexmk -pdf -time -silent $1
}

# initialize directories
function initialize(){
       
        # initializing: create clean directories
        rm -rf target

        # creating directories for CTAN zip
        mkdir -p target/fcavtex/
       
        # copying all abntex2source files
        mkdir -p target/fcavtexsource/
        cp -rf doc/manual doc/examples tex README target/fcavtexsource/
       
        # creating doc directory (only documentation, without examples)
        # mkdir -p target/doc/examples
}

# generate LaTeXFiles
function buildPdf(){

    echo "Building PDF files with pdflatex"

    echo "copying fcavTeX files to doc files"

        cp -rf target/fcavtexsource/tex/* target/fcavtexsource/examples/

    
    echo "Compiling manual"
        cd target/fcavtexsource/manual/
        compileLaTeX fcavtex

    echo "Compiling examples"   
    echo "Compiling example basico-principal"
        cd ../examples/
        compileLaTeX basico-principal
    
    echo "removing fcavTeX files from doc files"
        cd ../../../
        rm -rf target/fcavtexsource/manual/*.cls
        rm -rf target/fcavtexsource/manual/*.sty
        rm -rf target/fcavtexsource/manual/*.bst
        rm -rf target/fcavtexsource/examples/*.cls
        rm -rf target/fcavtexsource/examples/*.sty
        rm -rf target/fcavtexsource/examples/*.bst
}

# change permissions of folders and files
function changepermissions(){
        find target/fcavtexsource/ -type d -exec chmod 755 {} \;        
        find target/fcavtexsource/ -type f -exec chmod 644 {} \;
}

# generate compressed files
function buildCompressed(){
       
        echo "$ZIP_CTAN (tex and doc browsable content + abntex2-tds.zip + README):"
        cp -rf target/fcavtexsource/tex/* target/fcavtex
        mv target/fcavtexsource/README target/fcavtex/README
        mv target/fcavtexsource/manual target/fcavtex/manual
        mv target/fcavtexsource/examples target/fcavtex/examples
        cd target
        zip -r ../$ZIP_CTAN fcavtex -i *README \*.tex \*.pdf \*.bib \*.bst \*.cls \*.sty \*.jpg
        cd ..

}

# clean temp files
function clean() {
        rm -rf target/fcavtex
        rm -rf target/doc
        rm -rf target/fcavtexsource
        rm -rf target/fcavtex.tds.zip
}

# replace version number in all files with <VERSION> string
function replaceVersion(){
        find target/fcavtexsource \( -name *.sty -or -name *.cls -or -name *.tex -or -name README -or -name *.bst \) | xargs sed -i -e "s/<VERSION>/$VERSAO/g"  
}

# build compressed files
function buildAll(){

        # setting versions numbers
        echo
        echo Building compressed files version: $VERSAO
        echo

        # setting names
        ZIP_DOC=target/fcavtex-doc$VERSAO.zip
        ZIP_TDS=target/fcavtex.tds$VERSAO.zip
        TAR_FILE=target/fcavtex.tds$VERSAO.tar.gz

        # initializing files
        initialize
       
        # update version number in files
        replaceVersion
       
        # compile latex
        buildPdf
        
        # change permissions of folders and files in the target directory
        changepermissions
       
        # building compressed files
        buildCompressed
       
        # clean temp files
        clean
}

# ending information after build
function printEndingInformation(){
        echo --------------------------------------------------
        echo Done! The following files were generated:
        echo
        echo $ZIP_CTAN
        echo
        echo --------------------------------------------------
}

# usage information
function printUsage(){
        echo
        echo "Usage: ./build.sh ([version]) | [--help]"
        echo
        echo "  version  : Build compressed file with version number"
        echo "  --help   : Show this help message"
        echo
}


# MAIN

if test -z "$1"
then
        printUsage
        buildAll
        printEndingInformation
else
        if [ $1 == "--help" ] ; then
                printUsage
        else
                VERSAO="-$1"
                buildAll
               
                printEndingInformation
        fi
fi




# ending...