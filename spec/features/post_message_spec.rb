feature 'User posts a message' do
  it 'should allow the user to post a message onto the feed/page' do
    visit('/chitter/new')
    fill_in('message', with: 'Happy Easter')
    click_button('Submit')

    expect(page).to have_content('Happy Easter')
  end
end
