class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title,  null: false
      t.text :content,  null: false
      t.datetime :start
      t.datetime :end
      t.integer :category_id,  null: false
      t.integer :urgency_id,  null: false
      t.integer :who_id,  null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
