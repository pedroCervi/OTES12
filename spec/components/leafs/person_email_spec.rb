require 'rails_helper'

RSpec.describe Components::Leafs::PersonEmail do
  let(:person) { Person.new }
  let(:params) { 'some@email.com' }
  let(:email_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    it 'returns true' do
      expect(email_leaf.valid?).to be(true)
    end
  end

  describe '.type' do
    it 'returns basic_composite' do
      expect(email_leaf.type).to be(:email)
    end
  end
end
