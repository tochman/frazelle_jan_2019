# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sports = Category.create(name: "sports")
tech =	Category.create(name: "tech")
local = Category.create(name: "local")
global = Category.create(name: "global")
entertainment = Category.create(name: "entertainment")
politics = Category.create(name: "politics")

article1 = Article.create(title: "The Hub News is the site of the moment", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 1, status: "free")
article2 = Article.create(title: "Spring hasn't arrived in Sweden yet", content: "Ice can be still spotted on the street, watch out!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 2, status: "restricted")
article3 = Article.create(title: "Eating cinnamon buns increases life expectancy", content: "Researchers are running clinical studies to see the benefits of cinnamon buns consumption. Some state that it might be", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 3, status: "restricted")
article4 = Article.create(title: "The Hub News is the site of the moment", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 4, status: "free")
article5 = Article.create(title: "The Hub News is the site of the moment", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 5, status: "free")

journalist = User.create(email: "ali@lola.com", password: "password", role: 1)
editor = User.create(email: "laura@ca.com", password: "password", role: 2)
article4 = Article.create(title: "Something happened in the World", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 4, status: "free")
article5 = Article.create(title: "Game of Thrones last season is out soon!", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 5, status: "free")
article6 = Article.create(title: "Silicon Valley Season 6 coming soon?", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 5, status: "free")
article7 = Article.create(title: "Hockey is good for your kids", content: "Great articles! This site's popularity is raising so quick!", image:"https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg", category_id: 1, status: "free")
