# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'error' do
  describe '.initialize' do
    it 'is a instance of RuntimeError' do
      expect(subject).to be_a_kind_of(RuntimeError)
    end

    context 'when no message is passed' do
      it 'has a default message' do
        expect(subject.message).to eq(described_class::DEFAULT_MESSAGE)
      end
    end

    context 'when some message is passed' do
      let(:message) { 'foobar' }

      subject { described_class.new(message) }

      it 'accepts a message' do
        expect(subject.message).to eq(message)
      end
    end
  end
end
