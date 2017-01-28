# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

require 'timecop'

feature 'Message:' do
  scenario 'Post a peep message, make sure peep, name and time are displayed' do
    Timecop.freeze do
      sign_up
      sign_in
      post_peep
      expect(page).to have_content("This is a new peep!")
      expect(page).to have_content("test")
      expect(page).to have_content Time.now
    end
  end
end
