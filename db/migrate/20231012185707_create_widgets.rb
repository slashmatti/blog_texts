class CreateWidgets < ActiveRecord::Migration[7.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :welcome_message
      t.string :background_color
      t.string :shape
      t.string :location
      t.string :client_id
      t.boolean :enabled, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
