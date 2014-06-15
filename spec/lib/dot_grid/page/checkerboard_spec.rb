require 'spec_helper'

describe "DotGrid::Page::Checkerboard" do
  describe "#initialize" do
    let(:pdf) { double('pdf', bounds: double('bounds')) }

    it "creates a dot grid pattern" do
      expect(::DotGrid::Pattern::Checkerboard).to receive(:new)
      DotGrid::Page::Checkerboard.new({pdf: pdf})
    end
  end

  describe "#generate" do
    let(:pdf) { double('pdf', bounds: double('bounds')) }
    let(:subject) { DotGrid::Page::Checkerboard.new({pdf: pdf})}
    let(:pattern) { double('pattern') }

    before do
      allow(pdf).to receive(:start_new_page)
      allow(subject).to receive(:pattern).and_return(pattern)
    end

    it "draws the pattern" do
      expect(pattern).to receive(:draw)
      subject.generate
    end
  end
end
