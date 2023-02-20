class ChangeDescriptionToTextInMascots < ActiveRecord::Migration[7.0]
  def change
    change_column :mascots, :description, :text
  end
end
