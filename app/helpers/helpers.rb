def warden_handler
  env['warden']
end

def current_user
  warden_handler.user
end

def check_auth
  redirect '/login' unless warden_handler.authenticated?
end