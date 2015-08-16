require 'orderly'

feature 'Viewing Peeps' do
  before :each do
    create(:peep, content: "First Peep")
    create(:peep, content: "Second Peep")
    create(:peep, content: "Third Peep")
  end

  context 'when viewing the homepage' do
    scenario "users see peeps' content" do    
      visit '/'
      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"
      expect(page).to have_content "Third Peep"
    end

    scenario "users can see when peeps were created" do
      time = Time.now
      formatted_time_stamp = time.ctime
      peep = create(:peep, created_at: time)
      visit '/'
      expect(page).to have_content(formatted_time_stamp)
    end

    scenario 'peeps are in reverse chronological order' do
      visit '/'
      expect("Third Peep").to appear_before("Second Peep")
    end
  end
end