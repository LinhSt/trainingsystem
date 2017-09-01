class CreateUsersCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :users_courses do |t|
      t.integer :course_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
