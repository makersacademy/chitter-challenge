def add_test_peeps(number)
  number.times do
    Peep.create(content: "Test peep #{number}")
  end
end