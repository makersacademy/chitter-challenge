get '/' do
  @peeps = Peep.all(:order => [ :created_at.desc ])
  erb :index
end