require 'timecop'
require 'peep'

feature 'Viewing hompage' do
  scenario 'A user can see peeps' do
    visit('/')
    expect(page).to have_content "Timeline"
  end
end

  feature 'Viewing peeps' do
    scenario 'Users can view posted peeps time in reverse chronological order' do
      Timecop.freeze(time = Time.now) do
        Peep.create(message: 'First peep here!', created_at: Time.now)
        Peep.create(message: 'Second peep is also here!', created_at: Time.now)
      end
      visit('/peeps')
      expect(page).to have_content("Second peep is also here! Posted at: #{time.strftime("%Y-%m-%d")}\nFirst peep here! Posted at: #{time.strftime("%Y-%m-%d")}")
    end
  end
