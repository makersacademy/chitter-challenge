# User Story Four
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peeps' do

  scenario 'user can post a peep to chitter' do
    text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus turpis elit, vitae venenatis odio laoreet et. Nunc in erat tempor quam maximus blandit.'
    post(text)
    expect(page).to have_content text
    expect(page).to have_content 'Test User Name'
  end
  scenario 'only logged in user can post peeps' do
    log_in_non_existing_user
    expect(page).not_to have_button 'post'
  end
end
