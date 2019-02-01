require_relative 'web_helpers'

feature 'posting message' do
  scenario "user hasn't signed up or logged in" do
    visit("/peeps")
    expect(page).not_to have_content("Make a peep!")

  end
  scenario 'user has signed up' do
    sign_up
    make_a_peep("My first Peep!")
    expect(page).to have_content("My first Peep!")
  end
end
