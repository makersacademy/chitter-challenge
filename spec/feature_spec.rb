require 'web_helpers'

feature 'new user sign up' do
  scenario 'allow new user to sign up to chitter' do
    visit ('/register')
    fill_in "Name", with: "Mara"
    fill_in "Email", with: "mara@gmail.com"
    fill_in "Handle", with: "marawanot"
    fill_in "Password", with: "password"
    click_button "register"
    expect(current_path).to eq '/'
      expect(page).to have_content "marawanot"
  end
end

feature 'log in' do
  scenario 'allow user to log in to chitter' do
    visit ('/login')
    fill_in "Handle", with: "marawanot"
    fill_in "Password", with: "password"
    click_button "log in"
    expect(current_path).to eq '/'
      expect(page).to have_content "marawanot"
  end
end

feature 'display all peeps' do
  scenario 'display all peeps on wall' do
    create_user_and_peep
      within 'ul#peeps' do
        expect(page).to have_content "Sunday Funday"
      end
  end

  # scenario 'display in reverse chronological order' do
  #   create_user_and_peep
  # end

  scenario 'display the time a peep was posted' do
    create_user_and_peep
      within 'ul#peeps' do
        expect(page).to have_content "Time: 1st May 2016 12:30"
      end
  end
end