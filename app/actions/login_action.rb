
def try_log_in(form_hash)
  usr = User.first(
    username: form_hash[:username],
    pass_hash: form_hash[:password]
  )
  session[:messages] << 'incorrect username or password' if usr.nil?
  !usr.nil?
end
