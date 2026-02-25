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

ActiveRecord::Schema.define(version: 2019_08_06_153027) do

  create_table "nice_competencies", force: :cascade do |t|
    t.string "name"
    t.string "competency_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nice_categories", force: :cascade do |t|
    t.string "name"
    t.string "category_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nice_knowledge_mappings", force: :cascade do |t|
    t.integer "nice_knowledge_id"
    t.integer "nice_work_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nice_knowledge_id"], name: "index_nice_knowledge_mappings_on_nice_knowledge_id"
    t.index ["nice_work_role_id"], name: "index_nice_knowledge_mappings_on_nice_work_role_id"
  end

  create_table "nice_knowledges", force: :cascade do |t|
    t.string "knowledge_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nice_skill_mappings", force: :cascade do |t|
    t.integer "nice_skill_id"
    t.integer "nice_work_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nice_skill_id"], name: "index_nice_skill_mappings_on_nice_skill_id"
    t.index ["nice_work_role_id"], name: "index_nice_skill_mappings_on_nice_work_role_id"
  end

  create_table "nice_skills", force: :cascade do |t|
    t.string "skill_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nice_task_mappings", force: :cascade do |t|
    t.integer "nice_task_id"
    t.integer "nice_work_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nice_task_id"], name: "index_nice_task_mappings_on_nice_task_id"
    t.index ["nice_work_role_id"], name: "index_nice_task_mappings_on_nice_work_role_id"
  end

  create_table "nice_tasks", force: :cascade do |t|
    t.string "task_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nice_work_roles", force: :cascade do |t|
    t.string "name"
    t.string "work_role_code"
    t.text "description"
    t.integer "nice_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "munge"
    t.text "opm_code"
  end

end
