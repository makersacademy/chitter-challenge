class Chitter < Sinatra::Base
  get '/new_peep' do
    if session[:id]
      erb :'peeps/new'
    else
      flash.keep[:notice] = "Sign In or Sign Up to start peeping"
      redirect '/'
    end
  end

  post '/add_peep' do
    create_peep(params[:content])
    load_peeps(session[:username])
    redirect "/user/#{session[:username]}"
  end
end
