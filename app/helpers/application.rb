helpers do

  def current_maker
    @current_maker ||=Maker.get(session[:maker_id]) if session[:maker_id]
  end

  def peep_maker_name(peep, id)
    Maker.get(id).name
  end

  def peep_maker_username(peep, id)
    Maker.get(id).username
  end

end