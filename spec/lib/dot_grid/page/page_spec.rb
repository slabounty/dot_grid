require 'spec_helper'

describe "DotGrid::Page::Page" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::Page.new({}) }
    it "creates then empty patterns" do
      expect(subject.patterns).to eq([])
    end

    it "calls the post initialize method" do
      expect_any_instance_of(DotGrid::Page::Page).to receive(:post_initialize)
      DotGrid::Page::Page.new({})
    end
  end

  describe "#add_pattern" do
    let(:subject) { DotGrid::Page::Page.new({})}
    let(:pattern) { double('pattern') }

    it "adds a pattern to patterns" do
      expect(subject.patterns).to receive(:<<).with(pattern)
      subject.add_pattern(pattern)
    end
  end

  describe "#generate" do
    let(:pdf) { double('pdf', bounds: double('bounds')) }
    let(:subject) { DotGrid::Page::Page.new({pdf: pdf})}
    let(:pattern) { double('pattern') }

    before do
      allow(pdf).to receive(:start_new_page)
      allow(subject).to receive(:patterns).and_return([pattern])
      allow(pattern).to receive(:draw)
    end

    it "starts a new page" do
      expect(pdf).to receive(:start_new_page)
      subject.generate
    end

    it "draws the pattern" do
      expect(pattern).to receive(:draw)
      subject.generate
    end
  end
end

