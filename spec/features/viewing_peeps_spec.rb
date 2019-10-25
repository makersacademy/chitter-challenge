feature 'Viewing peeps' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Peep Manager'
    end
  end

  feature 'viewing peeps' do
    let(:time) { "12:12:12" }
    scenario 'peeps are visible' do
      Peep.create(time_stamp: time, message: "I am bored right now")
      Peep.create(time_stamp: time, message: "I am bored")
      Peep.create(time_stamp: time, message: "Binge watch time")

      visit '/peeps'

      expect(page).to have_content(time, "I am bored right now")
      expect(page).to have_content(time, "I am bored")
      expect(page).to have_content(time, "Binge watch time")
    end
  end
end
