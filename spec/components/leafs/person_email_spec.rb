require 'rails_helper'

RSpec.describe Components::Leafs::PersonEmail do
  let(:person) { Person.new }
  let(:params) { 'some@email.com' }
  let(:email_leaf) { described_class.new(person, params) }

  before do
    person.components = []
  end

  describe '.valid?' do
    context 'when it is valid' do
      it 'returns true' do
        expect(email_leaf.valid?).to be(true)
      end
    end

    context 'when it is invalid' do
      let(:params) { 'invalidemail.com' }

      it 'returns false' do
        expect(email_leaf.valid?).to be(false)
      end

      it 'shows error message' do
        person_errors = email_leaf.instance_variable_get('@person').errors

        expect(person_errors).to eq(email: 'invalid')
      end
    end
  end

  describe '.type' do
    it 'returns email' do
      expect(email_leaf.type).to be(:email)
    end
  end
end
