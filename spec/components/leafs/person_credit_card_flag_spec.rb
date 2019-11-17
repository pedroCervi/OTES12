require 'rails_helper'

RSpec.describe Components::Leafs::PersonCreditCardFlag do
  let(:person) { Person.new }
  let(:params) { 'Visa' }
  let(:credit_card_flag_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(credit_card_flag_leaf.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { 'fake' }

      it 'returns false' do
        expect(credit_card_flag_leaf.valid?).to be(false)
      end

      it 'shows error message' do
        person_errors = credit_card_flag_leaf.instance_variable_get('@person').errors

        expect(person_errors).to eq(credit_card_flag: 'invalid')
      end
    end
  end

  describe '.type' do
    it 'returns credit_card_flag' do
      expect(credit_card_flag_leaf.type).to be(:credit_card_flag)
    end
  end
end
