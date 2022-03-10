# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying old seeds..."

User.destroy_all

puts "Creating 1 user and 4 tasks..."


user = User.new(
  email: "stephen@email.com",
  password: "123456",
  username: "Stephen"
)
user.save!

session = Session.new(
  today: Date.today
)
session.user = user
session.save!

task = Task.new(
  name: "Flashcards",
  details: "",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00")
  # duration: 45
)
task.user = user
task.tag_list.add("📖 learning")
task.save!

task = Task.new(
  name: "Buy new shirt",
  details: "",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00"),
  # duration: 45,
  mark_as_done: false
)
task.user = user
task.save!

task = Task.new(
  name: "Push app into production",
  details: "",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00"),
  # duration: 45,
  mark_as_done: true
)
task.user = user
task.tag_list.add("💻 work")
task.save!

task = Task.new(
  name: "Pitch prep",
  details: "",
  mark_as_done: false,
  priority: true,
  start_at: Date.today
)
task.user = user
task.tag_list.add("💻 work")
task.save!

task = Task.new(
  name: "Book AirBnb in Lisbon",
  priority: false,
  start_at: Date.today
)
task.user = user
task.tag_list.add("🏖 holidays")
task.save!

task = Task.new(
  name: "Yoga",
  details: "",
  priority: false,
  mark_as_done: false,
  start_at: Date.today,
  days: [1, 2, 3, 5, 6]
)
task.user = user
task.tag_list.add("🧘🏽‍♀️ well-being")
task.save!

task = Task.new(
  name: "Meditate",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today,
  days: [1, 2, 3, 5, 6]
)
task.user = user
task.tag_list.add("🧘🏽‍♀️ well-being")
task.save!

task = Task.new(
  name: "Learn Portuguese",
  details: "",
  priority: false,
  mark_as_done: false,
  start_at: Date.today,
  days: [1, 2, 3, 5, 6]
)
task.user = user
task.tag_list.add("📖 learning")
task.save!

task = Task.new(
  name: "Running",
  details: "",
  priority: false,
  mark_as_done: false,
  start_at: Date.today,
  days: [1, 2, 3, 5, 6]
)
task.user = user
task.tag_list.add(" 🥑 health", "🏃‍♂️ sport")
task.save!

puts "Creating 1 user and 3 tasks yesterday ..."

3.times do task = Task.new(
    name: "Swimming",
    details: "",
    priority: false,
    mark_as_done: false,
    start_at: Date.today - 1.days
  )
  task.user = user
  task.save!
end

puts "Creating 1 user and 2 tasks yesterday ..."
2.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 1.days
  )
  task.user = user
  task.save!
end

puts "Creating 1 user and 2 habits ..."
2.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 1.days
  )
  task.user = user
  task.save!
end

puts "Creating 1 user and 4 tasks yesterday ..."
1.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 2.days
  )
  task.user = user
  task.save!
end

puts "Creating 1 user and 2 habits ..."
4.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 2.days
  )
  task.user = user
  task.save!
end

puts "Creating 1 user and 2 habits ..."
3.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 3.days
  )
  task.user = user
  task.save!
end


3.times do task = Task.new(
  name: "Swimming",
  details: "",
  priority: false,
  mark_as_done: true,
  days: [1, 2],
  start_at: Date.today - 2.days
  )
  task.user = user
  task.save!
end

task = Task.new(
  name: "Buy Soda",
  details: "",
  priority: false,
  mark_as_done: false,
  days: [1, 2],
  start_at: Date.today - 2.days
)
task.user = user
task.save!


task = Task.new(
  name: "Monday's task",
  start_at: DateTime.parse("2022-03-01")
)
