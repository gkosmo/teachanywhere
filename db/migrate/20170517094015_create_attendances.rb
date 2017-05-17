class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.string :status
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
