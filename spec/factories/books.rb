FactoryBot.define do
  factory :book do
    name           {Faker::Name.initials}
    info           {Faker::Lorem.sentence}
    published_on   {2000-12-04}
    author_name    {Faker::Name}
    price          {3456}
    appearance_id     {4}
    category_id       {5}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end
