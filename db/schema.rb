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

ActiveRecord::Schema.define(version: 20170401172521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "change_order_requests", force: :cascade do |t|
    t.integer "project_id"
    t.text    "description"
    t.boolean "approved"
    t.integer "trade_id"
    t.boolean "backcharge_to_trade"
    t.boolean "contract"
    t.decimal "contract_amount"
    t.string  "contract_document"
    t.boolean "time_and_material"
    t.index ["project_id"], name: "index_change_order_requests_on_project_id", using: :btree
    t.index ["trade_id"], name: "index_change_order_requests_on_trade_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer "parent_id"
    t.string  "parent_type"
    t.text    "content"
    t.integer "user_id"
    t.index ["parent_type", "parent_id"], name: "index_comments_on_parent_type_and_parent_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "date_change_requests", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "event_id"
    t.string   "reason"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "approved"
    t.text     "trades_affected"
    t.index ["event_id"], name: "index_date_change_requests_on_event_id", using: :btree
    t.index ["project_id"], name: "index_date_change_requests_on_project_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.string  "image"
    t.integer "folder_id"
    t.index ["project_id"], name: "index_documents_on_project_id", using: :btree
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "drawings", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "file"
    t.integer "project_id"
    t.index ["project_id"], name: "index_drawings_on_project_id", using: :btree
    t.index ["user_id"], name: "index_drawings_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "priority"
    t.integer  "project_id"
    t.boolean  "email_notification"
  end

  create_table "folders", force: :cascade do |t|
    t.integer "project_id"
    t.string  "name"
    t.index ["project_id"], name: "index_folders_on_project_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.integer "project_id"
    t.text    "content"
    t.integer "user_id"
    t.index ["project_id"], name: "index_notes_on_project_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "project_id"
    t.integer "parent_id"
    t.string  "parent_type"
    t.index ["parent_type", "parent_id"], name: "index_notifications_on_parent_type_and_parent_id", using: :btree
    t.index ["project_id"], name: "index_notifications_on_project_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer "user_id"
    t.string  "image"
    t.integer "project_id"
    t.index ["project_id"], name: "index_photos_on_project_id", using: :btree
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.integer "role"
    t.integer "trade_id"
    t.index ["project_id"], name: "index_project_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_users_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.text    "address"
    t.text    "description"
    t.integer "property_type"
    t.string  "landlord"
    t.text    "architect_info"
    t.text    "general_contractor_info"
    t.boolean "allow_drawings"
    t.boolean "allow_photos"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "project_id"
    t.string  "name"
    t.index ["project_id"], name: "index_trades_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
