require "sinatra/base"
require "./lib/message"

class Chitter < Sinatra::Base

  get "/" do
    @messages = Message.all
    erb(:index)
  end

  post "/posted" do
    Message.create(:message => params["posted_message"])

    # posted_message = params["message"]
    # connection = PG.connect(dbname: 'message_manager_test')
    # connection.exec("INSERT INTO messages (message) VALUES ('#{posted_message}');")
    redirect("/")
  end

  run! if app_file == $0
end