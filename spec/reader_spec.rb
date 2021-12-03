# frozen_string_literal: true

RSpec.describe LogAuditor::Reader do
  describe '#read' do
    subject { described_class.new(log_file).read! }

    context 'When it successfully read the file' do
      let(:log_file) { 'spec/fixtures/webserver.log' }

      it 'returns the file content splited by route and ip' do
        expect(subject.last).to eq(['/about', '543.910.244.929'])
      end
    end

    context 'When file dont exists' do
      let(:log_file) { 'non_existent.log' }

      it 'raises NoFileError' do
        expect { subject }
          .to raise_error(LogAuditor::Errors::NoFileError)
      end
    end

    context 'When file cant be read' do
      let(:log_file) { nil }

      it 'raises FileReadError' do
        expect { subject }
          .to raise_error(LogAuditor::Errors::FileReadError)
      end
    end
  end
end
