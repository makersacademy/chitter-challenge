require './lib/peep'

p Peep.all.length
peep = Peep.add(peep_text: "testing from the command line")
p Peep.all.length
