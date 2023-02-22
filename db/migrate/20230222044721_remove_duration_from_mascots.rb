class RemoveDurationFromMascots < ActiveRecord::Migration[7.0]
  def change
    remove_column :mascots, :duration, :integer
  end
end
