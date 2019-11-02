require 'rails_helper'

RSpec.describe Components::Leafs::PersonCreditCardNumber do
  let(:person) { Person.new }
  let(:params) { '111' }
  let(:credit_card_number_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(credit_card_number_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns cpf' do
      expect(credit_card_number_leaf.type).to be(:credit_card_number)
    end
  end
end
