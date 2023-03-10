require "spec_helper"
require "rack/test"
require "shared_context_spec"
require_relative "../../app"

describe Application do

  include Rack::Test::Methods
  
  let(:app) { Application.new }
  
  include_context "doubles setup"
  before { reset_users_table }
  before { reset_peeps_table }

  context "GET /" do
    it "sould return 200 OK" do
      response = get '/'
      expect(response.status).to eq 200
    end
    it "sould all peeps from repository in a reverse chonological orders" do
      response = get '/'
      newest = '<p>@jdoe @changwynn guys, Have you watched the game yesterday?</p>'
      oldest = '<p>How are you guys doing, today? @jdoe @mrbike</p>'
      regexp = /.*#{Regexp.escape(newest)}.*#{Regexp.escape(oldest)}.*/m
      expect(last_response.body).to include(newest)
      expect(last_response.body).to match(regexp)
    end
  end
end