class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
