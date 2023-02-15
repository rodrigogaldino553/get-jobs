class CreateApiV1Jobs < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_jobs do |t|
      t.string :title
      t.text :description
      t.date :expires_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
