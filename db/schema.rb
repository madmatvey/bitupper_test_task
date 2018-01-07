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

ActiveRecord::Schema.define(version: 20180107140622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "prvkey"
    t.string   "pubkey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", id: false, force: :cascade do |t|
    t.string   "blhash",                    null: false
    t.jsonb    "bldata",     default: "{}", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["bldata"], name: "index_blocks_on_bldata", using: :gin
    t.index ["blhash"], name: "index_blocks_on_blhash", unique: true, using: :btree
  end

  create_table "txes", id: false, force: :cascade do |t|
    t.string   "txhash",                    null: false
    t.jsonb    "txdata",     default: "{}", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["txdata"], name: "index_txes_on_txdata", using: :gin
    t.index ["txhash"], name: "index_txes_on_txhash", unique: true, using: :btree
  end

end
