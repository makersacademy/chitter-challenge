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
      user = User.create(email: "right@email.com", password: "Any123", name: "Bill Test", username: "Billtest")
      Peep.create(text: 'This is a test', user_id: user.id)
      Peep.create(text: 'So is this', user_id: user.id)
      Peep.create(text: 'As is this', user_id: user.id)

      visit '/timeline'

      expect(page).to have_content('This is a test')
      expect(page).to have_content('So is this')
      expect(page).to have_content('As is this')
    end

    scenario 'It has the time on the peeps' do
      
    end
  end
end
