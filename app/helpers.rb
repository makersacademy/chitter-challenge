def load_peeps
  session[:peeps] = Peep.all.reverse.map { |peep|
    peep_for_printing(peep) }
end

def peep_for_printing(peep)
  pretty_peep = peep.content
  parsed = peep.created_at.to_time.to_s.scan(/([^\s]*)\s(.{5})/)
  # ------ ^^ DataMapper DateTime format to [[YYY-MM-DD, HH:MM], ...] 
  [pretty_peep, "Peeped on #{parsed[0][0]} at #{parsed[0][1]}"]
end
