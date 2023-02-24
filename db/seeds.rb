Tagging.destroy_all
Tag.destroy_all
Post.destroy_all
User.destroy_all

User.create!(
  email: 'test@test.com',
  password: '123456'
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
