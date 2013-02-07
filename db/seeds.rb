u1 = User.create!(name: "Bob", email: "bob@gmail.com")
u2 = User.create!(name: "Carol", email: "carol@gmail.com")
u3 = User.create!(name: "Dave", email: "dave@gmail.com")
u4 = User.create!(name: "Elise", email: "elise@gmail.com")
u5 = User.create!(name: "Frank", email: "frank@gmail.com")

t1 = Task.create!(title: "Do homework", user_id: 1)
t2 = Task.create!(title: "Do laundry", user_id: 1)
t3 = Task.create!(title: "Do dishes", user_id: 1)
t4 = Task.create!(title: "Do gardening", user_id: 1)
t5 = Task.create!(title: "Do something", user_id: 1)

t6 = Task.create!(title: "Make sausages", user_id: 2)
t7 = Task.create!(title: "Make dinner", user_id: 2)
t8 = Task.create!(title: "Make love", user_id: 2)
t9 = Task.create!(title: "Make a song", user_id: 2)

t10 = Task.create!(title: "See Paris", user_id: 3)
t11 = Task.create!(title: "See spot run", user_id: 3)
t12 = Task.create!(title: "See to shining see", user_id: 3)

t13 = Task.create!(title: "Run around", user_id: 4)
t14 = Task.create!(title: "Run through a park", user_id: 4)

t15 = Task.create!(title: "Eat the world", user_id: 5)