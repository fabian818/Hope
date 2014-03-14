# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140312162413) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "person_id"
    t.string   "title"
    t.text     "body"
    t.date     "reg_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.integer  "person_id"
    t.boolean  "targa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "dni"
    t.string   "name"
    t.string   "paternal_last"
    t.string   "maternal_last"
    t.integer  "years"
    t.string   "sex"
    t.string   "address"
    t.date     "date_birth"
    t.integer  "permission"
    t.boolean  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "patient_id"
    t.integer  "person_id"
    t.string   "title"
    t.text     "body"
    t.integer  "level"
    t.datetime "reg_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "visit_id"
    t.text     "description"
    t.date     "reg_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "specialists", force: true do |t|
    t.integer  "person_id"
    t.string   "speciality"
    t.string   "shift"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "specialist_id"
    t.string   "treatment_type"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: true do |t|
    t.integer  "treatment_id"
    t.datetime "assistance_date"
    t.string   "visit_type"
    t.text     "observation"
    t.boolean  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
