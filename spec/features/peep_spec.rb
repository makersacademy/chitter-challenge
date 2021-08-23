require "./spec/web_helper.rb"

describe "create new account", type: :system do

  scenario "fails since we are NOT signed in" do 
    test_connect_and_clean_table(:peeps)
    visit('/peep')
    Capybara.current_session.driver.request.session[:signed_in] = false
    fill_in(:peep, with: "As a Maker I just am V")
    click_button(:submit)
    expect(page).to have_current_path('/peep?error=You%20need%20to%20Sign%20in%20first')
  end

  scenario "fails since the peep is over 50 long" do 
    test_connect_and_clean_table(:peeps)
    visit('/peep')
    Capybara.current_session.driver.request.session[:signed_in] = true
    fill_in(:peep, with: "As a Maker So that I can stay constantly tapped in to the shouty box of Chitter I want to receive an email if I am tagged in a Peep")
    click_button(:submit)
    expect(page).to have_current_path('/peep?error=You%20need%20to%20Sign%20in%20first')
  end

end
