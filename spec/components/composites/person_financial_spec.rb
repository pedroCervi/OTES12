require 'rails_helper'

RSpec.describe Components::Composites::PersonFinancial do
  let(:person) { Person.new }
  let(:params) do
    {
      bank_name: 'some bank',
      bank_agency_number: '11231',
      bank_account_number: '2',
      credit_card_number: '1232',
      credit_card_flag: 'visa'
    }
  end

  let(:financial_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(financial_composite.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns financial_composite' do
      expect(financial_composite.type).to be(:financial_composite)
    end
  end
end
