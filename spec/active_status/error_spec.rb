require 'rails_helper'

RSpec.describe ActiveStatus::Error do
  let(:error) { described_class.new('name', StandardError, 'message') }

  describe '#initialize' do
    it { expect(error.name).to eq('name') }
    it { expect(error.message).to eq('message') }
    it { expect(error.error).to eq(StandardError.name) }
  end

  describe '#as_json' do
    subject { error.as_json }

    context 'when verbose is false' do
      it { is_expected.to include(:name, :error) }
      it { is_expected.not_to include(:message) }
    end

    context 'when verbose is true' do
      before { ActiveStatus.configuration.verbose = true }

      it { is_expected.to include(:name, :error, :message) }
    end
  end
end
