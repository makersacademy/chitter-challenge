feature 'Adding peeps' do
  scenario 'A user can add peeps' do
    visit ('/')
    fill_in('peep', with: 'I Like Chitter')
    fill_in('username', with: 'user1')
    click_button 'Share Peep!'
    expect(page).to have_content 'I Like Chitter'
  end
end
