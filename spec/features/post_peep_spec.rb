feature 'Posting peeps' do
  scenario 'user can post a peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'blablabla!'
    click_button 'Post'
    expect(page).to have_content('blablabla!')
  end
end
