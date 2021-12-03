# frozen_string_literal: true

RSpec.describe LogAuditor::Formatter do
  describe '#format!' do
    subject { described_class.new(input).format! }

    context 'When it successfully parses the values' do
      let(:input) do
        File.read('spec/fixtures/webserver.log')
            .split("\n").map { |line| line.split(/\s/) }
      end

      let(:expected_result) do
        {
          requests: [
            { path: '/about/2', counter: 180, uniq_counter: 23 },
            { path: '/contact', counter: 178, uniq_counter: 24 },
            { path: '/index', counter: 164, uniq_counter: 24 },
            { path: '/about', counter: 162, uniq_counter: 22 },
            { path: '/help_page/1', counter: 160, uniq_counter: 24 },
            { path: '/home', counter: 156, uniq_counter: 24 }
          ],
          uniq_requests: [
            { path: '/index', counter: 164, uniq_counter: 24 },
            { path: '/home', counter: 156, uniq_counter: 24 },
            { path: '/contact', counter: 178, uniq_counter: 24 },
            { path: '/help_page/1', counter: 160, uniq_counter: 24 },
            { path: '/about/2', counter: 180, uniq_counter: 23 },
            { path: '/about', counter: 162, uniq_counter: 22 }
          ]
        }
      end

      it 'returns the file content splited by route and ip' do
        is_expected.to eq(expected_result)
      end
    end

    context 'When it fails' do
      let(:input) { nil }

      it 'raises NoFileError' do
        expect { subject }
          .to raise_error(LogAuditor::Errors::ParseError)
      end
    end
  end
end
