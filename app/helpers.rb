module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def can_save(content)
    if content.save
      redirect '/'
    else
      flash.now[:errors] = content.errors.full_messages
      @peeps = Peep.all(order: [:id.desc])
      erb :'peeps/index'
    end
  end
end
