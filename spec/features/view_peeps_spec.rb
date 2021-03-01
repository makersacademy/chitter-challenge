require_relative '../database_helpers.rb'

feature "peeps" do
  scenario "view peeps" do
    add_peeps_to_database()
    visit('/')

    expect(page).to have_content 'first'
    expect(page).to have_content 'king_of_universe'
    expect(page).to have_content '23/06/-2280 (Sun) 16:20'
    expect(page).to have_button 'Create Account'
  end
end