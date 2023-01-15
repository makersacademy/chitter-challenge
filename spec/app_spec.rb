describe Chitter do
  include Sinatra::TestHelpers

  let(:app) { Chitter.new }

  def check_200(response)
    expect(response.status).to eq 200
  end

  context "GET /" do
    it "Returns HTML homepage with all Cheeps and 200 ok status" do
      response = get("/")
      check_200(response)
      expect(response.body).to include("Posted at:").exactly(30).times
      expect(response.body).to include(
        "<h1>Chitter</h1>",
        "reinvent one-to-one relationships",
        "seize innovative markets"
      )
    end
  end
end