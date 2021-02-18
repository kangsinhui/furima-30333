FactoryBot.define do
  factory :user do
    nickname              {'sample'}
    email                 {'samlpe@example'}
    password              {'000000'}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'19941205'}
  end
end