require 'spec_helper'
require 'rack/test'

describe Chitter do
  include Rack::Test::Methods

  def app
    Chitter.new!
  end

  it 'has send_email method' do
    #shouldn't this be passing also?!
    expect(app).to respond_to :send_email
  end

  it 'sends a message to the user when user signs up' do
    allow_any_instance_of(RestClient::Request).to receive(:execute).with(any_args)
    post '/users', params={email: "example@email.com",
                          username: "Adrian17",
                          password: "adrian1",
                          password_confirmation: 'adrian1'}
    expect(app).to have_received(:send_email)
  end

end
