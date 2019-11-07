require 'rails_helper'

RSpec.describe Clients::PersonBuilderClient do
  describe '.person' do
    context 'when type is lead' do
      let(:params) do
        {
          type: 'lead',
          cpf: '111',
          email: 'some@email.com',
          name: 'Marvin The Robot',
          bank_name: 'name',
          bank_agency_number: '1',
          bank_account_number: '12344',
          credit_card_number: '45',
          credit_card_flag: 'visa'
        }
      end

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end

      it 'instantiates a lead person with credit card number information' do
        user = described_class.new(params).person

        expect(user.credit_card_number).to eq(params[:credit_card_number])
      end

      it 'instantiates a lead person with credit card flag information' do
        user = described_class.new(params).person

        expect(user.credit_card_flag).to eq(params[:credit_card_flag])
      end

      it 'instantiates a lead person with bank name information' do
        user = described_class.new(params).person

        expect(user.bank_name).to eq(params[:bank_name])
      end

      it 'instantiates a lead person with bank agency number information' do
        user = described_class.new(params).person

        expect(user.bank_agency_number).to eq(params[:bank_agency_number])
      end

      it 'instantiates a lead person with bank account number information' do
        user = described_class.new(params).person

        expect(user.bank_account_number).to eq(params[:bank_account_number])
      end

      it 'instantiates a lead person with name information' do
        user = described_class.new(params).person

        expect(user.name).to eq(params[:name])
      end

      it 'instantiates a lead person with cpf information' do
        user = described_class.new(params).person

        expect(user.cpf).to eq(params[:cpf])
      end

      it 'instantiates a lead person with email information' do
        user = described_class.new(params).person

        expect(user.email).to eq(params[:email])
      end
    end

    context 'when type is user' do
      let(:params) { { type: 'user', cpf: '111', email: 'some@email.com', age: '20' } }

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end

      it 'instantiates a user person with name information' do
        user = described_class.new(params).person

        expect(user.name).to eq(params[:name])
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
