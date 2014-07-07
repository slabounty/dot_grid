require 'spec_helper'

describe "DotGrid::Page::Checkerboard" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::Checkerboard.new({})}

    before do
      allow(::DotGrid::Pattern::Checkerboard).to receive(:new)
    end

    it "adds the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end
