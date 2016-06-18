feature "User registration" do
  scenario "user can register a new account" do
    visit("/user/new")
    fill_in(:username, with: 'vannio')
    fill_in(:name, with: 'Van')
    fill_in(:email, with: 'van@email.com')
    fill_in(:password, with: 'password')
    expect{ click_button(:Register) }.to change{ User.all.count }.by(1)
    expect(current_path).to eq("/")
  end
end
