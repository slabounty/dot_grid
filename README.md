[![Build Status](https://travis-ci.org/slabounty/dot_grid.svg?branch=master)](https://travis-ci.org/slabounty/dot_grid)
[![Coverage Status](https://coveralls.io/repos/slabounty/dot_grid/badge.png?branch=master)](https://coveralls.io/r/slabounty/dot_grid?branch=master)
[![Code Climate](https://codeclimate.com/github/slabounty/dot_grid.png)](https://codeclimate.com/github/slabounty/dot_grid)

# DotGrid: dot grid planning pages

A simple ruby file for generating dot grid graph paper.


## Installation
    gem install dot_grid

## CLI

A basic dot grid page can be generated like this ...

    bin/dotgrid -f dotgrid.pdf --grid-color CFBAEC --dot-weight 0.5 -m 0.0

A basic planning page can be generated like this ...

    bin/dotgrid -f dotgrid_w5_c2dfff_no_grid.pdf --no-grid --grid-color CFBAEC --dot-weight 0.5 -m 0.0 --planner --planner-color-1 dddddd --planner-color-2 C2DFFF

To get help on the command and its options ...
    bin/dotgrid --help


The options and their defaults are ...

<table>
<thead>
<tr>
<th>Long Option</th><th>Short Option</th><th>Default</th>
</tr>
</thead>
<tbody>
<tr><td>file-name</td><td>-f</td><td>dotgrid.pdf</td></tr>
<tr><td>grid</td><td>-g</td><td>true</td></tr>
<tr><td>dot-weight</td><td>-d</td><td>1.5</td></tr>
<tr><td>margin</td><td>-m</td><td>0.5</td></tr>
<tr><td>page-size</td><td>-p</td><td>LETTER</td></tr>
<tr><td>grid-color</td><td>-r</td><td>B3B3B3</td></tr>
<tr><td>spacing</td><td>-s</td><td>5</td></tr>
<tr><td>pages</td><td>-a</td><td>1</td></tr>
<tr><td>planner</td><td>-l</td><td>false</td></tr>
<tr><td>planner-color-1</td><td>-n</td><td>CCCCCC</td></tr>
<tr><td>planner-color-2</td><td>-e</td><td>0099FF</td></tr>
</tbody>
</table>

## Examples
