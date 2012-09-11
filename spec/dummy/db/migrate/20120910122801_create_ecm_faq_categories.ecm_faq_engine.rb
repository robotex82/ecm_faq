# This migration comes from ecm_faq_engine (originally 1)
class CreateEcmFaqCategories < ActiveRecord::Migration
  def change
    create_table :ecm_faq_categories do |t|
      t.string :locale
      t.string :name
      t.text :short_description
      t.text :long_description
      t.string :markup_language

      # associations
      t.integer :ecm_faq_items_count, :default => 0, :null => false

      # awesome nested set
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id
      t.integer :depth

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
