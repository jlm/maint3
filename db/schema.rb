# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_06_231918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "events", id: :serial, force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.date "end_date"
    t.string "name"
    t.integer "project_id"
    t.string "url"
    t.index ["project_id"], name: "index_events_on_project_id"
  end

  create_table "imports", id: :serial, force: :cascade do |t|
    t.string "content_type"
    t.datetime "created_at", precision: nil, null: false
    t.string "filename"
    t.boolean "imported"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "clause"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "draft"
    t.string "latest_status"
    t.bigint "minst_id", null: false
    t.string "number"
    t.string "standard"
    t.text "subject"
    t.datetime "updated_at", null: false
    t.index ["minst_id"], name: "index_items_on_minst_id"
    t.index ["number"], name: "index_items_on_number"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "location"
    t.string "meetingtype"
    t.string "minutes_url"
    t.datetime "updated_at", null: false
  end

  create_table "minsts", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_minsts_on_code"
    t.index ["name"], name: "index_minsts_on_name"
  end

  create_table "minutes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.bigint "item_id", null: false
    t.bigint "meeting_id", null: false
    t.bigint "minst_id", null: false
    t.string "status"
    t.text "text"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_minutes_on_item_id"
    t.index ["meeting_id"], name: "index_minutes_on_meeting_id"
    t.index ["minst_id"], name: "index_minutes_on_minst_id"
  end

  create_table "motions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "meeting_id"
    t.string "motion_text"
    t.integer "number"
    t.integer "project_id"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["meeting_id"], name: "index_motions_on_meeting_id"
    t.index ["project_id"], name: "index_motions_on_project_id"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "affiliation"
    t.datetime "created_at", precision: nil, null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "task_group_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "award"
    t.integer "base_id"
    t.datetime "created_at", precision: nil, null: false
    t.string "csd_url"
    t.string "designation"
    t.string "draft_no"
    t.string "draft_url"
    t.string "files_url"
    t.string "last_motion"
    t.date "mec"
    t.string "next_action"
    t.string "page_url"
    t.date "par_approval"
    t.date "par_expiry"
    t.string "par_url"
    t.date "pool_formed"
    t.string "project_type"
    t.date "published"
    t.string "short_title"
    t.date "standard_approval"
    t.string "status"
    t.integer "task_group_id"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["base_id"], name: "index_projects_on_base_id"
    t.index ["designation"], name: "index_projects_on_designation", unique: true
    t.index ["task_group_id"], name: "index_projects_on_task_group_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "clauseno"
    t.string "clausetitle"
    t.string "company"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "email"
    t.text "impact"
    t.bigint "item_id", null: false
    t.string "name"
    t.text "proposal"
    t.text "rationale"
    t.text "reqtxt"
    t.string "standard"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_requests_on_item_id"
  end

  create_table "task_groups", id: :serial, force: :cascade do |t|
    t.string "abbrev"
    t.integer "chair_id"
    t.datetime "created_at", precision: nil, null: false
    t.string "name"
    t.string "page_url"
    t.integer "person_id"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["chair_id"], name: "index_task_groups_on_chair_id"
    t.index ["person_id"], name: "index_task_groups_on_person_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.boolean "admin", default: false
    t.datetime "confirmation_sent_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.boolean "debugger", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0
    t.datetime "last_sign_in_at", precision: nil
    t.inet "last_sign_in_ip"
    t.datetime "locked_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "projects"
  add_foreign_key "items", "minsts"
  add_foreign_key "minutes", "items"
  add_foreign_key "minutes", "meetings"
  add_foreign_key "minutes", "minsts"
  add_foreign_key "motions", "projects"
  add_foreign_key "people", "task_groups"
  add_foreign_key "projects", "task_groups"
  add_foreign_key "requests", "items"
  add_foreign_key "task_groups", "people"
end
