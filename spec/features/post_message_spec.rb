feature 'Post Message' do

  scenario 'user can post a message once they have signed in' do
    sign_up
    sign_in
    post_message
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hello everyone, this is my first "Cheep"!'
  end


end