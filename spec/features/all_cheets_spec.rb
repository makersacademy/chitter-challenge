# require 'spec_helper'

feature "User sees all cheets" do
  before(:each) {
    Cheet.create( text: "Hello World!",
                  time: Time.now.to_s)
  }

  scenario "when on home page" do
    visit '/'
    expect(page).to have_content("Hello World!")
  end

end