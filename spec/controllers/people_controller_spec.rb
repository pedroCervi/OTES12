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

    context 'when passing invalid params' do
      before { post :create, params: { invalid_param: 'test@email.com' } }

      it 'returns an error' do
        expect(response.body.include?('error:')).to be(true)
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
    let!(:person) { FactoryBot.create(:person) }
    let!(:person_old_attributes) { person.attributes }

    context 'when passing valid params' do
      before { put :update, params: { id: person.id, email: 'new_test@email.com' } }

      it 'updates the person attributes' do
        expect(person.reload.attributes).not_to eq(person_old_attributes)
      end

      it 'returns the person id' do
        expect(response.body).to eq("person_id: #{person.id}\n")
      end
    end

    context 'when passing invalid params' do
      before { put :update, params: { id: person.id, invalid_param: 'test@email.com' } }

      it 'returns an error' do
        expect(response.body.include?('error:')).to be(true)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when the requested person exists' do
      let(:person) { FactoryBot.create(:person) }

      it 'destroys the person' do
        delete :destroy, params: { id: person.id }

        expect(response.body).to eq("Person successfully deleted.\n")
      end
    end

    context 'when the requested person does not exists' do
      it "returns a 'record not found' message" do
        delete :destroy, params: { id: 12_345 }

        expect(response.body).to eq('Record not found.' + "\n")
      end
    end
  end

  describe 'GET index' do
    context 'when there are no records to be found' do
      context 'when no type is provided' do
        it 'returns no records message' do
          get :index

          expect(response.body).to eq("No Record found.\n")
        end
      end

      context "when provided type is 'user'" do
        it 'returns no records message' do
          get :index, params: { type: 'user' }

          expect(response.body).to eq("No Record found.\n")
        end
      end
    end

    context 'when there are records to be found' do
      let!(:person) { FactoryBot.create(:person) }
      let!(:user_person) { FactoryBot.create(:user_person) }
      let!(:lead_person) { FactoryBot.create(:lead_person) }

      context 'when no type is provided' do
        it 'returns all people on the database' do
          people = [
            person.attributes,
            user_person.attributes,
            lead_person.attributes
          ]

          get :index

          JSON.parse(response.body).should match_array(people)
        end
      end

      context "when provided type is 'user'" do
        it 'returns user people on the database' do
          people = [user_person.attributes]

          get :index, params: { type: 'user' }

          JSON.parse(response.body).should match_array(people)
        end
      end
    end
  end
end
