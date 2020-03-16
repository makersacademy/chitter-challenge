# frozen_string_literal: true

feature 'adding a new peep' do

  scenario 'A user cannot add a peep to Chitter unless signed in' do
    visit '/chitter'
    expect(page).not_to have_content("What's happening?")
  end  

  scenario 'A user can add a peep to Chitter' do
    sign_in
    peep

    expect(page).to have_content('This is a test peep')
    expect(page).to have_content('Jane Doe')
  end

end
