[![Build Status](https://travis-ci.org/slabounty/dot_grid.svg?branch=master)](https://travis-ci.org/slabounty/dot_grid)
[![Coverage Status](https://coveralls.io/repos/slabounty/dot_grid/badge.png?branch=master)](https://coveralls.io/r/slabounty/dot_grid?branch=master)
[![Code Climate](https://codeclimate.com/github/slabounty/dot_grid.png)](https://codeclimate.com/github/slabounty/dot_grid)
[![Dependency Status](https://gemnasium.com/slabounty/dot_grid.svg)](https://gemnasium.com/slabounty/dot_grid)

# DotGrid: dot grid planning pages

A simple ruby file for generating dot grid graph paper.


## Installation
    gem install dot_grid

## CLI

### A basic dot grid page can be generated like this ...
    dot_grid -f dot_grid.pdf --page-types dot_grid --spacing 5 --grid-color CFBAEC --dot-weight 0.5 -m 0.0

### A basic planning page can be generated like this ...
    dot_grid -f planner_w5_c2dfff.pdf  --page-types planner --grid-color CFBAEC --dot-weight 0.5 -m 0.0 --planner-color-1 dddddd --planner-color-2 C2DFFF

### A regular grid page
    dot_grid -f grid_c2dfff.pdf --page-types grid  --spacing 5 --grid-color CFBAEC --margin 0.0

### A grid + lines page
    dot_grid -f grid_plus_lines_c2dfff.pdf --page-types grid_plus_lines  --spacing 5 --grid-color CFBAEC --margin 0.0

### A horizontal rule page
    dot_grid -f horizontal_rule_c2dfff.pdf --page-types horizontal_rule  --spacing 5 --grid-color CFBAEC --margin 0.0

### A checkerboard page
    dot_grid -f checkerboard_c2dfff.pdf --page-types checkerboard  --spacing 5 --grid-color CFBAEC --margin 0.0

### Multiple page types (either with no spaces after commas or in quotes).
    dot_grid -f page_types.pdf --page-types "planner, checkerboard, grid, dot_grid"  --spacing 5 --grid-color CFBAEC --margin 0.0

### A basic dot dash page can be generated like this ...
    dot_grid -f dot_dash.pdf --page-types dot_dash --spacing 5 --grid-color CFBAEC --dot-weight 0.5 -m 0.0

### A basic line printer page can be generated like this ...
    dot_grid -f line_printer.pdf --page-types line_printer --spacing 15 --grid-color dddddd --planner-color-1 d7e7dd --dot-weight 5.0 -m 0.0 --page-size 14x11in

### All of the pages at once ...
    dot_grid -f page_types.pdf --page-types "planner, checkerboard, grid, dot_grid, horizontal_rule, grid_plus_lines, dot_dash" --spacing 5 --grid-color CFBAEC -m 0.0

### To get help on the command and its options ...
    dot_grid --help

### The options and their defaults are ...

<table>
<thead>
<tr>
<th>Long Option</th><th>Short Option</th><th>Default</th>
</tr>
</thead>
<tbody>
<tr><td>file-name</td><td>-f</td><td>dotgrid.pdf</td></tr>
<tr><td>page-types</td><td>-p</td><td>Types of pages desired: planner, checkerboard, grid, dot_grid, horizontal_rule, grid_plus_lines (default: planner)</td></tr>
<tr><td>dot-weight</td><td>-d</td><td>1.5</td></tr>
<tr><td>margin</td><td>-m</td><td>0.5</td></tr>
<tr><td>page-size</td><td>-a</td><td>LETTER</td></tr>
<tr><td>grid-color</td><td>-g</td><td>B3B3B3</td></tr>
<tr><td>spacing</td><td>-s</td><td>5</td></tr>
<tr><td>planner-color-1</td><td>-l</td><td>CCCCCC</td></tr>
<tr><td>planner-color-2</td><td>-n</td><td>0099FF</td></tr>
</tbody>
</table>

## Acknowledgements

The planner page is based on the Frictionless planning pad
(https://squareup.com/market/frictionless) 

The grid plus lines is similar to the Doane Paper grid + lines paper
(http://doanepaper.bigcartel.com/products)
