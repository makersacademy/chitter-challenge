class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  enable(:sessions)
  set(:session_secret, "hello_this_is_dog")

  enable(:partial_underscores)
  set(:partial_template_engine, :erb)

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def pretty_time(string)
      string.strftime("%A %d %B %Y, %H:%M")
    end

    def can_reply_to_peep(peep)
      current_user && current_user != peep.user
    end
  end
end
