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
usr3 = User.create(:user_name => "Admin", :password => "password", :is_admin => true)

cre = Creator.create(:name => "HajenKaj", :password => "111111")
# app1.users << usr1
# app2.users << usr1
sys1 = Systembolag.create(:name => "Hampus Bar skåp", :description => "Olagligt men gott", :creator_id => cre.id)
sys2 = Systembolag.create(:name => "Bengts Bar skåp", :description => "Olagligt men gott", :creator_id => cre.id)
sys3 = Systembolag.create(:name => "Stinas Bar skåp", :description => "Olagligt men gott", :creator_id => cre.id)
# app3.users << usr2
tag1 = Tag.create(:name => "TAGGA DÅ!", :creator_id => cre.id)
tag2 = Tag.create(:name => "TAGGA ORDENTLIGT DÅ!", :creator_id => cre.id)
tag3 = Tag.create(:name => "Tagga inte så mycket!", :creator_id => cre.id)

poss1 = Position.create(:adress => "Stagneliusgatan 1B, 392 34 Kalmar", :systembolag_id => sys1.id)
poss2 = Position.create(:adress => "Fiskaregatan 12, 392 32 Kalmar", :systembolag_id => sys2.id)
poss3 = Position.create(:adress => "Västerlånggatan 21, 392 33 Kalmar", :systembolag_id => sys3.id)

sys1.tags << tag1
sys2.tags << tag2
sys3.tags << tag3

usr1.applikations << app1
usr1.applikations << app2
usr2.applikations << app3
