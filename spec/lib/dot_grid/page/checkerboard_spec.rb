require 'spec_helper'

describe "DotGrid::Page::Checkerboard" do
  describe "#post_initialize" do
    let(:pdf) { double('pdf', bounds: double('bounds')) }
    let(:subject) { DotGrid::Page::Checkerboard.new({pdf: pdf})}

    it "draws the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end
