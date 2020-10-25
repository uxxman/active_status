require 'rails_helper'

RSpec.describe RailsHealthStatus::Configuration do
  let(:config) { described_class.new }

  describe '#initialize' do
    it { expect(config.error).to eq(503) }
    it { expect(config.success).to eq(200) }
    it { expect(config.verbose).to eq(false) }
    it { expect(config.checks).to be_empty }
  end

  describe '#check' do
    before do
      config.check :check_name do
        # Some logic to check
      end
    end

    it { expect(config.checks).not_to be_empty }
    it { expect(config.checks).to contain_exactly(:check_name) }
  end
end
