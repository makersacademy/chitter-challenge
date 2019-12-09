feature 'Send user to a new message page' do
  scenario 'Allow user to resend another message' do
    sign_in_and_chatter
    fill_in 'message', with: 'Henlo World'
    click_button 'post'
    click_button 'Send new peep'
    expect(page).to have_content 'Post'
    expect(current_path).to eq '/peeps/new'
  end
end
