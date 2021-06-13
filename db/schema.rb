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

ActiveRecord::Schema.define(version: 2021_06_12_125121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_apply_houses", force: :cascade do |t|
    t.bigint "house_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_apply_houses_on_client_id"
    t.index ["house_id"], name: "index_client_apply_houses_on_house_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "entity_id"
    t.string "name"
    t.integer "duration"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_contracts_on_entity_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.bigint "entity_id"
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_document_types_on_entity_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "document_type_id"
    t.bigint "approver_id"
    t.string "status", default: "draft"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["approver_id"], name: "index_documents_on_approver_id"
    t.index ["client_id"], name: "index_documents_on_client_id"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "houses", force: :cascade do |t|
    t.bigint "contract_id"
    t.string "house_number"
    t.string "street"
    t.string "city"
    t.string "post_code"
    t.string "status", default: "draft"
    t.string "max_people"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "agent_id"
    t.string "description"
    t.datetime "start_at"
    t.integer "deposit_amount"
    t.integer "price"
    t.integer "length_of_contract"
    t.string "state"
    t.string "name"
    t.index ["agent_id"], name: "index_houses_on_agent_id"
    t.index ["contract_id"], name: "index_houses_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "entity_id"
    t.string "email"
    t.string "subdomain"
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["entity_id"], name: "index_users_on_entity_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "houses", "users", column: "agent_id"
end
