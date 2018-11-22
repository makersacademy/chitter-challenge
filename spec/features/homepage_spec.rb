feature 'Viewing the homepage' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    find('input[type="text"][name*="peep_content"]')
    expect(page).to have_button('Send New Peep')
  end
end

# feature 'Posting a message to Chitter' do
#   scenario 'posting a message from the homepage' do
#     visit('/')
#     fill_in 'peep_content', with: 'Hi, everybody!'
#     click_button 'Send New Peep'
#     expect(page).to have_content 'Hi, everybody!'
#   end
# end
