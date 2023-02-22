Post.destroy_all
User.destroy_all

user = User.create!(
  email: 'test@test.com',
  password: '123456'
)

(1..20).each do |i|
  Post.create!(
    title: "post #{i}",
    content: 'dsadsa dsa sa dsa dsa dsa dsa dsadasdasd a ',
    user_id: user.id
  )
end
