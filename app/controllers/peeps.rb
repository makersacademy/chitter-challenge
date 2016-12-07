class ChitterApp < Sinatra::Base
  get "/peeps" do
    erb :peeps_list
  end
end
