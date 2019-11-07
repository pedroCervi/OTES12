require 'rails_helper'

RSpec.describe Components::Leafs::PersonName do
  let(:person) { Person.new }
  let(:params) { 'João' }
  let(:name_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(name_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns name' do
      expect(name_leaf.type).to be(:name)
    end
  end
end
