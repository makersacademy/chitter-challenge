feature 'Creating peeps' do
  scenario 'Post a peep to Chitter' do
    visit ('peeps/new')
    fill_in('url', with: 'http://www.superdrug.com')
    fill_in('title', with: 'Superdrug')
    click_button('Post')
    expect(page).to have_content 'Hello, friends this is my first peep'
  end
end
