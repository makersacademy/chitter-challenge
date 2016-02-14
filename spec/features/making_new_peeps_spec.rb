require 'spec_helper'
require 'web_helpers'

feature "making peep" do
  scenario "returns peep on page" do
    sign_up
    fill_in("text", with: "Hello Chitter!")
    click_button "Peep"
    expect(Peep.first.text).to eq "Hello Chitter!"
    expect(page).to have_content("Hello Chitter!")
  end
end
