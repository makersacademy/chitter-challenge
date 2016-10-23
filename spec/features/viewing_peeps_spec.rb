require "spec_helper"
require "./app/app.rb"
require "./app/models/peep"

feature "Viewing links" do

  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', password_confirmation: 'admin', name: 'Ed')
  end

  scenario "No links at the beginning of the test" do
    expect(Peep.count).to eq 0
  end


  scenario "Peeps are visible on the homepage" do
    sign_up
    visit '/peeps'
    fill_in :message, with: "my first peep"
    click_button 'Submit'
    expect(page).to have_content "my first peep"
  end
end
