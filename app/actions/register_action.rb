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

  r = true
  unless User.first(username: form_hash[:username]).nil?
    session[:messages] << 'username exists already'
    r = false
  end
  unless User.first(email: form_hash[:email]).nil?
    session[:messages] << 'email address exists already'
    r = false
  end
  r
end
