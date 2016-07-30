feature 'creating peeps' do
  scenario 'I can create peeps' do
    sign_up
    visit '/peeps/new'
    fill_in 'comment', with: 'This is the first post'
    click_button 'Comment'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Shadow1 says: This is the first post'

  end



end
