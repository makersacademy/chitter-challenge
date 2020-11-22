require 'pg'

feature 'Viewing the page' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Welcome to Chitter'
    end
  end

  feature 'Viewing peeps' do
    scenario 'A user can see peeps in descending order' do
      User.create(email: "Craig@David.com", password: "rewind1", name: "Craig David", username: "BoSelecta")

      visit '/'
      fill_in('username', with: 'BoSelecta')
      fill_in('password', with: 'rewind1')
      click_button('Sign In')
      fill_in('text', with: 'This is a test')
      click_button('Submit')
      fill_in('text', with: 'So is this')
      click_button('Submit')
      fill_in('text', with: 'As is this')
      click_button('Submit')
      expect(page).to have_content('This is a test')
      expect(page).to have_content('So is this')
      expect(page).to have_content('As is this')
    end

    scenario 'It has the time on the peeps' do
      
    end
  end
end
