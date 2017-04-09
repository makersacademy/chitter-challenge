feature 'User can post a peep' do

  scenario 'User posts a peep' do
    visit('/')
    fill_in('peep', with: "This app is amazing!")
    click_button('Submit message')
    expect(page).to have_content("This app is amazing!")
  end

  scenario 'Users username is shown' do
    sign_up
    visit('/')
    fill_in('peep', with: "This app is amazing!")
    click_button('Submit message')
    expect(page).to have_content("Magnus")
  end

end
