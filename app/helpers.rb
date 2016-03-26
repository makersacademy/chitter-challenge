module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def can_save(peep)
    if peep.save
      redirect '/'
    else
      flash.now[:errors] = peep.errors.full_messages
      erb :'peeps/new'
    end
  end
end
