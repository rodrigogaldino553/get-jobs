class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.date :limit_date
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
