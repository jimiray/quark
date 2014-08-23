user = User.create!(name: 'Admin User', email: 'admin@example.com', password: 'test1234', password_confirmation: 'test1234')
%w(Astronomy).each do |category|
  Category.create(name: category)
end
article = Article.create!(user_id: user.id,
                          title: 'Welcome to Quark',
                          preview: 'Welcome to Quark, this is a blog about astronomy.',
                          body: 'About Quark gose here!',
                          category_id: Category.first.id)
