feature 'Posting a peep' do
  scenario 'user can post a message' do
    visit('/chat')
    fill_in('nickname', with: 'Esmeralda')
    fill_in('msg', with: 'Envio un mensaje')
    click_button('Post')
    expect(page).to have_content('Esmeralda', 'Envio un mensaje')
  end
end
