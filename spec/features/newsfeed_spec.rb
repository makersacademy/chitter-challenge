feature "Newsfeed" do

  context 'chits' do
    scenario 'all messages are showed on chronological order' do
      add_message_to_database
      sign_up_and_log_in
      fill_in 'Chit', with: "LOL, databases are so hot right now!"
      click_on 'Send Chit'
      expect(page).to have_text "LOL, databases are so hot right now!"
      expect(page).to have_text "Databases are the bomb"
      expect(page).to have_text "OMG D A T A B A S E S!"
      expect(page).to have_text "FML I love database soo much!!"
    end
  end

  context "navigation" do

    scenario 'I want to go back to profile' do
      add_message_to_database
      sign_up_and_log_in
      click_on 'Newsfeed'
      click_on 'View Profile'
      expect(page).to have_text("Welcome Eddy")
    end

    scenario 'I want to log out' do
      add_message_to_database
      sign_up_and_log_in
      click_on 'Newsfeed'
      click_on 'Log Out'
      expect(page).to have_text("Chitter")
    end



  end


end
