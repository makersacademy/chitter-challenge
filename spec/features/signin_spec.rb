require "./spec/web_helper.rb"

describe "create new account", type: :system do
  user_hash = { email: "johndoe@yahoo.com", 
  name: "John Doe",
  username: "johndoe",
  password: "running123"
  }

  scenario "fails since signin details are NOT correct" do 
    test_connect_and_clean_table(:users)
    User.add(user_hash)
    visit('/signin')
    fill_in(:username, with: "johndoe")
    fill_in(:password, with: "running1234")
    click_button(:submit)
    expect(page).to have_current_path('/signin?error=User%20and%20password%20do%20not%20match')
  end

  scenario "works since signin details are correct" do 
    test_connect_and_clean_table(:users)
    User.add(user_hash)
    visit('/signin')
    fill_in(:username, with: "johndoe")
    fill_in(:password, with: "running123")
    click_button(:submit)
    expect(page).to have_current_path('/')
  end



end
