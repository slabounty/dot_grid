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
      expect(subject.margin).to eq(0.5)
    end

    it "has a default number of pages" do
      expect(subject.pages).to eq(1)
    end

    it "creates a pdf file" do
      expect(Prawn::Document).to receive(:new)
      subject
    end

    context "when there is a grid parameter" do
      it "creates a new grid page" do
        expect(DotGrid::Page::Grid).to receive(:new)
        DotGrid::Generator.new({:grid => true})
      end
    end

    context "when there is a planner parameter" do
      it "creates a new grid page" do
        expect(DotGrid::Page::Planner).to receive(:new)
        DotGrid::Generator.new({:planner => true})
      end
    end
  end

  describe "#generate" do
    context "when there is a planner page" do
      let(:subject) { DotGrid::Generator.new(:planner => true)}
      it "generates a new planner page" do
        expect(subject.planner_page).to receive(:generate)
        subject.generate
      end
    end

    context "when there is a grid page" do
      let(:subject) { DotGrid::Generator.new(:grid => true)}
      it "generates a new grid page" do
        expect(subject.grid_page).to receive(:generate)
        subject.generate
      end
    end

    context "when there are multiple pages" do
      let(:subject) { DotGrid::Generator.new(:grid => true, :planner => true, :pages => 2)}

      it "generates grid for each page" do
        expect(subject.grid_page).to receive(:generate).twice
        subject.generate
      end

      it "generates a planner for each page" do
        expect(subject.planner_page).to receive(:generate).twice
        subject.generate
      end
    end

    it "renders a file with the file name" do
      subject = DotGrid::Generator.new({})
      expect(subject.pdf).to receive(:render_file).with(subject.file_name)
      subject.generate
    end
  end
end
