require 'rails_helper'

RSpec.describe Clients::PersonBuilderClient do
  describe '.person' do
    context 'when no type is provided' do
      let(:params) { { email: 'some@email.com' } }

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end
    end
  end
end
