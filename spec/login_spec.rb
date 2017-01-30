

feature "login to Chitter" do
  scenario "it allows users to login using their name" do
    visit '/login'
      fill_in :name, with: "Rob"
      fill_in :email, with: "rob@email.com"
      fill_in :username, with: "robbie"
      fill_in :password, with: "sleep12"
      click_button :Submit
      expect(current_path).to eq '/home'
      end
  end
