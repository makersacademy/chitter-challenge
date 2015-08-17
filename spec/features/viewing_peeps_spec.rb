require "spec_helper"

feature "peeps are visible" do
  let(:luffy) { build :user }

  before(:each) { sign_up(luffy) }

  scenario "can see peeps on the home page" do
    peep = create :peep, user: luffy
    visit "/"
    expect(current_path).to eq "/"
    expect(page).to have_content peep.content
  end
  scenario "peeps are displayed with the peepers name and username" do 
    create :peep, user: luffy
    visit "/"
    within "ul#peeps" do
      expect(page).to have_content luffy.name
      expect(page).to have_content luffy.username
    end
  end
  scenario "peeps are displayed in reverse chronological order" do
    peep1 = create :peep, user: luffy
    peep2 = create :peep, user: luffy, content: "I'm hungry! WHERE'S THE MEAT!!"
    visit "/"
    expected_content = 
      "#{luffy.name} (#{luffy.username}) #{peep2.content} 
      peeped at #{ peep2.creation_time.strftime("%H:%M on %d/%m/%y") } 
      #{luffy.name} (#{luffy.username}) #{peep1.content}"
    within "ul#peeps" do 
      expect(page).to have_content expected_content
    end
  end
  scenario "peeps are displayed with the time they were created" do
    peep = create :peep, user: luffy
    visit "/"
    within "ul#peeps" do 
      expect(page).to have_content "peeped at #{ peep.creation_time.strftime("%H:%M on %d/%m/%y") }"
    end
  end
end