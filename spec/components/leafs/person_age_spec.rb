require 'rails_helper'

RSpec.describe Components::Leafs::PersonAge do
  let(:person) { Person.new }
  let(:params) { '25' }
  let(:age_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when person is a minor' do
      it 'returns false' do
        expect(described_class.new(person, '12').valid?).to be(false)
      end
    end

    it 'returns true' do
      expect(age_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns age' do
      expect(age_leaf.type).to be(:age)
    end
  end
end
