# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'admin',
            email: 'admin@prueba.com',
            name: 'Admin',
            lastname: 'Admin',
            password: 'sigma;omega',
            password_confirmation: 'sigma;omega',
            admin:true) unless User.count >= 1
          
Setting.create(app_name: 'ANA ERP',
            author: 'GuSS',
            app_description: 'Ana Not Another ERP') unless Setting.count >= 1
