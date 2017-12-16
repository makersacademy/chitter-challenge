feature 'User signin' do

  scenario 'users can signin' do
    signup
    signup(email: 'jimbob@hotmail.com', username: 'JimBob')
    signin
    expect(current_path).to eq '/chat'
    expect(page).to have_content 'Signed in as JBloggy'
  end
end
