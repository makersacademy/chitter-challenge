require 'spec_helper'

feature "User adds a new peep" do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')

    scenario "when browsing the homepage" do
      expect(Peep.count).to eq(0)
      visit 'peeps/new'
      add_peep("Bob")
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.content).to eq("Bob")
    end

    def add_peep(content)
      fill_in 'content', :with => content
      click_button 'Submit'
    end
  end
end