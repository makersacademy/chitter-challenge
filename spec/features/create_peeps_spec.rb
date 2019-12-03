feature 'Creating peeps' do
  scenario 'Post a peep to Chitter' do
    visit ('peeps/new')
    fill_in('Peeps', with: 'Hello, friends this is my first peep')
    click_button('Post Peep')
    expect(page).to have_content 'Hello, friends this is my first peep'
  end
end
