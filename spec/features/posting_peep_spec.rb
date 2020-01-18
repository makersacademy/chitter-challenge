feature 'Post peep' do
  scenario 'A user can post a peep on chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'This is a peep!')
    click_button('Submit')

    expect(page).to have_content "This is a peep!"
  end
end
