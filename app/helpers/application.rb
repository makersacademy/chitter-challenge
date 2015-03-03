helpers do
  def current_maker
    @current_maker ||=Maker.get(session[:maker_id]) if session[:maker_id]
  end
end