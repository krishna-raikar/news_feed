class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :content, default: ''

      t.datetime :created_at, null: false
    end
  end
end