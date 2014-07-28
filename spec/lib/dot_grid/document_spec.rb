require 'spec_helper'

describe "DotGrid::Document" do
  describe "#initialize" do
    let(:subject) { DotGrid::Document.new({}) }

    it "has a default file name" do
      expect(subject.file_name).to eq("dotgrid.pdf")
    end

    it "has a default file page size" do
      expect(subject.page_size).to eq("LETTER")
    end

    it "has a default file page orientation" do
      expect(subject.orientation).to eq(:portrait)
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

  describe "#parse_page_size" do
    context "when the page size doesn't match the regex" do
      let(:subject) { DotGrid::Document.new({page_size: "LEGAL"}) }

      it "returns the page_size as is" do
        expect(subject.page_size).to eq("LEGAL")
      end
    end

    context "when the page size matches the regex" do
      let(:subject) { DotGrid::Document.new({page_size: "4x5in"}) }

      it "returns the width and heigth in an array" do
        expect(subject.page_size).to have(2).elements
      end

      it "translates the width to points" do
        expect(subject.page_size[0]).to eq(4.in)
      end

      it "translates the height to points" do
        expect(subject.page_size[1]).to eq(5.in)
      end
    end
  end

  describe "#create_pages" do
    it "calls the factory for each page" do
      expect(DotGrid::Page::Factory).to receive(:build).twice
      DotGrid::Document.new({page_types: "a, b"})
    end
  end

  describe "#generate" do
    let(:subject) { DotGrid::Document.new({}) }

    before do
      allow(subject.pdf).to receive(:render_file)
    end

    it "generates each of the pages" do
      expect(subject.pages[0]).to receive(:generate)
      subject.generate
    end

    it "renders the pdf" do
      expect(subject.pdf).to receive(:render_file)
      subject.generate
    end
  end
end
