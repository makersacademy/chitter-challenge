feature 'Profile' do
  context '#  Peep messages' do
    scenario 'Can send a Chit' do
      sign_up_and_log_in
      fill_in 'Chit', with: "LOL, databases are so hot right now!"
      click_on 'Send Chit'
      expect(page).to have_text('Eddy')
      expect(page).to have_text("LOL, databases are so hot right now!")
    end

  end
end
