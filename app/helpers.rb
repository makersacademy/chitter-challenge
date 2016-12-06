module Helpers

def get_current_user
  @user ||= User.get(session[:id])
end

end
