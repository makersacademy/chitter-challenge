require 'time'
#remembering how time works in ruby
require './app/models/peep'

time = Time.now

peep = Peep.create(content: 'hello',time: time)
# puts time
# p time.class
# puts
# p time.to_s
# p time.to_s.class
# puts
# time = Time.parse(time.to_s)
# p time
# p time.class
# puts
p peep.time.strftime("Peeped on %d/%m/%Y at %I:%M%p")
