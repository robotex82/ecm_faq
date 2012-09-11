require 'spec_helper'

module Ecm
  module Faq
    describe Item do
      subject { FactoryGirl.create(:ecm_faq_item) }
      
      context "associations" do
        it { should belong_to(:ecm_faq_category) }
      end

      context "acts as list" do
        it { should respond_to(:move_to_top) }
        it { should respond_to(:move_higher) }
        it { should respond_to(:move_lower) }
        it { should respond_to(:move_to_bottom) }
      end

      context "acts as markup" do
        subject { 
          Factory.create(:ecm_faq_item, :answer => "h1. This is a heading") 
        }

        it { should validate_presence_of(:markup_language) }   

        %w(markdown textile rdoc).each do |value|
          it { should allow_value(value).for(:markup_language) }
        end

        %w(some other values that are not allowed).each do |value|
          it { should_not allow_value(value).for(:markup_language) }
        end  

        context "answer.to_html" do
          specify { subject.answer.to_html.should eq("<h1>This is a heading</h1>") }
        end
      end

      context "friendly id" do
        subject { Factory.create(:ecm_faq_item, :question => 'What is 4 + 4?') }
        its(:to_param) { should eq('what-is-4-4') }
      end

      context "validations" do
        it { should validate_presence_of(:answer) }
        it { should validate_presence_of(:ecm_faq_category_id) }
        it { should validate_presence_of(:question) }

        it { should validate_uniqueness_of(:question).scoped_to(:ecm_faq_category_id) }
      end
    end
  end
end
