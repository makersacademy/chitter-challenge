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
    visit('/')
    click_on ('sign-up')
    fill_in 'first-name', with: 'User1'
    fill_in 'surname', with: 'One'
    fill_in 'new-email', with: 'user1@test.com'
    fill_in 'new-grip', with: 'user1'
    fill_in 'new-password', with: 'pass1'
    fill_in 'new-password-confirm', with: 'pass1'
    click_on ('create-account')

    expect(page).to have_content('Welcome, User1')
    expect(page).to have_current_path '/peeps'
  end

  # scenario "username and password text boxes are present" do
  #   visit('/')
  #   expect(page).to have_selector("#email")
  #   expect(page).to have_selector("#password")
  # end

end
