class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title,  null: false
      t.text :content,  null: false
      t.integer :urgency,  null: false
      t.integer :who,  null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
