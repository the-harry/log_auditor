# frozen_string_literal: true

RSpec.describe LogAuditor::Presenter do
  describe '#present!' do
    let(:data) do
      {
        requests: [
          { path: '/index', counter: 3, uniq_counter: 1 },
          { path: '/home', counter: 2, uniq_counter: 2 }
        ],
        uniq_requests: [
          { path: '/home', counter: 2, uniq_counter: 2 },
          { path: '/index', counter: 3, uniq_counter: 1 }
        ]
      }
    end

    subject { described_class.new(data).present! }

    context 'When it prints the sorted requests' do
      it 'print table with headers' do
        expect { subject }.to output(/Requests counter/).to_stdout
      end

      it 'uses the correct sulfix' do
        expect { subject }.to output(/visits/).to_stdout
      end
    end

    context 'When it prints unique requests' do
      it 'print table with headers' do
        expect { subject }.to output(/Uniq requests counter/).to_stdout
      end

      it 'uses the correct sulfix' do
        expect { subject }.to output(/unique views/).to_stdout
      end
    end
  end
end
