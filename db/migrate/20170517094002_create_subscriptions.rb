class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :course
      t.references :user
      t.date :date

      t.timestamps
    end
  end
end
