require "spec_helper"

feature "Peeping" do
  let(:luffy) { create :user }
  scenario "signed up user can post peeps" do
    sign_in(luffy.email, luffy.password)
    expect(page).to have_content "Post a Peep"
    peep = build :peep
    post_peep(peep)
    expect(Peep.first.content).to eq peep.content
  end
  scenario "cannot peep if not signed in" do
    visit "/"
    expect(page).not_to have_content "Post a Peep"
  end
end