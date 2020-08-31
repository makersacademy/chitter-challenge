feature 'User can see what time a peep was posted' do
  scenario 'posts and can see timestamp' do
    visit '/create_peep'
    fill_in 'peep', with: 'I am a test peep'
    click_button 'Post'
    expect(page).to have_content("I am a test peep Posted:#{Time.now}")
  end
end
