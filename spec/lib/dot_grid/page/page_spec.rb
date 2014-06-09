require 'spec_helper'

describe "DotGrid::Page::Page" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::Page.new({}) }

    it "has a default dot weight" do
      expect(subject.dot_weight).to eq(1.5)
    end

    it "has a default grid color" do
      expect(subject.grid_color).to eq("B3B3B3")
    end

    it "has a default spacing" do
      expect(subject.spacing).to eq(5.mm)
    end
  end

  describe "#page_width" do
    let(:pdf) { double('pdf', bounds: double(:width => 42)) }
    let(:subject) { DotGrid::Page::Page.new({:pdf => pdf}) }

    it "uses the pdf to calculate the page width" do
      expect(subject.page_width).to eq(42)
    end
  end

  describe "#page_height" do
    let(:pdf) { double('pdf', bounds: double(:height => 22)) }
    let(:subject) { DotGrid::Page::Page.new({:pdf => pdf}) }

    it "uses the pdf to calculate the page height" do
      expect(subject.page_height).to eq(22)
    end
  end

  describe "#draw_dot_grid" do
    let(:pdf) { double('pdf', bounds: double(:height => 22)) }
    let(:subject) { DotGrid::Page::Page.new({:pdf => pdf, :grid_color => "CCDDEE"}) }

    it "sets the pdf fill color" do
      allow(pdf).to receive(:fill_circle)
      expect(pdf).to receive(:fill_color).with("CCDDEE")
      subject.draw_dot_grid(1, 1, 100, 200)
    end

    it "fills the correct number of circles for the grid" do
      allow(pdf).to receive(:fill_color)
      expect(pdf).to receive(:fill_circle).exactly(4).times
      subject.draw_dot_grid(2, 2, 100, 200)
    end
  end
end
