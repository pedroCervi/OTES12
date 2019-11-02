require 'rails_helper'

RSpec.describe Components::Composites::PersonBank do
  let(:person) { Person.new }
  let(:params) do
    { bank_name: 'BB', bank_account_number: '123', bank_agency_number: '1' }
  end

  let(:bank_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(bank_composite.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns bank_composite' do
      expect(bank_composite.type).to be(:bank_composite)
    end
  end
end
