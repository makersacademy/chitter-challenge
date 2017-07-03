

feature "user accounts" do

  scenario "user signs up" do
    sign_up
    expect(User.count).to eq(1)
  end

  scenario "can't sign up with password mismatch" do
    visit('/user/new')
    fill_in "name", with: "Jasper KH"
    fill_in "username", with: "JKH"
    fill_in "email", with: "j.kingharman@googlemail.com"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "f"
    click_on("Create Account")
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "can't sign up with missing email" do
    visit('/user/new')
    fill_in "name", with: "Jasper KH"
    fill_in "username", with: "JKH"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "fake"
    click_on("Create Account")
    expect(User.count).not_to eq(1)
  end

  scenario "can't sign up with missing names" do
    visit('/user/new')
    fill_in "email", with: "j.kingharman@googlemail.com"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "fake"
    click_on("Create Account")
    expect(User.count).not_to eq(1)
  end


  scenario 'cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end


end
