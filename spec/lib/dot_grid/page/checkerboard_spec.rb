require 'spec_helper'

describe "DotGrid::Page::Checkerboard" do
  describe "#draw" do
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
