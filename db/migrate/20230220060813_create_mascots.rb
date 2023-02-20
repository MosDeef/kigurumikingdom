class CreateMascots < ActiveRecord::Migration[7.0]
  def change
    create_table :mascots do |t|
      t.string :name
      t.string :description
      t.string :duration
      t.string :location
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
