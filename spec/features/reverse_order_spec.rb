# User Story Five
#
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'see all peeps' do

  before do
    User.create(
      name:                   'Test User Name',
      email:                  'test@test.com',
      password:               'qwerty',
      password_confirmation:  'qwerty')
  end

  scenario 'see peeps in reverse chronological order' do
    log_in_existing_user
    earlier_text = 'Earlier peep.'
    fill_in 'peep', with: earlier_text
    click_button 'post'
    later_text = 'Later peep.'
    fill_in 'peep', with: later_text
    click_button 'post'
    expect(first('.peep')).to have_content later_text
  end
end
