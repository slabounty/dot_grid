require 'trollop'

module DotGrid
  class CLI
    def self.execute(argv)

      opts = Trollop::options argv do
        version "dot_grid #{DotGrid::VERSION}"
        opt :file_name, "File Name", :type => :string, :default => "dotgrid.pdf"
        opt :orientation, "Orientation of pages (portrait/landscape)", type: :string, default: "portrait"
        opt :page_types, "Types of pages desired: Types of pages desired: planner, checkerboard, grid, dot_grid, horizontal_rule, grid_plus_lines", type: :string, default: "planner"
        opt :dot_weight, "Dot Weight", :type => :float, :default => 1.5
        opt :margin, "Border", :type => :float, :default => 0.0
        opt :page_size, "Page Size (LEGAL, LETTER)", :type => :string, :default => "LETTER"
        opt :grid_color, "Grid Color (RGB)", :type => :string, :default => "B3B3B3"
        opt :spacing, "Dot Spacing (mm)", :type => :integer, :default => 5
        opt :planner_color_1, "Planner Left and Footer color", type: :string, default: "CCCCCC"
        opt :planner_color_2, "Planner Right color", type: :string, default: "0099ff"
      end

      DotGrid::Generator.new(opts).generate
    end
  end
end
