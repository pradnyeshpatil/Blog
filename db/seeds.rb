# Create a main sample user.
User.create!(name: "Pradnyesh Patil",
             email: "patilpradnyesh1312@gmail.com",
             password:              "shyam123",
             password_confirmation: "shyam123",
             admin: true)

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password)
end