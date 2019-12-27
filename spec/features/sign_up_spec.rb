feature "sign up" do

  scenario "click sign up button on the homepage navigates to the sign-up page" do
    visit('/')
    click_on ('sign-up')
    expect(page).to have_current_path '/users/new'
  end


  scenario "sign up presents user with boxes for personal details" do
    visit('/')
    click_on ('sign-up')
    expect(page).to have_selector("#first-name")
    expect(page).to have_selector("#surname")
    expect(page).to have_selector("#new-email")
    expect(page).to have_selector("#new-grip")
    expect(page).to have_selector("#new-password")
    expect(page).to have_selector("#new-password-confirm")
  end

  scenario "sign up presents user with boxes for personal details" do
    sign_up

    expect(page).to have_content('Welcome, User1')
    expect(page).to have_current_path '/peeps'
  end

  scenario "prevents signing up 2 users with the same email address and flashes a message to the user" do
    sign_up
    sign_up

    expect(page).to have_content('The supplied email address is already in use')
    expect(page).to have_current_path '/users/new'
  end

  scenario "prevents signing up 2 users with the same grip id and flashes a message to the user" do
    sign_up
    sign_up_same_grip

    expect(page).to have_content('The supplied grip id is already in use')
    expect(page).to have_current_path '/users/new'
  end

end
