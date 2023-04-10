require_relative "../../app"

describe Application do
  describe "Homepage" do
    it "Displays all peeps in reverse chronological order" do
      response = get(/)
      expect(response.status).to eq(200)
      expect(response.body).to match(/Big Brother is watching you @wsmith*this is jam hot*We shall meet in the place where there is no darkness/)
    end
    it "Displays the peep author's name and username" do
      response = get(/)
      expect(response.body).to include("Author: @tcarmichael - Tom Carmichael-Mhanna")
      expect(response.body).to include("Author: @smhanna - Sarwah Mhanna")
    end

    context "When the user is logged in" do
      xit "Displays the form to post a new peep" do
      end
    end
  end
end