feature 'posting peeps' do
  scenario 'user can post a peep to the home page' do
    visit '/peeps/new'
    fill_in('content', with: 'hello world')
    click_button('peep')
    expect(page).to have_content('hello world')
  end
end
