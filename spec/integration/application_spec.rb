require_relative '../../app'

RSpec.describe 'Application' do
  include Rack::Test::Methods

  let(:app) { Application.new }

  it 'loads homepage with all tweets' do
    response = get '/'
    expect(response.body).to include '<p> just setting up my twttr </p>'
    expect(response.body).to include '<p> No one is born hating another person because of the color of his skin or his background or his religion... </p>'
    expect(response.body).to include '<p> Next I\'m buying Coca-Cola to put the cocaine back in </p>'
  end

  it 'loads form for tweet submission on homepage' do
    response = get '/'
    expect(response.status).to eq 200
    expect(response.body).to include '<form action="/peeps" method="POST">'
    expect(response.body).to include '<input type="text" name="content">'
    expect(response.body).to include '<input type="submit" value="peep">'
  end

  it 'allows user to submit new tweet' do
    response = post(
      '/peeps',
      content: 'Hello, World!'
    )
    expect(response.status).to eq 200
    expect(response.body).to include '<p> Hello, World! </p>'
    expect(response.body).to include '<p> just setting up my twttr </p>'
    expect(response.body).to include '<p> No one is born hating another person because of the color of his skin or his background or his religion... </p>'
    expect(response.body).to include '<p> Next I\'m buying Coca-Cola to put the cocaine back in </p>'
  end
end