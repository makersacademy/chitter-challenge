feature "Registering an account" do

  scenario "User can register an account" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'
    click_button "Register"
    fill_in('email', :with => "test@test.com")
    fill_in('password', :with => "P@55W0RD")
    click_button "Submit"
    expect(page).to have_content "Tell the world about what you are making:"
  end

  scenario "User cannot register an account if duplicate" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'
    click_button "Register"
    fill_in('email', :with => "test@test.com")
    fill_in('password', :with => "P@55W0RD")
    click_button "Submit"
    visit '/'
    click_button "Register"
    fill_in('email', :with => "test@test.com")
    fill_in('password', :with => "P@55W0RD")
    click_button "Submit"
    expect(page).to have_content "Duplicate account"
  end

  scenario "User can log in to an account" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'
    click_button "Register"
    fill_in('email', :with => "test@test.com")
    fill_in('password', :with => "P@55W0RD")
    click_button "Submit"
    visit '/'
    click_button "Log in"
    fill_in('email', :with => "test@test.com")
    fill_in('password', :with => "P@55W0RD")
    click_button "Submit"
    expect(page).to have_content "Logged in successfully!"
  end
end
