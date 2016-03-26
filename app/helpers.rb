module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def can_save(peep)
    if peep.save
      redirect '/'
    else
      flash.now[:errors] = peep.errors.full_messages
      @peeps = Peep.all(order: [:id.desc])
      erb :'peeps/index'
    end
  end
end
