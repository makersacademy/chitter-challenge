class Chitter < Sinatra::Base

  get '/feed' do
    @user_name = session[:user_name]
    peeps = Peep.all
    if peeps
      @peeps = peeps
    end
    erb(:feed)
  end

end
