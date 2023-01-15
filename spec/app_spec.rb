describe Chitter do
  include Sinatra::TestHelpers

  let(:app) { Chitter.new }

  def check200
    expect(@response.status).to eq 200
  end

  def check_order_within_body(reg1, reg2)
    expect(@response.body =~ reg1).to be < (@response.body =~ reg2)
  end

  context "GET /" do
    it "Returns 200 ok status and HTML homepage with all Cheeps in reverse" \
    "chronological order" do
      @response = get("/")
      check200
      expect(@response.body).to include("Posted at:").exactly(30).times
      expect(@response.body).to include(
        "<h1>Chitter</h1>",
        "productize robust relationships",
        "embrace open-source architectures"
      )
      check_order_within_body(
        /embrace open-source architectures/,
        /productize robust relationships/
        )
      
    end
  end
end