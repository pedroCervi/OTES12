require 'rails_helper'

RSpec.describe Components::Leafs::PersonBankName do
  let(:person) { Person.new }
  let(:params) { '111' }
  let(:bank_name_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(bank_name_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns bank_name' do
      expect(bank_name_leaf.type).to be(:bank_name)
    end
  end
end
