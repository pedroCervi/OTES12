require 'rails_helper'

RSpec.describe Clients::PersonBuilderClient do
  describe '.person' do
    context 'when type is user' do
      let(:params) { { type: 'user', cpf: '111', email: 'some@email.com', age: '20' } }

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end

      it 'instantiates a user person with age information' do
        user = described_class.new(params).person

        expect(user.age).to eq(params[:age])
      end

      it 'instantiates a user person with cpf information' do
        user = described_class.new(params).person

        expect(user.cpf).to eq(params[:cpf])
      end

      it 'instantiates a user person with email information' do
        user = described_class.new(params).person

        expect(user.email).to eq(params[:email])
      end
    end

    context 'when no type is provided' do
      let(:params) { { email: 'some@email.com' } }

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end

      it 'instantiates a user person with email information' do
        user = described_class.new(params).person

        expect(user.email).to eq(params[:email])
      end
    end
  end
end
