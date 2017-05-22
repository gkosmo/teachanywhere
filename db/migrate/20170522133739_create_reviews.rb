class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rewiew_id
      t.string :review_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
