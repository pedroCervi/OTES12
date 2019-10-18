require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET show' do
    context 'when the requested person exists' do
      it 'returns the person information' do
      end
    end

    context 'when the requested person does not exists' do
      it "returns a 'record not found' message" do
      end
    end
  end
end
