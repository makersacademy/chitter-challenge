require 'spec_helper'

feature "user browses the list of peeps" do

  before(:each) {
    Peep.create(:content => "This is the first chitter peep",
                :created_at => DateTime.now)
  }

  scenario " when opening the home page" do
    visit '/'
    expect(page).to have_content "This is the first chitter peep"
  end

end