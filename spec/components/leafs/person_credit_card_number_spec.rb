require 'rails_helper'

RSpec.describe Components::Leafs::PersonCreditCardNumber do
  let(:person) { Person.new }
  let(:params) { '4821531560040456' }
  let(:credit_card_number_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(credit_card_number_leaf.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { 'invalid' }

      it 'returns false' do
        expect(credit_card_number_leaf.valid?).to be(false)
      end

      it 'shows error message' do
        person_errors = credit_card_number_leaf.instance_variable_get('@person').errors

        expect(person_errors).to eq(credit_card_number: 'invalid')
      end
    end
  end

  describe '.type' do
    it 'returns cpf' do
      expect(credit_card_number_leaf.type).to be(:credit_card_number)
    end
  end
end
