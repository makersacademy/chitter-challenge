def current_user
  @current_user ||= User.get(session[:user_id])
end

def sign_up_error_message(username, email, password, password_confirmation)
  flash.now[:alert] = if User.all(username: username).any?
    "Username already exists."
  elsif User.all(email: email).any?
    "There is already an account registered to that email address."
  elsif username.empty? || email.empty? || password.empty?
    "Invalid username, email or password."
  elsif password_confirmation != password
    "Passwords did not match."
  end
  erb :sign_up
end
