feature '#Log out' do

  before(:each) do
    Maker.create( full_name: "maker makerson",
                  user_name: "maker",
                  email: "maker@example.com",
                  password: "secret1234",
                  password_confirmation: "secret1234")
                end

  scenario 'log out while being logged in' do
    log_in(email: "maker@example.com", password: "secret1234")
    click_button("Log Out")
    expect(page).to have_content("Goodbye!")
    expect(page).not_to have_content("Logged in as maker@example.com")
  end

end
