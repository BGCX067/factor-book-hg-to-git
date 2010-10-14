###########################################################################
# Copyright (c) 2010 Minh Van Nguyen <nguyenminh2@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# http://www.gnu.org/licenses/
###########################################################################

# Make sure that the following commands are in your PATH variable:
# latex, dvips, ps2pdf, rm

# change "template" to the name of your master .tex file
FILE = book
TEX_MASTER = $(FILE).tex

all:
	make latex
	makeindex $(FILE)
	make latex
	make clean

latex:
	(TEXINPUTS=.:style:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex $(TEX_MASTER))
	(TEXINPUTS=.:style:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex $(TEX_MASTER))

clean:
	rm -rfv *#
	rm -rfv *~
	rm -rfv *.aux
	rm -rfv *.bak
	rm -rfv tex/*.bak
	rm -rfv *.bbl
	rm -rfv *.blg
	rm -rfv *.dvi
	rm -rfv *.idx
	rm -rfv *.ilg
	rm -rfv *.ind
	rm -rfv *.loa
	rm -rfv *.lof
	rm -rfv *.log
	rm -rfv *.lot
	rm -rfv *.out
	rm -rfv *.ps
	rm -rfv *.toc
