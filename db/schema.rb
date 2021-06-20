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

ActiveRecord::Schema.define(version: 20_210_611_082_911) do
  create_table 'events', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'name'
    t.text 'detail'
    t.text 'remarks'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.string 'place'
    t.boolean 'release'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'group_users', force: :cascade do |t|
    t.integer 'group_id'
    t.integer 'user_id'
    t.boolean 'invitation', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'images', force: :cascade do |t|
    t.integer 'event_id'
    t.string 'image_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'maps', force: :cascade do |t|
    t.integer 'event_id'
    t.string 'name'
    t.text 'address'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tag_relationships', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[event_id tag_id], name: 'index_tag_relationships_on_event_id_and_tag_id', unique: true
    t.index ['event_id'], name: 'index_tag_relationships_on_event_id'
    t.index ['tag_id'], name: 'index_tag_relationships_on_tag_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'profile_image_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
