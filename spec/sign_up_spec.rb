feature "sign up to Chitter" do
  scenario "it allows users to sign up using their name" do
    visit '/sign_up'
      fill_in :name, with: "James"
      fill_in :email, with: "james@email.com"
      fill_in :username, with: "jimbo"
      fill_in :password, with: "llama123"
      click_button :Submit
      expect(current_path).to eq '/home'
    end
end
