require 'timecop'

feature 'Message:' do
  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'Post a peep message, make sure peep, name and time are displayed' do
    Timecop.freeze do
      sign_up
      sign_in
      post_peep
      expect(page).to have_content("This is a new peep!")
      expect(page).to have_content("test")
      expect(page).to have_content Time.now.to_s[0..19]
    end
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'Display peeps in reverse chronological order' do
    sign_up
    sign_in
    post_peep(message: 'first message')
    post_peep(message: 'second message')
    expect(page).to have_content /second message.*first message/
  end
end
