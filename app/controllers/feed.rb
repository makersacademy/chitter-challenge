class Chitter < Sinatra::Base

  get '/feed' do
    @user_name = session[:user_name]
    peeps = Peep.all(:order => [ :created_at.desc ])
    if peeps
      @peeps = peeps
    end
    erb(:feed)
  end

end
