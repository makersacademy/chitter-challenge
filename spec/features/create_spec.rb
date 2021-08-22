require "./spec/web_helper.rb"

describe "create new account", type: :system do

  scenario "fails since user form data is NOT formatted corectly" do 
    test_connect_and_clean_table(:users)
    visit('/create')
    fill_in(:email, with: "johnyahoocom")
    fill_in(:name, with: "John Doe")
    fill_in(:username, with: "johndoe")
    fill_in(:password, with: "password123")
    click_button(:submit)
    expect(page).to have_current_path('/create?error=Something%20went%20wrong')
  end

  # scenario "passes since user form data is formatted corectly" do 
  #   visit('/create')
  #   fill_in(:email, with: "john@yahoo.com")
  #   fill_in(:name, with: "John Doe")
  #   fill_in(:username, with: "johndoe")
  #   fill_in(:password, with: "password123")
  #   click_button(:submit)
  #   expect(page).to have_current_path('/')
  # end

end
