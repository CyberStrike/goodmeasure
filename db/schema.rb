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

ActiveRecord::Schema.define(version: 20140616215728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cohorts", ["school_id"], name: "index_cohorts_on_school_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["submission_id"], name: "index_comments_on_submission_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["cohort_id"], name: "index_enrollments_on_cohort_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "submission"
    t.boolean  "correctness"
    t.integer  "percieved_points"
    t.integer  "actual_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["task_id"], name: "index_submissions_on_task_id", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.text     "description"
    t.boolean  "visibility"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["unit_id"], name: "index_tasks_on_unit_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cohort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["cohort_id"], name: "index_units_on_cohort_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "pasword"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
