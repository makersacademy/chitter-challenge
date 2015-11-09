# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peep on chitter' do
  scenario 'successful current user who signed up can leave a message' do
    sign_up
    click_button('Leave a peep')
    fill_in :message, with: 'I am loving it!'
    click_button('Peep it now')
    expect(page).to have_content 'I am loving it!'
  end
end
