require 'spec_helper'

describe "DotGrid::Generator" do
  describe "#initialize" do
    let(:subject) { DotGrid::Generator.new({}) }

    it "has a default file name" do
      expect(subject.file_name).to eq("dotgrid.pdf")
    end

    it "has a default file page size" do
      expect(subject.page_size).to eq("LETTER")
    end

    it "has a default file margin" do
      expect(subject.margin).to eq(0.0)
    end

    it "creates a pdf file" do
      expect(subject.pdf).to be_a(Prawn::Document)
    end

    it "creates the pages" do
      expect(subject.page_types).to have(1).page
    end
  end

  describe "#generate" do
    it "renders a file with the file name" do
      subject = DotGrid::Generator.new({})
      expect(subject.pdf).to receive(:render_file).with(subject.file_name)
      subject.generate
    end
  end
end
