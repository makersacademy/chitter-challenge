def add_test_peeps(number = 1)
  user = User.create(name: "Bob", handle: "bob", email: "bob@mail.com")
  number.times do
    Peep.create(content: "Test peep #{number}", user_id: user.id)
  end
end
