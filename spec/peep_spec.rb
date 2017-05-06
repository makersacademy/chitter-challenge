feature 'Peeps' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'when logged in can post peeps' do
      log_in
      expect(page).to have_content "Post A New Peep"
      peep = 'This is my first peep'
      fill_in 'content', with: peep
      click_button 'Post Peep'
      expect(page).to have_content peep
    end

end
