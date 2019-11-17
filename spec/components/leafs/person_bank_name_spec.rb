require 'rails_helper'

RSpec.describe Components::Leafs::PersonBankName do
  let(:person) { Person.new }
  let(:params) { 'Banco do Brasil' }
  let(:bank_name_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(bank_name_leaf.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { 'invalid' }

      it 'returns false' do
        expect(bank_name_leaf.valid?).to be(false)
      end

      it 'shows error message' do
        person_errors = bank_name_leaf.instance_variable_get('@person').errors

        expect(person_errors).to eq(bank_name: 'invalid')
      end
    end
  end

  describe '.type' do
    it 'returns bank_name' do
      expect(bank_name_leaf.type).to be(:bank_name)
    end
  end
end
