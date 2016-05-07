require 'byebug'

feature "Sign up" do

  scenario "Create new user" do
    sign_up("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    expect{click_button "Sign up"}.to change(User, :count).by 1
  end

  scenario "Username and email has to be unique" do
    sign_up("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T")
    click_button "Sign up"
    sign_up("Man DacCarthy","Dannylou","danMac@email.com","53cR3T")
    expect{click_button "Sign up"}.not_to change(User, :count)
    expect(page).to have_content("Handle is already taken")
    expect(page).to have_content("Email is already taken")
  end

  scenario "Has password confirmation" do
    sign_up("Dan MacCarthy","Dannylou","danMac@email.com","53cR3T","secret")
    expect{click_button "Sign up"}.not_to change(User, :count)
  end

  scenario "Auto logs in" do
    sign_up("Man DacCarthy","Dannylou","danMac@email.com","53cR3T")
    click_button "Sign up"
    visit '/'
    expect(page).to have_content "Signed in as: Dannylou"
  end

end
