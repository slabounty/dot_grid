#!ruby

require 'rubygems' 
require 'bundler/setup'  
# require your gems as usual 
require 'trollop'
require 'prawn'
require "prawn/measurement_extensions"

opts = Trollop::options do
  opt :file_name, "File Name", :type => :string, :default => "dotgrid.pdf"
  opt :dot_weight, "Dot Weight", :type => :float, :default => 1.5
  opt :margin, "Border", :type => :float, :default => 0.5
  opt :page_size, "Page Size (LEGAL, LETTER)", :type => :string, :default => "LETTER"
  opt :grid_color, "Grid Color (RGB)", :type => :string, :default => "B3B3B3"
  opt :spacing, "Dot Spacing (mm)", :type => :integer, :default => 5
  opt :pages, "Number of pages", :type => :integer, :default => 1
end

Prawn::Document.generate(opts[:file_name], margin: opts[:margin], page_size: opts[:page_size]) do |pdf|
  pages = opts[:pages]
  spacing = opts[:spacing].mm
  num_columns = (pdf.bounds.width / spacing).floor
  num_rows = (pdf.bounds.height / spacing).floor
  pdf.fill_color opts[:grid_color]
  (1..pages).each do |page|
    (0..num_rows).each do |row|
      (0..num_columns).each do |col|
        pdf.fill_circle [col*spacing, row*spacing], opts[:dot_weight]
      end
    end
    pdf.start_new_page unless page == pages
  end
end
