# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brandon = User.create(name: "Brandon Hopkins", email: "bh@foo.com", password: "password123", password_confirmation: "password123")
tyler = User.create(name: "Tyler Durden", email: "td@foo.com", password: "password123", password_confirmation: "password123")
randall = User.create(name: "Randall Reed Jr.", email: "rr@foo.com", password: "password123", password_confirmation: "password123")
michael = User.create(name: "Michael", email: "m@foo.com", password: "password123", password_confirmation: "password123")
hercules = User.create(name: "Hercules", email: "h@foo.com", password: "password123", password_confirmation: "password123")

project_mayhem = Project.new(title: "Project Mayhem", description: "Havin some fun", status: "planning", admin_id: "#{tyler.id}")
project_node = Project.new(title: "Project Node", description: "Learning node", status: "planning", admin_id: "#{brandon.id}")
project_fun = Project.new(title: "Project Fun", description: "Having a lot more fun", status: "completed", admin_id: "#{michael.id}")

brandon.projects << project_mayhem
randall.projects << project_node
tyler.projects << [project_mayhem, project_node]
michael.projects << [project_fun, project_node, project_mayhem]

brandon.save
randall.save
tyler.save
michael.save

internet = Category.create(name: "Internet")
business = Category.create(name: "Business")

ruby = Skill.create(name: "ruby")
node = Skill.create(name: "node")
marketing = Skill.create(name: "marketing")
copywriting = Skill.create(name: "copywriting")
python = Skill.create(name: "python")
database_administration = Skill.create(name: "database administration")


internet.skills << [ruby, node]
business.skills << [marketing, copywriting]

internet.save
business.save

brandon.skills << [ruby, marketing]
tyler.skills << [node, marketing, copywriting]
randall.skills << node
michael.skills << marketing

brandon.save
tyler.save
randall.save
michael.save

UserProject.create(user_id: "#{brandon.id}", project_id: "#{project_fun.id}", approved: true)
UserProject.create(user_id: "#{randall.id}", project_id: "#{project_fun.id}", approved: false)

# users who have no projects 
# users who have been approved 
# users who are admins



