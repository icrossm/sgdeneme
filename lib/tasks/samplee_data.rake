require 'faker'

namespace :db do 
  desc "Fill database with sample data "
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke
    User.create!(:name =>"user",
                :email =>"user@example.com",
                :password =>"foobar",
                :password_confirmation => "foobar")
    
    99.times do |n|
      
      name= Faker::Name.name
      email="examplee-#{n+1}@example.com"
      password="password"
      password_confirmation="password_confirmation"
      
      User.create!(:name =>name,
                   :email => email,
                   :pasword => password,
                   :password_confirmation => password_confirmation)
  end
  end
    
  end