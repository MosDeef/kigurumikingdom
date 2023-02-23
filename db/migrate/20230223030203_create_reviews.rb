class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.float :rating
      t.text :comment
      t.references :user, foreign_key: true
      t.references :mascot, foreign_key: true

      t.timestamps
    end
  end
end
