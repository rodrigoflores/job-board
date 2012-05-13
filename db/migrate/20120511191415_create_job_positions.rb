class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.string :position
      t.text :description
      t.date :start_date

      t.integer :company_id

      t.timestamps
    end
  end
end
