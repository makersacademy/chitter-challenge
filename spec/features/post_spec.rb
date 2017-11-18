feature 'Post a message' do
  scenario 'I can post a message as a signed up user' do
    sign_up
    expect(current_path).to eq '/users'
    fill_in('peep', with: 'Hello world!')
    expect { click_button('Post!') }.to change(Peep, :count).by(1)
    expect(Peep.first.user.username).to eq 'King'
  end
end
