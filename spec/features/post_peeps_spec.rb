# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Post Peeps" do

  scenario "I want to post a message" do
    sign_up
    sign_up

    visit '/peeps/new'
    fill_in :message, with: "Chitter is awesome!"
    click_button "Add Peep"

    expect(current_path).to include '/peeps'
    expect(page).to have_content "Chitter is awesome!"

  end

end
