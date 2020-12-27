RSpec.describe ActiveStatus::Configuration do
  let(:config) { described_class.new }

  describe '#verbose' do
    it 'is false by default' do
      expect(config.verbose).to be(false)
    end
  end

  describe '#error_code' do
    it 'is 503 by default' do
      expect(config.error_code).to be(503)
    end
  end

  describe '#success_code' do
    it 'is 200 by default' do
      expect(config.success_code).to be(200)
    end
  end

  describe '#checks' do
    it 'is empty by default' do
      expect(config.checks).to be_empty
    end
  end

  describe '#check' do
    it 'adds a new check definition' do
      expect do
        config.check :check_name do
          # Some logic to check
        end
      end.to change { config.checks.size }.from(0).to 1
    end
  end
end
