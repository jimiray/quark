admins = [
 {name: 'Admin User', email: 'admin@nurdgurls.com', password: 'test1234', password_confirmation: 'test1234'},
]

admins.each do |admin|
  unless User.find_by(email: admin[:email])
    user = User.create!(admin)
    user.roles << :admin
    user.save
  end
end

categories = [
  "Nature",
  "Astrophysics",
  "Climate",
  "Health and Medicine",
]

categories.each do |category|
  Category.find_or_create_by(name: category)
end

article = Article.create!(user_id: user.id,
                          title: 'Welcome to Quark',
                          preview: 'Welcome to Quark, this is a blog about astronomy.',
                          body: 'About Quark gose here!',
                          category_id: Category.first.id)
