feature 'creating peeps' do
  scenario 'I can create peeps' do
    sign_up
    post_a_comment(comment: 'This is the first post')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is the first post'
  end

  scenario 'I can create peeps from the main page' do
    sign_up
    visit '/peeps'
    fill_in 'comment', with: 'This is the first post'
    click_button 'Comment'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is the first post'
  end
end
