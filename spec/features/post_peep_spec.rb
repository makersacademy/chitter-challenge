feature 'Peeping' do
  scenario 'a new peep is posted' do
    visit('/')
    fill_in('message', with: 'it\'s a good time to try Chitter!')
    click_button('Peep!')

    expect(page).to have_content 'it\'s a good time to try Chitter!'
  end
end
