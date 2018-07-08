feature 'Posting on Chitter' do
  scenario 'a user can post an peep on Chitter' do
    visit('/')
    fill_in('posts_a_peep', with: 'This is a first peep')
    click_button 'Post'
    expect(page).to have_content 'This is a first peep'
  end
end
