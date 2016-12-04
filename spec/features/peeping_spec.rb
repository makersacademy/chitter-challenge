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

  scenario "User can see all peeps" do
    peep
    all_peeps = Peep.all
    expect(all_peeps.count).to eq 1
  end

  scenario "User can see the message when peeped" do
    peep
    expect(page).to have_content("Peeeeeeeeeep")
  end
end
