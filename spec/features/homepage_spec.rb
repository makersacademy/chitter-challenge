feature 'Visit homepage' do
  scenario 'User can visit homepage and see a welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'User can see a form with a submit button' do
    visit('/')
    expect(page).to have_selector(:link_or_button, 'Peep')
  end

  scenario 'User can fill in form with a new peep and the new peep is shown' do
    visit('/')
    fill_in('peep', with: 'Hello World!')
    click_button('Peep')
    expect(page).to have_content('Hello World!')
  end
end
