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
    peep1 = create :peep, user_id: luffy.id
    peep2 = create :peep, user_id: luffy.id, content: "I'm hungry! WHERE'S THE MEAT!!"
    visit "/"
    expected_content = 
      "#{name_finder(luffy.id)} (#{username_finder(luffy.id)}) #{peep2.content} 
      peeped at #{ peep2.creation_time.strftime("%H:%M on %d/%m/%y") } 
      #{name_finder(luffy.id)} (#{username_finder(luffy.id)}) #{peep1.content}"
    within "ul#peeps" do 
      expect(page).to have_content expected_content
    end
  end
  scenario "peeps are displayed with the time they were created" do
    peep = create :peep, user_id: luffy.id
    visit "/"
    within "ul#peeps" do 
      expect(page).to have_content "peeped at #{ peep.creation_time.strftime("%H:%M on %d/%m/%y") }"
    end
  end
end