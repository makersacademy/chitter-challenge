feature "User can sign_up" do
  scenario "User can enter user name and password and is taken to peep list" do
    connection = PG.connect(dbname: 'chitter_test')

    visit ('/user_authentication/sign_up')

    fill_in 'username', with: "Thomas01"

    fill_in 'password', with: 'password010'

    click_button 'Submit'

    expect(page).to have_content('Welcome to your Peep List bro!')
  end
end
