feature 'Users can sign-up' do
  scenario 'Users fill-in a form to sign-up' do
    visit('/')
    fill_in :name, with: "Bob"
    fill_in :username, with: "bigbog"
    fill_in :email, with: 'bob@email.com'
    fill_in :password, with: '123abc'
    expect(page).to have_content 'Welcome to Chitter, bigbob'
  end
end
