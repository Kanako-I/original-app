FactoryBot.define do
  factory :user do
    first_name            { 'kanako' }
    last_name             { 'ikeda' }
    email                 { 'kkk@gmail.com' }
    password              { '123aaa' }
    password_confirmation { '123aaa' }
    resident_id           { 2 }
    age_id                { 2 }
    occupation_id         { 2 }
  end
end