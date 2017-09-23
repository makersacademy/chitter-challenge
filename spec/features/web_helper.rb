def default_peepline
  @peep1 = 'And those who are first will be last'
  @peep2 = 'So those who are last now will be first'
  peep_array = [@peep1, @peep2]
  peep_array.each{|peep_body| new_peep = Peep.create(body: peep_body)
  new_peep.save}


end
