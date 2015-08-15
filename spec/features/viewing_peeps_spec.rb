require "spec_helper"

feature "peeps are visible" do
  let(:luffy) { create :user }

  before(:each) do 
    sign_in(luffy.email, luffy.password)
  end
  scenario "can see peeps on the home page" do
    peep = build :peep
    post_peep(peep)
    expect(current_path).to eq "/"
    expect(page).to have_content peep.content
  end
  scenario "peeps are displayed with the peepers name and username" do 
    post_peep(build :peep)
    expect(current_path).to eq "/"
    within "ul#peeps" do
      expect(page).to have_content luffy.name
      expect(page).to have_content luffy.username
    end
  end
  scenario "peeps are displayed in reverse chronological order" do
    peep1 = "I'm going to be King the Pirates!"
    peep2 = "I'm hungry! WHERE'S THE MEAT!!"
    post_peep(build :peep)
    post_peep(build :peep, content: peep2)
    expected_content = "#{name_finder(11)} 
      (#{username_finder(11)}) #{peep2} #{name_finder(11)} 
      (#{username_finder(11)}) #{peep1}"
    within "ul#peeps" do 
      expect(page).to have_content expected_content
    end
  end
end