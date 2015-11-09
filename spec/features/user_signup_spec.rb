feature "So that I can post messages on Chitter" do

  scenario "I want to sign up" do
    visit '/'
    if page.has_content?("We have no peeps yet")
      click_link('signup')
      expect { sign_up }.to change(User, :count).by(1)
    end
  end

  scenario "sign up should detect if there is a password mismatch" do
    visit '/'
    click_link('signup')
    expect { sign_up(password_confirmation: "fault") }.not_to change(User, :count)
  end

  scenario "I want to log in to Chitter" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    expect(page).to have_content("Hi, David Jones!")
  end

  scenario "I want to be able to log out" do
    visit '/'
    click_link('signin')
    fill_in :email,       with: "user@email.com"
    fill_in :password,    with: "12345678"
    click_button('Sign In')
    click_link('signout')
    expect(page.status_code).to eq 200
  end


  def sign_up(name: "David Jones",
              username: "jonesd",
              email: "user@email.com",
              password: "12345678",
              password_confirmation: "12345678")
    fill_in :name,        with: name
    fill_in :username,    with: username
    fill_in :email,       with: email
    fill_in :password,    with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Create Account')
  end
end
