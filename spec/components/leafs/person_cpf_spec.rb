require 'rails_helper'

RSpec.describe Components::Leafs::PersonCpf do
  let(:person) { Person.new }
  let(:params) { '111' }
  let(:cpf_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(cpf_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns cpf' do
      expect(cpf_leaf.type).to be(:cpf)
    end
  end
end
