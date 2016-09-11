require "spec_helper"

feature "Add peep" do
  scenario "logged in user can add a peep that is stored in db" do
    login_and_peep_chitter1
    click_link "Home"

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
    login_and_peep_chitter1
    click_link "Home"

    expect(current_path).to eq "/peeps"
    within "div#peeps" do
      expect(page).to have_content("My first peep, hurray!")
      expect(page).to have_content(Peep.first.created_at.strftime("%R %a %D"))
      expect(page).to have_content("chitter1")
    end
  end

  scenario "users' peeps are visible in reverse chronological order" do
    Timecop.freeze(Time.new(2016, 9, 1, 10, 10, 10))
    login_and_peep_chitter1
    click_button "Log out"

    Timecop.travel(60*60) do
      login_and_peep_chitter2
      click_link "Home"

      within "div#peeps" do
        expect(page).to have_content(
        "11:10 Thu 09/01/16 chitter2 Another peep 10:10 Thu 09/01/16 chitter1")
      end
    end
  end

  scenario "user can see his/her own peeps at my peeps" do
    login_and_peep_chitter1
    click_button "Log out"
    login_and_peep_chitter2
    click_link "My peeps"

    expect(current_path).to eq "/peeps/my"
    within "div#peeps" do
      expect(page).not_to have_content("My first peep, hurray!")
      expect(page).to have_content("Another peep")
    end
  end
end
