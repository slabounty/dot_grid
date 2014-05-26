[![Build Status](https://travis-ci.org/slabounty/dot_grid.svg?branch=master)](https://travis-ci.org/slabounty/dot_grid)
[![Coverage Status](https://coveralls.io/repos/slabounty/dot_grid/badge.png?branch=master)](https://coveralls.io/r/slabounty/dot_grid?branch=master)

# DotGrid: dot grid planning pages

A simple ruby file for generating dot grid graph paper.


## Installation
    gem install dot_grid

## CLI

A basic dot grid page can be generated like this ...

    bin/dotgrid -f dotgrid.pdf --grid-color CFBAEC --dot-weight 0.5 -m 0.0

A basic planning page can be generated like this ...

    bin/dotgrid -f dotgrid_w5_c2dfff_no_grid.pdf --no-grid --grid-color CFBAEC --dot-weight 0.5 -m 0.0 --planner --planner-color-1 dddddd --planner-color-2 C2DFFF

The options and their defaults are ...

<table>
<thead>
<tr>
<th>Option</th> <th>Default</th>
</tr>
</thead>
<tbody>
<tr><td>file_name</td><td>dotgrid.pdf</td></tr>
<tr><td>grid</td><td>true</td></tr>
<tr><td>dot_weight</td><td>1.5</td></tr>
<tr><td>margin</td><td>0.5</td></tr>
<tr><td>page_size</td><td>LETTER</td></tr>
<tr><td>grid_color</td><td>B3B3B3</td></tr>
<tr><td>spacing</td><td>5</td></tr>
<tr><td>pages</td><td>1</td></tr>
<tr><td>planner</td><td>false</td></tr>
<tr><td>planner_color_1</td><td>CCCCCC</td></tr>
<tr><td>planner_color_2</td><td>0099FF</td></tr>
</tbody>
</table>

## Examples
