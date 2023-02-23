Post.destroy_all
User.destroy_all

user = User.create!(
  email: 'test@test.com',
  password: '123456'
)

user_2 = User.create!(
  email: 'test2@test.com',
  password: '123456'
)

(1..20).each do |i|
  Post.create!(
    title: "post #{i}",
    content: 'dsadsa dsa sa dsa dsa dsa dsa dsadasdasd a ',
    user_id: user.id
  )
  Post.create!(
    title: "post 9 #{i}",
    content: 'kdsaoldkjosadi opadsosaiopd ads opadsiadaopdi op iosa diopasi dopi opds i',
    user_id: user_2.id
  )
end
