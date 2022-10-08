require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before(:each) do
    query = File.read('./spec/seeds/peeps_seeds.sql')
    query = File.read('./spec/seeds/users_seeds.sql')
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(query)
  end
  
  context 'GET /peeps' do
    xit 'returns 200 OK with the right content and returns all peeps' do
      response = get('/peeps')
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/artists/1">Pixies<br></a>')
      expect(response.body).to include('<a href="/artists/2">ABBA<br></a>')
      expect(response.body).to include('<a href="/artists/3">Taylor Swift<br></a>')
      expect(response.body).to include('<a href="/artists/4">Nina Simone<br></a>')
    end
  end

  context 'GET /artists/new' do
    xit "returns 200 OK and form to add new artist" do
    response = get('/artists/new')
    expect(response.status).to eq(200)
    expect(response.body).to include('<form method="POST" action="/artists">')
    expect(response.body).to include('<input type="text" name="name" />')
    expect(response.body).to include('<input type="text" name="genre" />')
    end
  end

  context 'GET /artists/:id' do
   xit "returns 200 OK with the right artists" do
    response = get('/artists/2')
    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>ABBA</h1>')
    expect(response.body).to include('GENRE: Pop')
    end
  end

  context 'GET /albums/new' do
    xit "returns 200 OK and form to add new album" do
    response = get('/albums/new')
    expect(response.status).to eq(200)
    expect(response.body).to include('<form method="POST" action="/albums">')
    expect(response.body).to include('<input type="text" name="title" />')
    expect(response.body).to include('<input type="text" name="release_year" />')
    end
  end

  context 'GET /albums/:id' do
    xit "returns 200 OK with the right album" do
    response = get('/albums/2')
    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>Surfer Rosa</h1>')
    expect(response.body).to include('Release year: 1988')
    expect(response.body).to include('Artist: Pixies')
    end
  end

  context 'GET /albums' do
    xit "returns 200 OK and albums" do
    response = get('/albums')
    expect(response.status).to eq(200)
    expect(response.body).to include('<a href="/albums/2">Surfer Rosa<br></a>')
    expect(response.body).to include('<a href="/albums/3">Waterloo<br></a>')
    expect(response.body).to include('<a href="/albums/4">Super Trouper<br></a>')
    expect(response.body).to include('<a href="/albums/5">Bossanova<br></a>')
    end
  end

  context 'POST /artists' do
    xit 'should validate artist parameters' do
      response = post(
        '/artists',
        invalid_artist_: 'Tasty',
        another_invalid_thing: 123
      )
      expect(response.status).to eq (400)
    end

    xit "returns 200 OK with the right content and creates a new artist" do
      response = post(
        '/artists',
        name: 'Wild Nothing',
        genre: 'Indie',
      )
      expect(response.status).to eq(200)
      expect(response.body).to eq('')
    end
  end

  context 'POST /albums' do
    xit 'should validate album parameters' do
      response = post(
        '/albums',
        invalid_artist_title: 'Tasty Wheat',
        another_invalid_thing: 123
      )
      expect(response.status).to eq (400)
    end
    
    xit 'returns 200 OK with the right content and creates a new album' do
      response = post(
        '/albums',
        title: 'Voyage',
        release_year: '2022',
        artist_id: '2'
      )
      expect(response.status).to eq(200)
      expect(response.body).to eq('')

      response = get('/albums')
      expect(response.body).to include('Voyage')
    end
  end
end