class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50, default: ''

      t.datetime :created_at, null: false
    end
  end
end
