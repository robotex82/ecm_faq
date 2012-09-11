FactoryGirl.define do
  factory :ecm_faq_item, :class => Ecm::Faq::Item do
    sequence(:question) { |n| "FAQ Item ##{n}" }
    answer { Faker::Lorem.paragraph(1 + rand(5)) }
    markup_language 'textile'
    ecm_faq_category
  end
end
