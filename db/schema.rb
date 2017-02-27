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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170227202925) do

  create_table "recipes", force: :cascade do |t|
    t.string   "recipe_name"
    t.string   "kitchen"
    t.string   "type_of_food"
    t.string   "how_many_people_serves"
    t.string   "preparation_time"
    t.string   "difficulty_level"
    t.string   "ingredients"
    t.string   "step_by_step"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
