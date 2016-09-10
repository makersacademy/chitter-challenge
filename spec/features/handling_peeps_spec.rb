require "spec_helper"

feature "Add peep" do
  scenario "logged in user can add a peep that is stored in db" do
    sign_up
    click_button "Log out"
    log_in
    fill_in :peepbox, with: "My first peep, hurray!"
    click_button "Peep"

    expect(current_path).to eq "/peeps"
    expect(Peep.first.peeptext).to eq "My first peep, hurray!"
    expect(Peep.first.user.username).to eq "chitter1"
  end

  scenario "user cannot add a peep unless logged in" do
    visit "/"
    fill_in :peepbox, with: "My first peep, hurray!"
    click_button "Peep"

    expect(current_path).to eq "/peeps"
    within "ul#errors" do
      expect(page).to have_content("You need to log in to peep")
    end
  end
end

feature "Show peeps" do
  scenario "users' peeps are visible with username and creation date" do
    sign_up
    click_button "Log out"
    log_in
    fill_in :peepbox, with: "My first peep, hurray!"
    click_button "Peep"

    expect(current_path).to eq "/peeps"
    within "div#peeps" do
      expect(page).to have_content("My first peep, hurray!")
      expect(page).to have_content(Peep.first.created_at.strftime("%c"))
      expect(page).to have_content("chitter1")
    end
  end
end
