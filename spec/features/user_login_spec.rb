feature 'User login' do

  scenario 'users can login' do
    signup
    signup(email: 'jimbob@hotmail.com', username: 'JimBob')
    login
    expect(current_path).to eq '/chat'
    expect(page).to have_content 'Signed in as JBloggy'
  end
end
