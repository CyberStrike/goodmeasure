# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_list = [
  [ "walter", "Walter", "Latimer", "walter@walterlatimer.com", true ],
  [ "julie", "Julie", "Kramer", "thejuliekramer@gmail.com", true ],
  [ "bryan", "Bryan", "Perez", "bryan@webphenoms.com", true ],
  [ "eddroid", "Ed", "Toro", "ed@toro.net", false ],
  [ "hector", "Hector", "Garcia", "hector@garcia.net", false ],
  [ "juha", "Juha", "Mikkola", "juha@wyncode.co", false ],
  [ "johanna", "Jo", "Mikkola", "jo@wyncode.co", false ],
  [ "chris", "Chris", "Scott", "chris@wyncode.co", false ],
  [ "bryce", "Bryce", "Lastname", "bryce@lastname.co.uk", false ],
]

user_list.each do |username, first, last, email, admin|
  User.create(username: username,
	first_name: first,
	last_name: last,
	email: email,
	password:'password',
	admin: admin,
	school_id:1)
end

School.create(name:'Wyncode', subdomain:'wyncode', description:'Lorem Ipsum')

Role.create(title:'Student')
Role.create(title:'TA')
Role.create(title:'Instructor')
