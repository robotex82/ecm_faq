FactoryGirl.define do
  factory :ecm_faq_category, :class => Ecm::Faq::Category do
    locale 'en'
    sequence(:name) { |n| "FAQ Category ##{n}" }
    markup_language 'textile'
    
    factory(:ecm_faq_category_with_parent) do
      locale nil
      association :parent, :factory => :ecm_faq_category
    end
  end
end
