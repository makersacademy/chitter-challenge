feature 'post peep on chitter' do
  scenario 'I want to post a message (peep) online' do
    Homepage.create(message: "message")
    visit('/homepage')
    click_button 'Add new message'
    fill_in('message', with: 'hello')
    click_button 'Submit Message'

    within 'ul#homepage' do
    expect(page).to have_content('hello')
    end
  end
end

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
