FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a0a0a0"}
    password_confirmation {password}
    first_name            {person.last.kanji}
    given_name            {person.first.kanji}
    first_name_kana       {person.last.katakana}
    given_name_kana       {person.first.katakana}
    birthday              {Faker::Date.backward}
  end
end