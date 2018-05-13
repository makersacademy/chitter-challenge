def add_peeps
  time = Time.now
  Chitter.add('My first peep', time)
  Chitter.add('My second peep', time)
  Chitter.add('My third peep', time)
end
