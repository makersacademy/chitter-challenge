def load_peeps
  session[:peeps] = Peep.all.reverse.map(&:content)
end
