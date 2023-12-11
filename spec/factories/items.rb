FactoryBot.define do
  factory :item do
    
    # image              {""}
    title              {"test"}
    description        {Faker::Lorem.sentence}
    category_id        {2}
    condition_id       {2}
    burden_id          {2}
    area_id            {2}
    delivery_id        {2}
    price              {4000}
    # user_id            {1}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png')
    end
  end
  
end
