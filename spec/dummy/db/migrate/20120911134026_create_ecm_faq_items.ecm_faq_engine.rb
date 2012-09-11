# This migration comes from ecm_faq_engine (originally 2)
class CreateEcmFaqItems < ActiveRecord::Migration
  def change
    create_table :ecm_faq_items do |t|
      t.text :question
      t.text :answer

      # associations
      t.references :ecm_faq_category

      # acts as list
      t.integer :position

      # acts as markup
      t.string :markup_language

      # acts as published
      t.timestamp :published_at

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
