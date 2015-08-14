require "spec_helper"

feature "peeps are visible" do
  let(:luffy) { create :user }
  before(:each) do 
    sign_in(luffy.email, luffy.password)
    post_peep
  end
  scenario "can see peeps on the home page" do
    expect(current_path).to eq "/"
    expect(page).to have_content "I'm going to be King the Pirates!"
  end
  scenario "peeps are displayed with the peepers name and username" do
    expect(current_path).to eq "/"
    within "ul#peeps" do
      expect(page).to have_content luffy.name
      expect(page).to have_content luffy.username
    end
  end
end