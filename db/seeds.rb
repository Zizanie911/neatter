# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying old seeds..."

User.destroy_all

puts "Creating 1 user..."

user = User.new(
  email: "stephen@neatt.com",
  password: "123456",
  username: "Stephen"
)
user.save!

puts "Creating 1 session..."

session = Session.new(
  today: Date.today
)
session.user = user
session.save!

puts "*** This week ***"

puts "Today - Thursday, March 10th - Creating 10 tasks..."

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
task.tag_list.add("💻 work")
task.save!

task = Task.new(
  name: "Send email to Matthieu",
  details: "matthieu@gmail.com",
  mark_as_done: true,
  priority: true,
  start_at: Date.today
)
task.user = user
task.tag_list.add("💻 work")
task.save!

task = Task.new(
  name: "Book hotel",
  priority: true,
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

puts "Yesterday - Wednesday, March 9th"
puts "Tasks..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("09/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("09/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("09/03/2022")
)
task.user = user
task.save!

puts "Habits..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("09/03/2022"),
  days: []
)
task.user = user
task.save!

puts "Tuesday, March 8th"
puts "Tasks..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("08/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("08/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("08/03/2022")
)
task.user = user
task.save!

puts "Habits..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("08/03/2022"),
  days: []
)
task.user = user
task.save!

puts "Monday, March 7th"

puts "Tasks..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("07/03/2022")
)
task.user = user
task.save!

puts "Habits..."

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("07/03/2022"),
  days: []
)
task.user = user
task.save!

puts "*** Last week ***"

puts "Sunday, March 6th"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("06/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("06/03/2022")
)
task.user = user
task.save!

puts "Saturday, March 5th"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("05/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("05/03/2022")
)
task.user = user
task.save!

puts "Friday, March 4th"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("04/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("04/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("04/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("04/03/2022")
)
task.user = user
task.save!

puts "Thursday, March 3rd"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("03/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("03/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("03/03/2022")
)
task.user = user
task.save!

puts "Wednesday, March 2nd"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("02/03/2022")
)
task.user = user
task.save!

task = Task.new(
  name: "Buy Soda",
  mark_as_done: false,
  start_at: Date.parse("02/03/2022")
)
task.user = user
task.save!

puts "Tuesday, March 1st"

task = Task.new(
  name: "Buy Soda",
  mark_as_done: true,
  start_at: Date.parse("01/03/2022")
)
task.user = user
task.save!
