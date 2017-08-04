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

ActiveRecord::Schema.define(version: 20170804183355) do

  create_table "children", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "date_of_birth"
    t.text "goals", default: "", null: false
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_children_on_employee_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "title", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_contacts_on_child_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "child_id"
    t.text "content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_notes_on_child_id"
  end

end
