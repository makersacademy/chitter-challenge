feature do
  scenario 'adds the peep to the feed' do
    visit '/'
    fill_in 'new_peep', with: 'Just a test peep'
    click_button 'Post'
    expect(page).to have_content 'Just a test peep'
  end
end
