
def try_register(form_hash)

  return false unless credentials?(form_hash)

  usr = User.create(
    name: form_hash[:name],
    email: form_hash[:email],
    username: form_hash[:username],
    pass_hash: form_hash[:password],
    salt: '',
  )
  usr.save
  true
end

def credentials?(form_hash)
  unless User.first(username: form_hash[:username]).nil?
    session[:messages] << 'username exists already'
    return false
  end

  unless User.first(email: form_hash[:email]).nil?
    session[:messages] << 'email address exists already'
    return false
  end

  true
end

App.get '/register' do
  redirect '/' if session[:auth]
  page :register
end

App.post '/register' do
  if try_register(params)
    redirect '/'
  else
    redirect '/register'
  end
end
