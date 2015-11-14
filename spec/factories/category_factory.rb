FactoryGirl.define do
  factory :category do
    name 'First category'
    parent_id nil
    description 'Lorem...'

    # Other property
    trait :other do
      name 'Second category'
      description 'Ipsum...'
    end
  end
end
