module Helpers

def get_user_id
  @user ||= User.get(session[:id])
end

end
