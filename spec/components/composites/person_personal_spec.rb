require 'rails_helper'

RSpec.describe Components::Composites::PersonPersonal do
  let(:person) { Person.new }
  let(:params) { { email: 'some@email.com', cpf: '111', name: 'Marvin' } }
  let(:personal_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(personal_composite.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns personal_composite' do
      expect(personal_composite.type).to be(:personal_composite)
    end
  end
end
