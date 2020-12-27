RSpec.describe ActiveStatus::Error do
  let(:error) { described_class.new('name', StandardError, 'message') }

  describe '#as_json' do
    subject { error.as_json }

    it { is_expected.to have_key(:name) }
    it { is_expected.to have_key(:error) }

    context 'when verbose is false' do
      it { is_expected.not_to have_key(:message) }
    end

    context 'when verbose is true' do
      before { ActiveStatus.config.verbose = true }

      it { is_expected.to have_key(:message) }
    end
  end
end
