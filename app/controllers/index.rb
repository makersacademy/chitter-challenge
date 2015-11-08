class Chitter < Sinatra::Base

  get '/' do
    @user = User.new
    erb :index, layout: :home_layout
  end

end
