require "spec_helper"

feature "Peeping" do
  let(:luffy) { build :user }
  before(:each) { sign_up(luffy) }
  scenario "signed up user can post peeps" do
    expect(page).to have_content "Post a Peep"
    peep = build :peep, user: luffy
    fill_in "peep", with: peep.content
    click_button "Pop that peeper"
    expect(Peep.first.content).to eq peep.content
    expect(page).to have_content "I'm going to be King the Pirates!"
  end
  scenario "cannot peep if not signed in" do
    click_button "Peep ya later"
    expect(page).not_to have_content "Post a Peep"
  end
end