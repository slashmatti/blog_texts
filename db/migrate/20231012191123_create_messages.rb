class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.text :content
      t.references :widget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
