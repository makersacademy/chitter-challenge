require 'pg'

feature 'posting new peeps' do
  scenario 'A user can create and post new peeps' do
    visit('/new')
    fill_in('peep', with: "If a repo doesn't spark you joy, thank it and delete it.")
    click_button('Peep')

    expect(page).to have_content "If a repo doesn't spark you joy, thank it and delete it."
  end
end
