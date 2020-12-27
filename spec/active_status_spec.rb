RSpec.describe ActiveStatus do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'allows changing .config values' do
      expect do
        described_class.configure do |config|
          config.verbose = true
        end
      end.to change { described_class.config.verbose }.from(false).to(true)
    end
  end
end
