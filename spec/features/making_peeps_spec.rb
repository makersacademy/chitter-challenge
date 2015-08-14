require "spec_helper"

feature "Peeping" do
  let(:luffy) { create :user }
  scenario "signed up user can post peeps" do
    sign_in(luffy.email, luffy.password)
    expect(page).to have_content "Post a Peep"
    post_peep
    expect(Peep.first.peep).to eq "I'm going to be King the Pirates!"
  end
  scenario "cannot peep if not signed in" do
    visit "/"
    expect(page).not_to have_content "Post a Peep"
  end
end