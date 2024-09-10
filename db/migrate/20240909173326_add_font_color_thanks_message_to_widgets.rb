class AddFontColorThanksMessageToWidgets < ActiveRecord::Migration[7.1]
  def change
    add_column :widgets, :font_color, :string
    add_column :widgets, :thanks_message, :string
  end
end
