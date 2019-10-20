require 'rails_helper'

RSpec.describe Components::Composites::PersonBasic do
  let(:person) { Person.new }
  let(:params) { { email: 'some@email.com' } }
  let(:basic_composite) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(basic_composite.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns basic_composite' do
      expect(basic_composite.type).to be(:basic_composite)
    end
  end
end
