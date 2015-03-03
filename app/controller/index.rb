class Chitter < Sinatra::Base

  get '/' do
    flash[:notice] = nil
    flash[:errors] = nil
    @cheets = Cheet.all(:order =>[:time.desc])
    erb :index
  end

end