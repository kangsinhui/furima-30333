FactoryBot.define do
  factory :item do
    name                   {'sample'}
    description            {'sampleです。'}
    category_id            {'2'}
    condition_id           {'2'}
    cost_id                {'2'}
    prefectures_id         {'2'}
    day_id                 {'2'}
    price                  {'300'}
    image                  {''}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end