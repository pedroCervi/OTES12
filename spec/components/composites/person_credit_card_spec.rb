require 'rails_helper'

RSpec.describe Components::Composites::PersonCreditCard do
  let(:person) { Person.new }
  let(:params) do
    { credit_card_number: '123', credit_card_flag: 'visa' }
  end

  let(:credit_card_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(credit_card_composite.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { { credit_card_number: '123' } }

      it 'returns false' do
        expect(credit_card_composite.valid?).to be(false)
      end
    end
  end

  describe '.type' do
    it 'returns credit_card_composite' do
      expect(credit_card_composite.type).to be(:credit_card_composite)
    end
  end
end
