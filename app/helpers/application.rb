helpers do

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  # def create_from_fields type, field_hash, save?
  #   new_object = type.new(field_hash.each)
  # end

end