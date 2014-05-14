#!ruby

require 'rubygems'
require 'bundler/setup'

# require your gems as usual 
require 'require_all'
require 'trollop'
#require_relative 'lib/dot_grid_generator'
require_all 'lib'

opts = Trollop::options do
  opt :file_name, "File Name", :type => :string, :default => "dotgrid.pdf"
  opt :grid, "Add a Grid Page", default: true
  opt :dot_weight, "Dot Weight", :type => :float, :default => 1.5
  opt :margin, "Border", :type => :float, :default => 0.5
  opt :page_size, "Page Size (LEGAL, LETTER)", :type => :string, :default => "LETTER"
  opt :grid_color, "Grid Color (RGB)", :type => :string, :default => "B3B3B3"
  opt :spacing, "Dot Spacing (mm)", :type => :integer, :default => 5
  opt :pages, "Number of pages", :type => :integer, :default => 1
  opt :planner, "Add a Planner Page"
  opt :planner_color_1, "Planner Left and Footer color", type: :string, default: "CCCCCC"
  opt :planner_color_2, "Planner Right color", type: :string, default: "0099ff"
end

dot_grid_generator = DotGridGenerator.new(opts).generate
