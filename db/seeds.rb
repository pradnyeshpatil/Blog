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

 # Generate microposts for a subset of users.
 users = User.order(:created_at).take(6)
 50.times do
    title =  Faker::Lorem.sentence(word_count: 5)
    content = Faker::Lorem.sentence(word_count: 10)
    users.each do |user| 
     user.posts.create!(content: content,
                        title: title) 
      
    
  end
end