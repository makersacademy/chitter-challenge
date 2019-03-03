require "setup_test_database"
feature 'Posting a peep' do
  scenario 'user can post a message' do
    visit('/chat')
    setup_test_database
    click_button('Post')
    expect(page).to have_content('Esmeralda', 'Envio un mensaje')
  end
end
