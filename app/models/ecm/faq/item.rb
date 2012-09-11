class Ecm::Faq::Item < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_faq_items'

  # associations
  belongs_to :ecm_faq_category, 
             :class_name => Ecm::Faq::Category, 
             :counter_cache => :ecm_faq_items_count

  # acts as list
  acts_as_list :scope => :ecm_faq_category

  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :answer ]

  # callbacks
  after_initialize :set_defaults  

  # constants
  MARKUP_LANGUAGES = %w(markdown textile rdoc)  

  # friendly id
  extend FriendlyId
  friendly_id :question, :use => :slugged

  # validations
  validates :answer, :presence => true
  validates :ecm_faq_category_id, :presence => true
  validates :markup_language, :presence  => true, 
                              :inclusion => MARKUP_LANGUAGES
  validates :question, :presence => true,
                       :uniqueness => { :scope => [:ecm_faq_category_id] }

  # private methods
  
  private 

#  def fix_updated_position
#    Rails.logger.debug "Fixing positions for #{self.to_s} (Moving to last)"
#    add_to_list_bottom
#  end

  def set_defaults
    if self.new_record?
      self.markup_language ||= 'textile'
    end  
  end
end
