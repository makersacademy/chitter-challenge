def set_flash
  if params[:name]
    flash[:new_user] = "Thanks for joining Chitter, #{warden_handler.user.name}! Have a really chit time!"
  else
    flash[:login] = "Welcome back, #{warden_handler.user.name}!" unless flash[:new_user]
  end
end