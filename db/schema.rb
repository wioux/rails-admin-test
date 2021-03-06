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

ActiveRecord::Schema.define(version: 20170816215645) do

  create_table "blog_post_translations", force: :cascade do |t|
    t.integer  "blog_post_id", null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.text     "body"
  end

  add_index "blog_post_translations", ["blog_post_id"], name: "index_blog_post_translations_on_blog_post_id"
  add_index "blog_post_translations", ["locale"], name: "index_blog_post_translations_on_locale"

  create_table "blog_posts", force: :cascade do |t|
    t.boolean  "published"
    t.boolean  "promoted"
    t.integer  "id_from_kittens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts_issues", force: :cascade do |t|
    t.integer "blog_post_id"
    t.integer "issue_id"
  end

  add_index "blog_posts_issues", ["blog_post_id"], name: "index_blog_posts_issues_on_blog_post_id"
  add_index "blog_posts_issues", ["issue_id"], name: "index_blog_posts_issues_on_issue_id"

  create_table "blog_posts_legal_cases", id: false, force: :cascade do |t|
    t.integer "blog_post_id"
    t.integer "legal_case_id"
  end

  add_index "blog_posts_legal_cases", ["blog_post_id"], name: "index_blog_posts_legal_cases_on_blog_post_id"
  add_index "blog_posts_legal_cases", ["legal_case_id"], name: "index_blog_posts_legal_cases_on_legal_case_id"

  create_table "blog_posts_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "blog_post_id"
  end

  add_index "blog_posts_users", ["blog_post_id"], name: "index_blog_posts_users_on_blog_post_id"
  add_index "blog_posts_users", ["user_id"], name: "index_blog_posts_users_on_user_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "issues", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.string   "ancestry"
    t.integer  "position"
    t.integer  "id_from_kittens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["ancestry"], name: "index_issues_on_ancestry"

  create_table "legal_cases", force: :cascade do |t|
    t.string   "title"
    t.integer  "id_from_kittens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context"
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type"
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "updates", force: :cascade do |t|
    t.string   "content_type", null: false
    t.integer  "content_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["content_type"], name: "index_updates_on_content_type"

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
    t.integer  "id_from_kittens"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.text     "object_changes", limit: 1073741823
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id"

end
