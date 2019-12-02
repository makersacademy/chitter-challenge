feature 'Visit homepage' do
  scenario 'User can visit homepage and see a welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'User can see a peep form with a submit button' do
    visit('/')
    expect(page).to have_field('peep')
    expect(page).to have_selector(:link_or_button, 'Peep')
  end

  scenario 'User can see a sign-up button' do
    visit('/')
    expect(page).to have_selector(:link_or_button, 'Sign up!')
  end

  scenario 'User can fill in form with a new peep and the new peep is shown' do
    visit('/')
    fill_in('peep', with: 'Hello World!')
    click_button('Peep')
    expect(page).to have_content('Hello World!')
    expect(page).to have_content("Marianne")
    expect(page).to have_content("marianneoco")
  end

  scenario 'User can see a new peep along with previous peeps' do
    visit('/')
    fill_in('peep', with: 'Hello World!')
    click_button('Peep')
    visit('/')
    fill_in('peep', with: 'Second Hello World!')
    click_button('Peep')
    expect(page).to have_content('Hello World!')
    expect(page).to have_content('Second Hello World!')
  end

end
