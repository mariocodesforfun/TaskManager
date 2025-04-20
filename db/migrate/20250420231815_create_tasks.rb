class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.datetime :completed_at
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
