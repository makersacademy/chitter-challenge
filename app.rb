require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_database_test')

# sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

result.each do |record|
  p record
end


DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end
end

#   get '/' do
#     return erb(:home)
#   end

#   get '/artists' do
#     repo = ArtistRepository.new
#     @artists = repo.all

#     return erb(:all_artists)
#   end

#   post '/artists' do
#     invalid_artist_params?
#     repo = ArtistRepository.new
#     new_artist = Artist.new
#     new_artist.name = params[:name]
#     new_artist.genre = params[:genre]
    
#     repo.create(new_artist)
#     return ''
#   end


#   get '/artists/new' do
#     return erb(:new_artist)
#   end

#   get '/artists/:id' do
#     artist_repo = ArtistRepository.new
#     @artist = artist_repo.find(params[:id])
#     return erb(:artists)
#   end

#   get '/albums' do
#     repo = AlbumRepository.new
#     @albums = repo.all

#     return erb(:albums)
#   end

#   post '/albums' do
#     invalid_album_params?
#     repo = AlbumRepository.new
#     new_album = Album.new
#     new_album.title = params[:title]
#     new_album.release_year = params[:release_year]
#     new_album.artist_id = params[:artist_id]
    
#     repo.create(new_album)
#     return ''
#   end

#   get '/albums/new' do
#     return erb(:new_album)
#   end

#   get '/albums/:id' do
#     repo = AlbumRepository.new
#     artist_repo = ArtistRepository.new
#     @album = repo.find(params[:id])
#     @artist = artist_repo.find(@album.artist_id)
#     return erb(:index)
#   end

#   def invalid_album_params?
#     if params[:title] == nil || params[:release_year] == nil || params[:artist_id] == nil 
#       status 400
#       return ''
#     end
#   end

#   def invalid_artist_params?
#     if params[:name] == nil || params[:genre] == nil
#       status 400
#       return ''
#     end
#   end
# end


  # get '/albums' do
  #   repo = AlbumRepository.new
  #   albums = repo.all

  #   response = albums.map do |album|
  #     album.title
  #   end.join(', ')
  #   return response
  # end

  # get '/artists' do
  #   repo = ArtistRepository.new
  #   artists = repo.all

  #   response = artists.map do |artist|
  #     artist.name
  #   end.join(', ')
  #   return response
  # end