require 'rails_helper'

RSpec.describe Builders::PersonBuilderDirector do
  describe '.person' do
    context 'when type is lead' do
      let(:params) do
        {
          type: 'lead',
          cpf: '794.857.642-86',
          email: 'some@email.com',
          name: 'Marvin The Robot',
          bank_name: 'Banco do Brasil',
          bank_agency_number: '1456',
          bank_account_number: '26548-8',
          credit_card_number: '4821531560040456',
          credit_card_flag: 'Visa'
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

      it 'instantiates a lead person with type information' do
        person = described_class.new(params).person

        expect(person.person_type).to eq('lead')
      end
    end

    context 'when type is user' do
      let(:params) do
        {
          type: 'user',
          cpf: '794.857.642-86',
          email: 'some@email.com',
          name: 'Marvin'
        }
      end

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

      it 'instantiates a user person with type information' do
        person = described_class.new(params).person

        expect(person.person_type).to eq('user')
      end
    end

    context 'when no type is provided' do
      let(:params) { { email: 'some@email.com' } }

      it 'calls the builder' do
        expect(PersonBuilder).to receive(:build)

        described_class.new(params).person
      end

      it 'instantiates a person with no type information' do
        person = described_class.new(params).person

        expect(person.person_type).to eq(nil)
      end

      it 'instantiates a person person with email information' do
        person = described_class.new(params).person

        expect(person.email).to eq(params[:email])
      end
    end
  end
end
