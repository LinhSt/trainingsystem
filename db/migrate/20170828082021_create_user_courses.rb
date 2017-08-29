class CreateUserCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :status

      t.timestamps
    end
  end
end
