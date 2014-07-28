require 'spec_helper'

describe "DotGrid::Generator" do
  describe "#initialize" do
    let(:subject) { DotGrid::Generator.new({}) }

    it "creates a new document" do
      expect(subject.document).to_not be_nil
    end
  end

  describe "#generate" do
    it "renders a file with the file name" do
      subject = DotGrid::Generator.new({})
      expect(subject.document).to receive(:generate)
      subject.generate
    end
  end
end
