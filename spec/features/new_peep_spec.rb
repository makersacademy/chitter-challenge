feature 'new peep' do
  scenario "a not signed in user can't send a new peep" do
    visit '/'
    expect { click_button 'New Peep' }.to raise_error(Capybara::ElementNotFound)
  end
 
  scenario "signing out remove the possibility to send a new peep" do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')

    visit '/'
    click_button 'Sign In'
    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Sign In'
    click_button 'Sign Out'

    expect { click_button 'New Peep' }.to raise_error(Capybara::ElementNotFound)
  end

  scenario 'a signed in user can send a new peep' do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')

    visit '/'
    click_button 'Sign In'

    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Sign In'
    fill_in 'content', with: 'I am the last peep'
    click_button 'New Peep'
    expect(page).to have_content 'I am the last peep'
  end
end
