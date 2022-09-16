User.destroy_all
Peep.destroy_all

users1 = User.create(email: "john@gmail.com", password: "test", first_name: "John", username: "john123")
users2 = User.create(email: "Bob@gmail.com", password: "test", first_name: "Bob", username: "Bob123")
users3 = User.create(email: "macy@gmail.com", password: "test", first_name: "Macy", username: "Macy123")

Peep.create(post: "John's post", user_id: users1.id)
Peep.create(post: "Bob's post", user_id: users2.id)
Peep.create(post: "Macy's post", user_id: users3.id)
Peep.create(post: "John's second post", user_id: users1.id)
