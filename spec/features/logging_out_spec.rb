require './app/app.rb'

describe "Log out" do

  scenario "When users log out, the page doesn't show their name" do
    sign_up
    click_button("Log out")
    expect(current_path).to eq('/')
    expect(page).to have_content("Goodbye!")
  end

end
