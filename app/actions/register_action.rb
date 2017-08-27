def try_register(form_hash)

  return false unless credentials?(form_hash)

  usr = User.create(
    name: form_hash[:name],
    email: form_hash[:email],
    username: form_hash[:username],
    pass_hash: form_hash[:password]
  )
  usr.save
  true
end

def credentials?(form_hash)

  if empty?(form_hash)
    session[:messages] << 'all fields must be filled out'
  end

  unique?(form_hash)
end

def unique?(form_hash)
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

def empty?(form_hash)
  form_hash[:name].delete(' ').empty? ||
  form_hash[:email].delete(' ').empty? ||
  form_hash[:username].delete(' ').empty? ||
  form_hash[:password].delete(' ').empty?
end
