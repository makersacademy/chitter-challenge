class Chitter < Sinatra::Base
  def create_peep(content)
    Peep.create(content: content, user_id: session[:id])
    check_for_tags(content)
  end

  def load_peeps(username)
    peeps = Peep.all(user_id: User.first(username: username).id)
    session[:peeps] = peeps.all.reverse.map { |peep|
      peep_for_printing(peep) }
  end

  def peep_for_printing(peep)
    pretty_peep = peep.content
    parsed = peep.created_at.to_s.scan(/([^T]*)T(.{5})/)
    # ------ ^^ DataMapper DateTime format to [[YYY-MM-DD, HH:MM]] 
    [pretty_peep, parsed[0][0], parsed[0][1]]
    # ^^ Returns a peep array with [content, date, time]
  end
end
