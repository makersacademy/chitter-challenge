require 'sinatra/base'
require 'bcrypt'
require './lib/peep'
require './lib/user'

class Application < Sinatra::Base
  get '/' do
    @peep = peeps_with_users
    return erb(:peeps)
  end

  # currently defaults all peeps to user_id 1 
  post '/peeps' do
    if invalid_peep_params?
      @error = true
      status 400
    else 
      Peep.create(
        content: params[:content],
        user_id: 1
      )
    end
    @peep = peeps_with_users
    return erb(:peeps)
  end

  def invalid_peep_params?
    content = params[:content]
    content == nil || html_or_blank?(content)
  end

  get '/sign-up' do
    return erb(:sign_up)
  end

  post '/users' do
    if invalid_sign_up_params?
      @error = true
      status 400
    else
      User.create(
        name: params[:name],
        username: params[:username],
        email: params[:email],
        password: BCrypt::Password.create(params[:password])
      )
    end
    @peep = peeps_with_users
    return erb(:peeps)
  end

  def invalid_sign_up_params?
    params.values.any? { |value| value == nil || html_or_blank?(value) }
  end

  def peeps_with_users
    Peep.joins(:user).order(created_at: :desc)
  end

  def html_or_blank?(content)
    regex = %r{(<[a-z]+>(.|\n)+</[a-z]+>)|(^\s*$)}
    regex.match?(content)
  end
end 



