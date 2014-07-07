require 'spec_helper'

describe "DotGrid::Page::HorizontalRule" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::HorizontalRule.new({})}

    before do
      allow(::DotGrid::Pattern::HorizontalRule).to receive(:new)
    end

    it "draws the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end
