feature "User can sign in to post messages" do

  before (:each) do
    @user = User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
  end

  scenario "allows user to signin with correct crediential" do
    visit ('/session/new')
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Sign In'
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Welcome, #{@user.username}"
  end

  scenario "doesn't allow user to signin with incorrect crediential" do
    visit ('/session/new')
    fill_in :email, with: @user.email
    fill_in :password, with: 'wrong'
    click_button 'Sign In'
    expect(page).to have_current_path '/session/new'
    expect(page).to have_content "Yours crediential do not match"
  end

end
