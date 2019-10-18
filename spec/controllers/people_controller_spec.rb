require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'POST create' do
    context 'when passing valid params' do
      before { post :create, params: { email: 'test@email.com' } }

      it 'creates a person' do
        expect(Person.where(email: 'test@email.com').first.present?).to be(true)
      end

      it 'returns the person id' do
        person = Person.where(email: 'test@email.com').first

        expect(response.body).to eq("person_id: #{person.id}\n")
      end
    end
  end

  describe 'GET show' do
    context 'when the requested person exists' do
      let(:person) { FactoryBot.create(:person) }

      it 'returns the person information' do
        get :show, params: { id: person.id }

        expect(response.body).to eq(person.to_json + "\n")
      end
    end

    context 'when the requested person does not exists' do
      it "returns a 'record not found' message" do
        get :show, params: { id: 12_345 }

        expect(response.body).to eq('Record not found.' + "\n")
      end
    end
  end

  describe 'PUT update' do
  end

  describe 'DELETE destroy' do
  end
end
