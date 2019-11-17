require 'rails_helper'

RSpec.describe Components::Leafs::PersonType do
  let(:person) { Person.new }
  let(:params) { 'user' }
  let(:person_type_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(person_type_leaf.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { 'invalid' }

      it 'returns false' do
        expect(person_type_leaf.valid?).to be(false)
      end

      it 'shows error message' do
        person_errors = person_type_leaf.instance_variable_get('@person').errors

        expect(person_errors).to eq(person_type: 'invalid')
      end
    end
  end

  describe '.type' do
    it 'returns person_type' do
      expect(person_type_leaf.type).to be(:person_type)
    end
  end
end
