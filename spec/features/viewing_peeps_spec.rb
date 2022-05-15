feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
    
      expect(page).to have_content 'Chitter'
    end
  end

  feature 'viewing peeps' do
    scenario 'peeps display body, name, username and time posted' do
      User.create(
        email: 'user@example.com',
        password: 'password123',
        name: 'Example user',
        username: '@example_user'
      )

      visit '/sessions/new'
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: 'password123'
      click_button 'Log in'

      click_button 'New Peep'

      fill_in 'body', with: 'my first peep'
      click_button 'Peep'

      expect(page).to have_content 'my first peep'
      expect(page).to have_content 'Example user'
      expect(page).to have_content '@example_user'
      expect(page).to have_content Time.now.strftime('%R')
    end
  end
end
