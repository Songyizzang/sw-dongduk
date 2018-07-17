password = 'pass123'
1.upto(5) do |i|
  User.create(
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
