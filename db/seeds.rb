# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# faire rake db:reset pour effacer/refaire base de données
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({firstname: "Daphné", lastname:"Bordel", email: "daphne.bordel@gmail.com", rights: "Super admin"})
Article.create({title: "Toto va à la plage", picture:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Colombus_Isle.JPG/1200px-Colombus_Isle.JPG", resume:"Toto a passé une super journée à la plage", date:DateTime.now, author: "Moi"})
