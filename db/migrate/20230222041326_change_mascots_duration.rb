class ChangeMascotsDuration < ActiveRecord::Migration[7.0]
  def change
    change_column :mascots, :duration,:integer, using: "duration::integer"
  end
end
