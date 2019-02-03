feature 'You can click on a button and go register for chitter' do
    scenario do
      visit '/'
      click_button 'Register'
      expect(page).to have_content "Register to create a Chitter account"
    end
end

feature 'You can register then see the newsfeed' do
    scenario do
      register
      expect(page).to have_content "Newsfeed"
    end
end

feature 'You cannot register with an email or name already assigned to a user' do
    scenario do
      register
      register
      expect(page).to have_content "Email or name already in use - try again."
    end
end
