feature 'Website loads OK' do
  scenario 'a user can see the website name' do
    visit('/')
    expect(page).to have_content("Chitter")
  end

  scenario 'a user can post a peep' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Submit')
    expect(page).to have_content('I had some coffee')
  end
end