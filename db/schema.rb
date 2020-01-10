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

ActiveRecord::Schema.define(version: 2019_12_07_064722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "alt_phone"
    t.string "about"
    t.string "image_url"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string "full_name"
    t.string "code"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "about"
    t.text "description"
    t.string "website"
    t.boolean "archived"
    t.datetime "deleted_at"
    t.bigint "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_colleges_on_agent_id"
  end

  create_table "course_interests", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_interests_on_course_id"
    t.index ["interest_id"], name: "index_course_interests_on_interest_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "full_name"
    t.string "short_name"
    t.string "about"
    t.text "description"
    t.boolean "archived"
    t.datetime "deleted_at"
    t.bigint "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_courses_on_college_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "parent_interest_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_leads_on_course_id"
    t.index ["student_id"], name: "index_leads_on_student_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "url"
    t.string "media_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_media_on_imageable_type_and_imageable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "student_id"
    t.string "user_name"
    t.string "phone"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "star"
    t.string "title"
    t.string "description"
    t.string "pros"
    t.string "cons"
    t.string "advice"
    t.bigint "college_id"
    t.bigint "student_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_ratings_on_college_id"
    t.index ["student_id"], name: "index_ratings_on_student_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.bigint "student_id"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_references_on_student_id"
  end

  create_table "student_interests", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "interest_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_student_interests_on_interest_id"
    t.index ["student_id"], name: "index_student_interests_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "alt_phone"
    t.string "referral_code"
    t.string "referred_by"
    t.string "image_url"
    t.string "city"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "author_name"
    t.string "description"
    t.bigint "college_id"
    t.string "about_author"
    t.date "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_testimonials_on_college_id"
  end

  add_foreign_key "colleges", "agents"
  add_foreign_key "course_interests", "courses"
  add_foreign_key "course_interests", "interests"
  add_foreign_key "courses", "colleges"
  add_foreign_key "leads", "courses"
  add_foreign_key "leads", "students"
  add_foreign_key "messages", "students"
  add_foreign_key "ratings", "colleges"
  add_foreign_key "ratings", "students"
  add_foreign_key "references", "students"
  add_foreign_key "student_interests", "interests"
  add_foreign_key "student_interests", "students"
  add_foreign_key "testimonials", "colleges"
end
