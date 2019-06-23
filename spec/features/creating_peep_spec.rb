
feature 'Adding a new peep' do
  scenario 'A user can add a peep' do
    visit '/peeps/new'
    fill_in(:username, with: 'johndoe')
    fill_in(:text, with: 'This is the first peep')
    click_button('Submit')

    expect(page).to have_content('johndoe')
    expect(page).to have_content('This is the first peep')
  end
end