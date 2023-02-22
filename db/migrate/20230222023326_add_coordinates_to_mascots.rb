class AddCoordinatesToMascots < ActiveRecord::Migration[7.0]
  def change
    add_column :mascots, :latitude, :float
    add_column :mascots, :longitude, :float
  end
end
