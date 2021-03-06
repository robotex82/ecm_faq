# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120911134026) do

  create_table "ecm_faq_categories", :force => true do |t|
    t.string   "locale"
    t.string   "name"
    t.text     "short_description"
    t.text     "long_description"
    t.string   "markup_language"
    t.integer  "ecm_faq_items_count", :default => 0, :null => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.string   "slug"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "ecm_faq_items", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "ecm_faq_category_id"
    t.integer  "position"
    t.string   "markup_language"
    t.datetime "published_at"
    t.string   "slug"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
