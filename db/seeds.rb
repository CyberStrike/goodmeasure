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
  [ "frank", "Frank", "Ortiz", "frank@wyncode.co", false ],
  [ "pk", "PK", "Lastname", "pk@wyncode.co", false ],
  [ "matt", "Matt", "Lastname", "matt@wyncode.co", false ],
  [ "sara", "Sara", "Lastname", "sara@wyncode.co", false ],
  [ "janvier", "Janvier", "Lastname", "janvier@wyncode.co", false ],
  [ "javier", "Javier", "Lastname", "javier@wyncode.co", false ],
  [ "darrell", "Darrell", "Lastname", "darrell@wyncode.co", false ],
  [ "joey", "Joey", "Brazinzki", "joey@wyncode.co", false ],
  [ "jordan", "Jordan", "Robowitz", "jordan@wyncode.co", false ],
  [ "crystalei", "Crystalei", "Daneils", "crystalei@wyncode.co", false ]
]

cohorts_list = [
  ["Cohort 1", "This is Wyncode's first ever Cohort, running from May 5 to July 2, 2014."],
  ["Cohort 2", "This is Wyncode's second Cohort, running from July 30th to October 2, 2014."],
  ["Cohort 3", "The third Cohort with over 20 students."],
  ["Cohort 4", "Wyncode's fourth cohort and first cohort of 2015."],
  ["Cohort 5", "The largest ever Cohort for Wyncode, with 25 students."],
]

unit_list = [
  ["Ruby Syntax", "Ruby is a Turing complete programming language. It was created in the mid-90s
    by Japanese computer scientist and software programmer Yukihiro 'Matz' Matsumoto." ],
  ["Ruby Data Types", "Recall the Ruby syntax from the previous lecture. Like an English sentence, it has a 
    subject. The subject has a list of allowed methods, which we can view by using the 
    “methods” method. Each method is applied to a list of arguments." ],
  ["Intro to Boolean Objects", "Boolean Algebra is a part of algebra that was introduced in 1854 by George Boole. 
    It helped to bridge the gap between the philosophical logic of Aristotle and math by introducing mathematical 
    quations to represent Aristotle’s arguments." ],
  ["Flow Control", "The reason why statements using if/else are called flow control is because it allows 
    you to change the way Ruby flows through a program. Instead of reading every line 
    from top to bottom, Ruby will skip over lines based on a boolean value." ],
]

task_list = [
  ["Ruby Data Types - Fixnum","Write a number large enough such that calling the “class” method returns Bignum rather than Fixnum. How many digits long was it?"],
  ["Ruby Data Types - Float","If you round -1.5, is the answer -1 or -2?"],
  ["Ruby Data Types - String","Which is “greater”, “A” or “a”?"],
  ["Ruby Data Types - Array","Using a combination of Array’s join method and String’s split method, write a line of code that converts [1,2,3] into ['1', '2', '3']."],
]


School.create(
  name: "Wyncode",
  description: "Wyncode is a development bootcamp immersing ambitious individuals in a demanding and inspiring learning environment engineered to develop successful coders with business acumen.",
  subdomain: "wyncode"
  )

user_list.each do |username, first, last, email, admin|
  User.create(username: username,
	first_name: first,
	last_name: last,
	email: email,
	password:'password',
	admin: admin,
	school_id:1)
end

cohorts_list.each do |name, description|
  Cohort.create(name: name,
  description: description,
  school_id: 1)
end

unit_list.each do |name, description|
  Unit.create(name: name, 
  description: description, 
  cohort_id: 1)
end

task_list.each do |title, description|
  Task.create(title: title,
  description: description,
  unit_id: 1)
end



School.create(name:'Wyncode', subdomain:'wyncode', description:'A development boot camp immersing students in a demanding and inspiring learning environment engineered to develop successful coders with business acumen.')

Role.create(title:'Student')
Role.create(title:'TA')
Role.create(title:'Instructor')

