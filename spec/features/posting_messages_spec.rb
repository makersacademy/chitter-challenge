require 'pg'

feature "posting messages" do

  scenario "check if homepage has status bar" do
    visit('/')
    expect(page).to have_content('Enter status here:')
  end

  scenario "adding a status" do
    Peep.create(peep: "I am feeling chittery today")
    visit('/statuses')
   end

  scenario "adding a timestamp" do

  end

end