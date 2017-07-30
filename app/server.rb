class CHITTER < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :public_folder, Proc.new { File.join(root, 'static') }

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def email
      post = Post.first
      user = User.all
      post.text.split(' ').each do |word|
        if word == user
          # Email notification goes here
        else
          break
        end
      end
    end
  end
end
