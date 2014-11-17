require 'spec_helper'

describe "DotGrid::Page::LinePrinter" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::LinePrinter.new({})}

    before do
      allow(::DotGrid::Pattern::LinePrinter).to receive(:new)
    end

    it "adds the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end
