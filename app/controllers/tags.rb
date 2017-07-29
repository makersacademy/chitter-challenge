class Chitter < Sinatra::Base
  get '/tags:tag' do
    flash.now[:notice] = "Peeps with tag: "
  end
end
