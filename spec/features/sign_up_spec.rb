feature "Users can sign up for Chitter" do

  scenario "When registering my details" do
    expect{sign_up}.to change(Maker, :count).by(1)
    expect(page).to have_content 'Welcome Alaan!'
  end

  scenario "I cannot sign up without filling in all details" do
    visit('/sign_up')
    expect{partial_sign_up}.not_to change(Maker, :count)
  end

  scenario "I cannot sign up with an already registered email address" do
    sign_up
    expect{sign_up}.not_to change(Maker, :count)
    # expect(page).to have_content("Email address already taken")
  end

  scenario "I cannot sign up with an already registered username" do
    sign_up
    expect{sign_up}.not_to change(Maker, :count)
    # expect(page).to have_content("Username already taken")
  end
 end
