require 'spec_helper'

describe "DotGrid::Page::Grid" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::Grid.new({}) }

    it "calculates the number of rows" do
      allow(subject).to receive(:page_height).and_return(22)
      allow(subject).to receive(:spacing).and_return(5)
      expect(subject.page_rows).to eq(4)
    end

    it "calculates the number of columns" do
      allow(subject).to receive(:page_width).and_return(44)
      allow(subject).to receive(:spacing).and_return(6)
      expect(subject.page_columns).to eq(7)
    end
  end

  describe "#generate" do
    let(:grid_color) { 'aabbcc' }
    let(:subject) { DotGrid::Page::Grid.new({ :grid_color => grid_color}) }
    let(:pdf) { double('pdf') }

    before do
      allow(subject).to receive(:pdf).and_return(pdf)
      allow(pdf).to receive(:start_new_page)
      allow(pdf).to receive(:stroke_color)
      allow(pdf).to receive(:stroke_horizontal_line)
      allow(pdf).to receive(:stroke_vertical_line)
      allow(subject).to receive(:page_width).and_return(42)
      allow(subject).to receive(:page_rows).and_return(44)
      allow(subject).to receive(:page_height).and_return(84)
      allow(subject).to receive(:page_columns).and_return(88)
    end

    it "calculates the number of rows" do
      expect(subject).to receive(:page_rows)
      subject.generate
    end

    it "sets the color for the grid" do
      expect(pdf).to receive(:stroke_color).with(grid_color)
      subject.generate
    end

    it "draws the 1 more than the number of rows lines" do
      allow(subject).to receive(:page_rows).and_return(4)
      expect(pdf).to receive(:stroke_horizontal_line).exactly(5).times
      subject.generate
    end
  end
end
