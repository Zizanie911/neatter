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
  email: "beatrice@gmail.com",
  password: "secret",
  username: "Bea"
)
user.save!

day = Day.new(
  today: Date.today,
  passed: false
)
day.user = user
day.save!

task = Task.new(
  name: "Yoga",
  details: "don't forget your mat!",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00"),
  duration: 45,
  days: [2, 4]
)
task.user = user
task.save!

task = Task.new(
  name: "Running",
  details: "don't forget your mat!",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00"),
  duration: 45,
  mark_as_done: true,
  days: [2, 3, 4, 5]
)
task.user = user
task.save!
task = Task.new(
  name: "play guitar",
  details: "Rock and Roll",
  priority: false,
  start_at: Time.parse("#{Date.today} 16:00"),
  duration: 45,
  mark_as_done: true,
  days: [2, 3, 4, 5]
)
task.user = user
task.save!

task = Task.new(
  name: "Send email to Matthieu",
  details: "matthieu@gmail.com",
  mark_as_done: true,
  priority: true,
  start_at: Date.today
)
task.user = user
task.save!

task = Task.new(
  name: "Book hotel",
  priority: true,
  start_at: Date.today
)
task.user = user
task.save!

task = Task.new(
  name: "Buy beers",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today
)
task.user = user
task.save!

puts "Creating 1 user and 3 tasks yesterday ..."

3.times do task = Task.new(
    name: "Buy beers",
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
  name: "Buy beers",
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
  name: "Buy beers",
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
  name: "Buy beers",
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
  name: "Buy beers",
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
  name: "Buy beers",
  details: "",
  priority: false,
  mark_as_done: true,
  start_at: Date.today - 3.days
  )
  task.user = user
  task.save!
end


3.times do task = Task.new(
  name: "Buy beers",
  details: "",
  priority: false,
  mark_as_done: true,
  days: [1, 3, 4],
  start_at: Date.today - 1.days
  )
  task.user = user
  task.save!
end

task = Task.new(
  name: "Buy Soda",
  details: "",
  priority: false,
  mark_as_done: false,
  days: [1, 3, 4],
  start_at: Date.today
)
task.user = user
task.save!
