def add_test_peeps(number)
  number.times do
    user = User.create(name: "Bob#{number}", handle: "bob#{number}" )
    Peep.create(content: "Test peep #{number}", user_id: user.id)
  end
end