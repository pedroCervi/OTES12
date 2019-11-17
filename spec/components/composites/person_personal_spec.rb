require 'rails_helper'

RSpec.describe Components::Composites::PersonPersonal do
  let(:person) { Person.new }
  let(:params) { { cpf: '111', name: 'Marvin' } }
  let(:personal_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(personal_composite.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { { cpf: '123' } }

      it 'returns false' do
        expect(personal_composite.valid?).to be(false)
      end

      it 'shows missing param' do
        expect(personal_composite.missing_params).to eq([:name])
      end
    end
  end

  describe '.type' do
    it 'returns personal_composite' do
      expect(personal_composite.type).to be(:personal_composite)
    end
  end
end
