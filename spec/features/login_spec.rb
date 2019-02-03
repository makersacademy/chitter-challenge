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
