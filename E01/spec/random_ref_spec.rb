require "spec_helper"
require "random_ref"

RSpec.describe RandomRef do

  describe "#string" do

    it "defaults to ten characters long" do
      expect(subject.string.length).to eql(10)
    end

    it "contains uppercase letters and numbers" do
      expect(subject.string).to match(/[A-Z0-9]{10}/)
    end

    it "returns a different string each time" do
      expect(RandomRef.new.to_s).not_to eql(RandomRef.new.to_s)
    end

    it "allows repeat characters" do
      length = RandomRef::CHARS.length + 1
      string = RandomRef.new(length: length).string
      expect(string).to match(/[A-Z0-9]{37}/)
    end

    context "when we specify a different length" do

      it "returns a String of the expected length" do
        expect(RandomRef.new(length: 4).string.length).to eql(4)
      end
    end

  end

end
