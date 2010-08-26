# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

admin_role = Role.new do |role|
  role.name = "admin"
end
admin_role.save!

admin = User.new do | user |
  user.login    = 'admin@419scammers.com'
  user.password = user.password_confirmation = 'secret'
  
  user.name = 'Superadmin'
  user.email      = 'admin@419scammers.com'
  user.roles << admin_role
end
admin.save!

puts "Created default user '#{admin.login}' with password '#{admin.password}'."
