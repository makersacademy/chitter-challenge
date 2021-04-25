feature 'a user can post a peep to Chitter' do
  scenario 'a user posts their first peep to chitter' do
    visit '/'
    fill_in('peep', with: 'Hello world')
    click_button('Post your peep')

    expect(page).to have_content 'Hello world'
  end
end
