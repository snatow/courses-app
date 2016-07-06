class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :courses, :students do |t|
      t.integer :course_id
      t.integer :student_id
    end
  end
end
