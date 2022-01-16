def add_three_peeps(a = 1, b = 2, c = 3)
  Peep.create_peep(message: "peep: #{a}")
  Peep.create_peep(message: "peep: #{b}")
  Peep.create_peep(message: "peep: #{c}")
end

