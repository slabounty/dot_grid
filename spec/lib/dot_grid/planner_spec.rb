require 'spec_helper'

describe "DotGrid::Planner" do
  describe "#initialize" do
    let(:subject) { DotGrid::Planner.new({}) }

    it "has a default planner color 1" do
      expect(subject.planner_color_1).to eq("CCCCCC")
    end

    it "has a default planner color 2" do
      expect(subject.planner_color_2).to eq("0099ff")
    end
  end

  describe "#header_height" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Planner.new({:pdf => pdf }) }

    it "returns the HEADER_HEIGHT_PERCENT of the header height" do
      allow(subject).to receive(:page_height).and_return(20)
      expect(subject.header_height).to eq(DotGrid::Planner::HEADER_HEIGHT_PERCENT / 100.0 * subject.page_height)
    end
  end

  describe "#square_grid_columns" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Planner.new({:pdf => pdf, spacing: 5 }) }

    it "returns the HEADER_HEIGHT_PERCENT of the header height" do
      allow(subject).to receive(:page_width).and_return(100)
      expect(subject.square_grid_columns).to eq((DotGrid::Planner::SQUARE_GRID_WIDTH_PERCENT / 100.0 * subject.page_width / subject.spacing).floor)
    end
  end

  describe "#header_left_color" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Planner.new({:pdf => pdf, planner_color_1: "DDEEFF" }) }
    it "returns the planner color 1" do
      expect(subject.header_left_color).to eq("DDEEFF")
    end
  end

  describe "#generate" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Planner.new({:pdf => pdf }) }

    before do
      allow(subject).to receive(:page_width).and_return(10)
      allow(subject).to receive(:page_height).and_return(20)
      allow(pdf).to receive(:start_new_page)
      allow(pdf).to receive(:fill_color)
      allow(pdf).to receive(:fill_rectangle)
      allow(pdf).to receive(:fill_circle)
    end

    it "starts a new page" do
      expect(pdf).to receive(:start_new_page)
      subject.generate
    end

    it "gets the page_width" do
      expect(subject).to receive(:page_width)
      subject.generate
    end

    it "gets the page_height" do
      expect(subject).to receive(:page_height)
      subject.generate
    end

    it "draws the left square grid" do
      expect(subject).to receive(:draw_square_grid_left)
      subject.generate
    end

    it "draws the dot grid" do
      expect(subject).to receive(:draw_dot_grid)
      subject.generate
    end

    it "draws the footer" do
      expect(subject).to receive(:draw_footer)
      subject.generate
    end
  end
end
