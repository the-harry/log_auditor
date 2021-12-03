# frozen_string_literal: true

RSpec.describe LogAuditor::Parser do
  describe '#parse!' do
    subject do
      described_class.new(
        reader: LogAuditor::Reader.new('spec/fixtures/webserver.log'),
        formatter: LogAuditor::Formatter,
        presenter: LogAuditor::Presenter
      ).parse!
    end

    context 'When it successfully parse the logs' do
      after { subject }

      it 'calls each object until the presenter' do
        expect_any_instance_of(LogAuditor::Presenter)
          .to receive(:present!)
      end
    end
  end
end
