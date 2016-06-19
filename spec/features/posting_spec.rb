
feature 'Users can create a post' do
  scenario 'User creates a post' do
    sign_up
    visit '/post'
    fill_in 'comment', with: 'This is the best app ever!'
    click_button 'Create Post!'
    expect(current_path).to eq '/'
    expect(page).to have_content 'This is the best app ever!'
  end

  xscenario 'User can add a post to their account' do
    # expect(link.tags.map(&:name)).to include('education')
  end
end
