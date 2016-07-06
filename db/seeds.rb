# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.delete_all
Student.delete_all

bob = Student.create(first_name: "Bob", last_name: "Smith")
john = Student.create(first_name: "John", last_name: "Williams")
emily = Student.create(first_name: "Emily", last_name: "Johnson")

math = Course.create(course_name: "Math 101")
english = Course.create(course_name: "English 101")
history = Course.create(course_name: "US History 101")

math.students.push(bob)
english.students.push(john)
history.students.push(emily)
