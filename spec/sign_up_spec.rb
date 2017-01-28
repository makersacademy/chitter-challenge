feature "sign up to Chitter" do
  scenario "it allows users to sign up using their name" do
    visit '/sign_up'
      fill_in :name, with: "James"
      click_button :Submit
      expect(current_path).to eq '/home'
    end

  scenario "it allows users to sign up using their email" do
    visit '/sign_up'
    fill_in :name, with: "James"
    fill_in :email, with: "james@email.com"
    click_button :Submit
    expect(current_path).to eq '/home'
  end

  scenario "it allows users to sign up with a username" do
    visit '/sign_up'
    fill_in :name, with: "James"
    fill_in :email, with: "james@email.com"
    fill_in :username, with: "jimbo"
    click_button :Submit
    expect(current_path).to eq '/home'
  end

  scenario "it allows users to sign up with a password" do
    visit '/sign_up'
    fill_in :name, with: "James"
    fill_in :email, with: "james@email.com"
    fill_in :username, with: "jimbo"
    fill_in :password, with: "llama123"
    click_button :Submit
    expect(current_path).to eq '/home'
  end

end
