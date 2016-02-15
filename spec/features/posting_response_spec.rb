feature 'replying to a peep' do

  Timecop.freeze do
    before do
      sign_up
      visit '/peeps/new'
      fill_in "content", with: "I am posting a test peep"
      click_button "Post peep"
      click_button "Sign Out"
      sign_up(email: "pete@gmail.com", password: "password1",
                  password_confirmation: "password1", name: "pete",
                  username: "pete")
    end

    scenario 'a logged in user can reply to a peep' do
      visit '/peeps'
      fill_in "content", with: "I'm responding to your peep!"
      click_button "Post Reply"
      expect(page).to have_content "I'm responding to your peep!"
      expect(page).to have_content "pete"
      expect(page).to have_content Time.now.strftime("%H:%M, %d %b %y")
    end
  end
end
