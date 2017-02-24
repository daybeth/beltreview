class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :joins, :users
    add_foreign_key :joins, :events
  end
end
