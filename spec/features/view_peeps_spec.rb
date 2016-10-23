require "spec_helper"

feature "viewing peeps" do

  before(:each) do
    sign_up
    peep("Testing, testing, testing!")
  end

  scenario "list in reverse chronological order" do
    peep("Ducky, ducky, duck.")
    peep("Glamazon Fish.")
    expect(page).to have_text("Glamazon Fish. Ducky, ducky, duck. Testing, testing, testing")
  end
  scenario "see time at which a peep was made" do
    expect(page).to have_content("#{Peep.last.time}")
  end
  scenario "you can see the peeps without being logged in" do
    click_button 'Log out'
    expect(page).to have_content("Testing, testing, testing!")
  end
end
