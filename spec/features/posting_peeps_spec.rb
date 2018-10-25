feature 'posting peeps' do
  scenario 'the user can post a peep and see it on the screen' do
    visit '/peeps/post'
    fill_in :message, with: 'Hello world'
    click_button 'Post'
    expect(page).to have_content 'Hello world'
  end
end
