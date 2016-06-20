feature "User registration" do
  let(:username) { "vannio" }
  let(:name) { "Van" }
  let(:email) { "van@email.com" }
  let(:password) { "password123" }

  scenario "user can register a new account" do
    visit("/users/new")

    fill_in(:username, with: username)
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to change{ User.all.count }.by(1)
    expect(current_path).to eq("/")
  end

  scenario "user cannot register existing username" do
    create_user
    visit("/users/new")

    fill_in(:username, with: username)
    fill_in(:name, with: name)
    fill_in(:email, with: "unique@email.com")
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
  end

  scenario "user cannot register existing email address" do
    create_user
    visit("/users/new")

    fill_in(:username, with: "unique")
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
  end
end
