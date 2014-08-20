user = User.create!(name: 'Admin User', email: 'admin@example.com', password: 'test1234', password_confirmation: 'test1234')
article = Article.create!(user_id: user.id, title: 'Welcome to Quark', body: 'About Quark gose here!')
t1 = Tag.create!(name: 'welcome')
article.tags << t1
