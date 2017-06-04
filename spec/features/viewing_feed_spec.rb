feature 'personal feed of user' do
  scenario 'user can see button to make new post' do
    visit('/posts/all')
    click_button('New Peep')
    expect(current_path).to eq('/posts/new')
  end
end
