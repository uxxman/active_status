require 'rails_helper'

RSpec.describe ActiveStatus::Report do
  let(:report) { described_class.new }

  describe '#initialize' do
    it { expect(report.errors).to be_empty }
  end

  describe '.define_check' do
    described_class.define_check(:name, proc {})

    it { expect(report).to respond_to(:name) }
  end

  describe '#build' do
    context 'without errors' do
      before { report.build }

      it { expect(report.errors).to be_empty }
      it { expect(report.success?).to be(true) }
    end

    context 'with errors' do
      before do
        ActiveStatus.configuration.check :check_name do
          raise StandardError
        end

        report.build
      end

      it { expect(report.success?).to be(false) }
      it { expect(report.errors).not_to be_empty }
      it { expect(report.errors.first.name).to eq(:check_name) }
    end
  end
end
