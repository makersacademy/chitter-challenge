def data_mapper_setup
  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

def current_user
  @current_user ||= User.first(id: session[:user_id])
end

def sign_up_errors(user)
   user.errors.full_messages.join("<br>").sub("hash ","")
end
