feature 'Adding message' do

  scenario 'I can add a message' do
    visit('/')
    click_button('Create message')
    fill_in('message_input', with: "I love Sinatra!")
    click_on('message_submit')

    within('ul#peeps') do
      expect(page).to have_content('I love Sinatra!')
    end

  end
end
