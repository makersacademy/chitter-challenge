feature 'post peep on chitter' do
  scenario 'I want to post a message (peep) online' do
    Homepage.create(message: "message")
    visit('/homepage')
    # fill_in('message box', with: 'message')
    # click_button 'Send message'

    # within 'ul#homepage' do
    expect(page).to have_content('message')
    # end
  end
end


# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
