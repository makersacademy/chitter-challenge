feature 'Users can sign-up' do
  scenario 'Users fill-in a form to sign-up' do
    visit('/')
    click_link 'Sign-up'
    fill_in :name, with: "Bob"
    fill_in :username, with: "bigbob"
    fill_in :email, with: 'bob@email.com'
    fill_in :password, with: '123abc'
    click_button 'Sign-up'
    expect(page).to have_content 'Welcome to Chitter, bigbob'
  end
end
