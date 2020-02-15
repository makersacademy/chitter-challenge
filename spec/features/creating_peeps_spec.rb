feature 'creating peeps' do
  scenario 'a user can post a peep to chitter' do
    visit 'peeps/new'
    fill_in('content', with: 'This is a test peep')
    click_button('Submit')
    expect(page).to have_content 'This is a test peep'
  end
end
