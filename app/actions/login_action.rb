
def try_log_in(form_hash)
  usr = User.first(
    username: form_hash[:username],
  )
  failed = usr.nil? || usr[:pass_hash] != form_hash[:password]
  session[:messages] << 'incorrect username or password' if failed
  !failed
end
