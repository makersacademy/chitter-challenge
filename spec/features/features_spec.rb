require_relative "../../app"

feature Chitter, type: :feature do

  scenario "Homepage displays correct messages when first accessed" do
    visit '/'
    expect(page).to have_content("Not signed in - click here to sign up")
  end

  scenario "Clicking the button takes you to sign up page" do
    visit '/'
    click_link('here', href: '/user/new')
    expect(page).to have_button('Sign up')
  end

  scenario "User properly greeted afer signing in" do
    sign_in
    expect(page).to have_content("Welcome Testy McTesterson")
    expect(page).to have_content("Click here to make a new peep")
  end

end
