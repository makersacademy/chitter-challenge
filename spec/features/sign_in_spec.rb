feature 'Sign in' do
  scenario 'User can sign in with correct credentials' do
    signup("Factory", "factory@girl.com", '1234', '1234')    
    signin('factory@girl.com', '1234' )
    expect(current_path).to eq '/feed'
    expect(page).to have_content("Welcome Factory")
  end
end