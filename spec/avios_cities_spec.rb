require 'spec_helper'

RSpec.describe AviosCities do
  it "has a version number" do
    expect(AviosCities::VERSION).not_to be nil
  end

  describe ".find_by_iata_code" do
    subject(:find_by_iata_code) do
      described_class.find_by_iata_code(iata_code)
    end

    context "with a valid IATA code" do
      let(:iata_code) { "LON" }

      it { is_expected.to be_a(AviosCities::City) }
      its(:name) { is_expected.to eq("London") }
    end

    context "with an invalid IATA code" do
      let(:iata_code) { "JFK" }

      it { is_expected.to be_nil }

      context "with a code that is too long" do
        let(:iata_code) { "ALICE" }

        it "doesn't try to look it up" do
          expect(AviosCities.parsed_data).not_to receive(:fetch).with(iata_code, nil)
          find_by_iata_code
        end
      end
    end
  end

  describe ".iata_codes" do
    subject { described_class.iata_codes }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include("LON") }
  end

  describe ".all" do
    subject { described_class.all }

    it { is_expected.to be_a(Array) }
    its(:first) { is_expected.to be_a(AviosCities::City) }
  end
end
