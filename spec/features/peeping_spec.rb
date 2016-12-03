require './app/app.rb'

describe "Peep" do

  scenario "User can visit page to add a peep after sign-up" do
    visit('/')
    sign_up
    click_button "Peep!"
    expect(current_path).to eq('/peep')
    expect(page).to have_button("Submit")
  end

  scenario "User cannot visit page to add a peep before sign-up or log-in" do
    visit('/')
    expect(page).not_to have_button("Peep!")
  end

end
