
feature 'Sign Up' do

  scenario 'user can sign in using form' do
    visit '/users/new'
    fill_in :name, with: 'Alex'
    fill_in :user_name, with: 'as4273'
    fill_in :email, with: 'alex@hotmail.com'
    fill_in :password, with: 'test1234'
    click_button 'Sign Up'
    user = User.first.user_name
    expect(page).to have_content "Welcome #{user}"
  end

end