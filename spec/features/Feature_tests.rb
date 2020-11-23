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

  scenario "Should display no peeps when first visiting the page" do
    visit '/'
    expect(page).to have_content("No peeps to show!")
  end

  scenario "After signing in, but before making a peep, extra content given to the peep-box" do
    sign_in
    expect(page).to have_content("No peeps to show! Click here to make one")
  end

  scenario "After signing in and making a peep, that peep is correctly displayed" do
    sign_in
    click_link('top-new-peep', href: '/peep/new')
    fill_in('content', with: 'I wish kanye won')
    click_button('Peep')
    expect(page).to have_content("Posted by Testy McTesterson")
    expect(page).to have_content("I wish kanye won")
  end

end
