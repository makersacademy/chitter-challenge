require_relative 'lib/database_connection'
require_relative 'lib/user_repo'
require_relative 'lib/peep_repo'

DatabaseConnection.connect

class Application

    get '/' do
        return 'Hello!'

    end

end

# file: app.rb
# require 'sinatra'
# require "sinatra/reloader"
# require_relative 'lib/database_connection'
# # require_relative 'lib/album_repository'
# # require_relative 'lib/artist_repository'
# require_relative 'lib/user_repo'
# require_relative 'lib/peep_repo'

# DatabaseConnection.connect

# class Application < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#     also_reload 'lib/user_repo'
#     also_reload 'lib/peep_repo'
#   end


#   get '/albums/new' do
#     return erb(:new_album)
#   end

#   get '/artists/new' do
#     return erb(:new_artist)
#   end
#

#   get '/about' do

#     return erb(:about)

#   end

#   # get '/albums' do
#   #   repo = AlbumRepository.new
#   #   albums = repo.all

#   #   response = albums.map do |album|
#   #     album.title
#   #   end.join(', ')
    
#   #   return response
#   # end

#   # get '/artists' do
#   #   repo = ArtistRepository.new
#   #   artists = repo.all

#   #   response = artists.map do |artist|
#   #     artist.name
#   #   end.join(', ')

#   #   return response
#   # end

#   post '/albums' do
#     album = Album.new
#     album.title = params[:title]
#     album.release_year = params[:release_year]
#     album.artist_id = params[:artist_id]
#     repo = AlbumRepository.new
#     repo.create(album)

#     return 'New album created'
#   end

#   post '/artists' do
#     artist = Artist.new
#     artist.name = params[:name]
#     artist.genre = params[:genre]
#     repo = ArtistRepository.new
#     repo.create(artist)

#     return 'New artist added'
#   end

#   get '/albums/:id' do
#     repo = AlbumRepository.new
#     artist_repo = ArtistRepository.new

#     @album = repo.find(params[:id])
#     @artist = artist_repo.find(@album.artist_id)

#     return erb(:album)
#   end

#   get '/albums' do
#     repo = AlbumRepository.new
#     @albums = repo.all
    
#     return erb(:list_albums)
#   end

#   get '/artists' do
#     repo = ArtistRepository.new
#     @artists = repo.all

#     return erb(:list_artists)
#   end

#   get '/artists/:id' do
#     repo = ArtistRepository.new
#     # artist_repo = ArtistRepository.new

#     @artist = repo.find(params[:id])
#     # @artist = artist_repo.find(@album.artist_id)

#     return erb(:artist)
#   end





