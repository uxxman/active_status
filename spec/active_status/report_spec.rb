RSpec.describe ActiveStatus::Report do
  let(:report) { described_class.new }

  describe '#errors' do
    it 'is empty by default' do
      expect(report.errors).to be_empty
    end
  end

  describe '#build' do
    context 'when successful' do
      before { report.build }

      it 'has no errors' do
        expect(report.errors).to be_empty
      end
    end

    context 'when unsuccessful' do
      before do
        ActiveStatus.config.check :check1 do
          raise StandardError
        end

        ActiveStatus.config.check :check2 do
          false
        end

        report.build
      end

      it 'has errors' do
        expect(report.errors.size).to eq(2)
      end
    end
  end

  describe '#success?' do
    context 'without error' do
      it 'returns true' do
        expect(report.success?).to be(true)
      end
    end

    context 'with errors' do
      it 'returns false' do
        report.add_error(ActiveStatus::Error.new('name', 'error'))

        expect(report.success?).to be(false)
      end
    end
  end
end
