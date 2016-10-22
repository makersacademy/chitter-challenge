require "spec_helper"
require "app.rb"
require "./models/peep"

feature "Viewing links" do
  scenario "Peeps are visible on the homepage" do
    Peep.create(message: "my first peep")
    visit '/'
    p page.html
    expect(page).to have_content "my first peep"
  end
end
