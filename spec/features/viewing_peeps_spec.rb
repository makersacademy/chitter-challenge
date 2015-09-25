require 'orderly'

feature 'Viewing Peeps' do
  before :all do
    @time = Time.now
    create(:peep, content: "First Peep", created_at: @time)
    create(:peep, content: "Second Peep")
    create(:peep, content: "Third Peep")
  end

  context 'when viewing the homepage' do
    before(:each){ visit '/' }

    scenario "users see peeps' content" do
      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"
      expect(page).to have_content "Third Peep"
    end

    scenario "users can see when peeps were created" do
      expect(page).to have_content(@time.ctime)
    end

    scenario 'peeps are in reverse chronological order' do
      expect("Third Peep").to appear_before("Second Peep")
    end
  end
end