feature 'post a peep' do
  scenario 'users are welcomed to the page' do
    visit('')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    expect(page).to have_content("You're on Chitter – Let's Peep!")
  end
  scenario 'features can post and see a new peep' do
    visit('')
    fill_in 'peep', with: "World's smartest peep"
    click_button('Submit')
    expect(page).to have_content("World's smartest peep")
    expect(page).not_to have_content("Hello World")
  end
end
