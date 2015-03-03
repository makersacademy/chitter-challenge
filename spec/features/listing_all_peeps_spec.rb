require 'spec_helper'

feature "User browses the list of peeps" do

  before(:each) {
    Peep.create(:message => "hello world! - first peep")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("hello world! - first peep")
  end
end
