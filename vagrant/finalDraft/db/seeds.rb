# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


app1 = Applikation.create(:app_name => "App1", :app_key => "Key1")
app2 = Applikation.create(:app_name => "App2", :app_key => "Key2")
app3 = Applikation.create(:app_name => "App3", :app_key => "Key3")

usr1 = User.create(:user_name => "User1", :password => "password")
usr2 = User.create(:user_name => "User2", :password => "password")


# app1.users << usr1
# app2.users << usr1
#
# app3.users << usr2


usr1.applikations << app1
usr1.applikations << app2
usr2.applikations << app3
