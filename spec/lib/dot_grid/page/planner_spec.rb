require 'spec_helper'

describe "DotGrid::Page::Planner" do
  describe "#initialize" do
    let(:pdf) { double('pdf') }
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:subject) { DotGrid::Page::Planner.new({pdf: pdf}) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "has a default planner color 1" do
      expect(subject.planner_color_1).to eq("CCCCCC")
    end

    it "has a default planner color 2" do
      expect(subject.planner_color_2).to eq("0099ff")
    end
  end

  describe "#header_height" do
    let(:pdf) { double('pdf') }
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the HEADER_HEIGHT of the header height" do
      allow(subject).to receive(:page_height).and_return(20)
      expect(subject.header_height).to eq(DotGrid::Page::Planner::HEADER_HEIGHT * subject.page_height)
    end
  end

  describe "#header_left_color" do
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf, planner_color_1: "DDEEFF" }) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the planner color 1" do
      expect(subject.header_left_color).to eq("DDEEFF")
    end
  end

  describe "#header_left_start" do
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the the header left_start" do
      allow(subject).to receive(:page_width).and_return(30)
      expect(subject.header_left_start).to eq(DotGrid::Page::Planner::HEADER_LEFT_START * subject.page_width)
    end
  end

  describe "#header_gap_width" do
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the the header gap width" do
      allow(subject).to receive(:page_width).and_return(30)
      expect(subject.header_gap_width).to eq(DotGrid::Page::Planner::HEADER_GAP_WIDTH * subject.page_width)
    end
  end

  describe "#header_right_color" do
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf, planner_color_2: "FFEEDD" }) }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the planner color 1" do
      expect(subject.header_right_color).to eq("FFEEDD")
    end
  end

  describe "#footer_height" do
    let(:bounds) { double('bounds', width: 10, height: 20) }
    let(:pdf) { double('pdf') }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }
    let(:header_height) { 100 }

    before do
      allow(pdf).to receive(:bounds).and_return(bounds)
    end

    it "returns the foot height" do
      allow(subject).to receive(:header_height).and_return(header_height)
      expect(subject.footer_height).to eq(header_height*DotGrid::Page::Planner::FOOT_HEIGHT_RATIO)
    end
  end

  describe "#generate" do
    let(:pdf) { double('pdf', bounds: double('bounds', width: 10, height: 20)) }
    let(:subject) { DotGrid::Page::Planner.new({:pdf => pdf }) }

    before do
      allow(subject).to receive(:page_width).and_return(10)
      allow(subject).to receive(:page_height).and_return(20)
      allow(pdf).to receive(:start_new_page)
      allow(subject).to receive(:draw_header).twice
      allow(subject).to receive(:draw_footer)
      allow_any_instance_of(::DotGrid::Pattern::SquareGrid).to receive(:draw)
      allow_any_instance_of(::DotGrid::Pattern::DotGrid).to receive(:draw)
    end

    it "draws the header" do
      expect(subject).to receive(:draw_header).twice
      subject.generate
    end

    it "draws the footer" do
      expect(subject).to receive(:draw_footer)
      subject.generate
    end
  end
end
