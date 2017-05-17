class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :course
      t.date :date
      t.text :content
      t.string :title
      t.float :latitude
      t.float :longitude
      t.integer :min_attendance
      t.integer :max_attendance
      t.references :user

      t.timestamps
    end
  end
end
