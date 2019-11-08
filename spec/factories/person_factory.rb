FactoryBot.define do
  factory :person do
    email 'some@email.com'

    factory :user_person do
      person_type 'user'
    end

    factory :lead_person do
      person_type 'lead'
    end
  end
end
