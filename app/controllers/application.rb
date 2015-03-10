get '/' do
  @tweets = Tweet.all
  erb :index
end