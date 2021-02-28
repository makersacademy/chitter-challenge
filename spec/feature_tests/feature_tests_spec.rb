feature "displays the homepage" do
  scenario " visit the homepage " do
    visit '/homepage'
    expect(page).to have_content('Chitter. Where reasonable people politely discuss their views.')
  end
end

feature " allows a user to view the peeps wihout logging in " do
  scenario "add demo peeps, and then view in homepage" do
    peep = add_demo_peeps
    visit '/homepage'
    expect(page).to have_content(peep.peep)
  end
end

feature "allows the user to sign up to chitter and login" do
  scenario "visit homepage. Sign up. Login " do
    register_people
    login
    expect(page).to have_content('Logged in as: James')
  end
end

feature "prevent user from registering when a name is already taken" do
  scenario "double signup" do
    register_people
    register_people
    expect(page).to have_content('Name Taken. Please Try Another')
  end
end

feature "prevent user loging in with the wrong password" do
  scenario ' signup and wrong login' do
    register_people
    wrong_login
    expect(page).to have_content('Incorrect Password Given')
  end
end

feature "allows the user to post a peep" do
  scenario 'Regiester. Login. Peep' do
    register_people
    login
    demo_peep
    expect(page).to have_content('This is my fucking peep')
  end
end

feature 'prevents posting a peep unless logged in first' do
  scenario 'ditto' do
    register_people
    demo_peep
    expect(page).to have_content('You must log in to peep!')
  end
end

feature ' allows the user to log out' do
  scenario ' ditto' do
    register_people
    login
    click_button 'Logout'
    expect(page).not_to have_content('Logged in as: James')
  end
end
