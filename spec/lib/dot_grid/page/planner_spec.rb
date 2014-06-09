require 'spec_helper'

describe "DotGrid::Page::Planner" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::Planner.new({}) }

    it "has a default planner color 1" do
      expect(subject.planner_color_1).to eq("CCCCCC")
    end

    it "has a default planner color 2" do
      expect(subject.planner_color_2).to eq("0099ff")
    end
  end

  describe "#header_height" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    it "returns the HEADER_HEIGHT of the header height" do
      allow(subject).to receive(:page_height).and_return(20)
      expect(subject.header_height).to eq(DotGrid::Page::Planner::HEADER_HEIGHT * subject.page_height)
    end
  end

  describe "#header_height" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    it "returns the HEADER_HEIGHT of the header height" do
      allow(subject).to receive(:page_height).and_return(20)
      expect(subject.header_height).to eq(DotGrid::Page::Planner::HEADER_HEIGHT * subject.page_height)
    end
  end

  describe "#square_grid_columns" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf, spacing: 5 }) }

    it "returns the HEADER_HEIGHT of the header height" do
      allow(subject).to receive(:page_width).and_return(100)
      expect(subject.square_grid_columns).to eq((DotGrid::Page::Planner::SQUARE_GRID_WIDTH * subject.page_width / subject.spacing).floor)
    end
  end

  describe "#header_left_color" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf, planner_color_1: "DDEEFF" }) }
    it "returns the planner color 1" do
      expect(subject.header_left_color).to eq("DDEEFF")
    end
  end

  describe "#header_left_start" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    it "returns the the header left_start" do
      allow(subject).to receive(:page_width).and_return(30)
      expect(subject.header_left_start).to eq(DotGrid::Page::Planner::HEADER_LEFT_START * subject.page_width)
    end
  end

  describe "#header_gap_width" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    it "returns the the header gap width" do
      allow(subject).to receive(:page_width).and_return(30)
      expect(subject.header_gap_width).to eq(DotGrid::Page::Planner::HEADER_GAP_WIDTH * subject.page_width)
    end
  end

  describe "#header_right_color" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf, planner_color_2: "FFEEDD" }) }
    it "returns the planner color 1" do
      expect(subject.header_right_color).to eq("FFEEDD")
    end
  end

  describe "#dot_grid_rows" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }
    let(:square_grid_rows) { 10 }

    it "returns the foot height" do
      allow(subject).to receive(:square_grid_rows).and_return(square_grid_rows)
      expect(subject.dot_grid_rows).to eq(square_grid_rows+1)
    end
  end

  describe "#footer_height" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }
    let(:header_height) { 100 }

    it "returns the foot height" do
      allow(subject).to receive(:header_height).and_return(header_height)
      expect(subject.footer_height).to eq(header_height*DotGrid::Page::Planner::FOOT_HEIGHT_RATIO)
    end
  end

  describe "#generate" do
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

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
