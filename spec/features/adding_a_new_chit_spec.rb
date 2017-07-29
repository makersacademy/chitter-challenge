feature 'Adding a new chit' do
  scenario 'user posts a chit and can view it' do
    visit('/')
    click_button('new')
    fill_in 'chitbody', with: 'Chitter is awesome!'
    click_button('submit')
    expect(page).to have_content('Chitter is awesome!')
  end
end
