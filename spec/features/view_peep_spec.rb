feature 'Viewing peeps' do
  scenario 'a user can see peeps in reverse chronological order' do
    visit('/')
    fill_in('posts_a_peep', with: 'first')
    click_button 'Post'
    fill_in('posts_a_peep', with: 'second')
    click_button 'Post'
    fill_in('posts_a_peep', with: 'third')
    click_button 'Post'
    expect(page).to have_content("third second first")
  end
end
