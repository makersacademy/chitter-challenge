feature 'Post a message' do
  scenario 'I can post a message as a signed up user' do
    sign_up
    expect(current_path).to eq '/users'
    fill_in('peep', with: 'Hello world!')
    click_button('Post!')
    expect(User.all.peeps.map(&:message)).to include('Hello world!')
  end
end
