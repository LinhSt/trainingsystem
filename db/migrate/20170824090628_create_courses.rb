class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.date :start_time
      t.date :end_time
      t.integer :status, default: "1"
      t.timestamps
    end
  end
end
