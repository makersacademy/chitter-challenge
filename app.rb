require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Application < Sinatra::Base
  get '/' do
    @peep = Peep.joins(:user)
    return erb(:peeps)
  end

  # currently defaults all peeps to user_id 1 
  post '/peeps' do
    if invalid_peep_params?
      @error = 'Invalid input.'
      status 400
    else 
      Peep.create(
        content: params[:content],
        user_id: 1
      )
    end
    @peep = get_peeps_with_users
    return erb(:peeps)
  end

  def invalid_peep_params?
    content = params[:content]
    html_syntax = %r{<[a-z]+>(.|\n)+</[a-z]+>}
    blank = %r{^\s+$}
    content == nil || blank.match?(content) || html_syntax.match?(content)
  end

  get '/sign-up' do
    return erb(:sign_up)
  end

  post '/users' do
    User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    @peep = get_peeps_with_users
    return erb(:peeps)
    # can also redirect to user profile
  end

  def invalid_sign_up_params?
    params.all? do |param|
      html_syntax = %r{<[a-z]+>(.|\n)+</[a-z]+>}
      blank = %r{^\s+$}
      content == nil || blank.match?(content) || html_syntax.match?(content)
    end
  end

  def get_peeps_with_users
    Peep.joins(:user).order(created_at: :desc)
  end
end 



