describe Chitter do
  include Sinatra::TestHelpers

  let(:app) { Chitter.new }

  def check200
    expect(@response.status).to eq 200
  end

  def check_success
    expect(@response.body).to include(
      "<h1>Success</h1><br>",
      '<a href="/">Go back to homepage</a>'
    )
  end

  def check_failure
    expect(@response.body).to include(
      "<h1>Your input failed</h1><br>",
      '<a href="/">Go back to homepage</a>'
    )
  end

  def check_order_within_body(*regexs)
    regexs[0...(-1)].each.with_index do |regex, index|
      expect(@response.body =~ regex).to be < (@response.body =~ regexs[index + 1])
    end
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
        "embrace open-source architectures",
        "leverage magnetic niches"
      )
      check_order_within_body(
        /leverage magnetic niches/,
        /embrace open-source architectures/,
        /productize robust relationships/
      )
    end

    it "Each Cheep is accompanied by its author's username" do
      @response = get("/")
      expect(@response.body).to include(
        "marianne.grant",
        "regine.tremblay",
        "dominica",
      )
      check_order_within_body(
        /dominica/,
        /regine.tremblay/,
        /marianne.grant/,
      )
    end

  end

  context "GET /new_user" do
    it "gets the form for creating new user" do
      @response = get("/new_user")
      check200
      expect(@response.body).to include(
        "<h1>Sign up for Chitter</h1>",
        "<form method=\"post\" action=\"/new_user\">",
        'Name <input type="text" name="name"/>'
      )
    end
  end


  context "POST /new_user" do
    it "If email and username are unique, adds a new" \
     "user to database and returns success page" do
      @response = post("/new_user",
        name: "Finn McCool",
        username: "mccool99",
        email: "finnmccool99@example.com",
        password: "very_secure123"
      )
      check200
      expect(User.last.name).to eq "Finn McCool"
      check_success
    end

    it "If email or password are not unique, does not add to" \
     "database and returns failure with status 400" do
      @response = post("/new_user",
        name: "Finn McCool",
        username: "dominica",
        email: "finnmccool99@example.com",
        password: "very_secure123"
      )
      expect(@response.status).to eq 400
      expect(User.last.name).not_to eq "Finn McCool"
      check_failure
    end

  end
end