require "spec_helper"
require "./app/app.rb"
require "./app/models/peep"

feature "Viewing links" do

  scenario "No links at the beginning of the test" do
    expect(Peep.count).to eq 0
  end


  scenario "Peeps are visible on the homepage" do
    Peep.create(message: "my first peep")
    visit '/'
    expect(page).to have_content "my first peep"
  end
end
