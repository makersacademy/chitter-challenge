feature 'user signs in with existing account' do
  scenario 'user can sign in with existing account' do
    visit('/')
    click_button('sign in')
    expect(current_path).to eq '/sessions/new'
  end
end
