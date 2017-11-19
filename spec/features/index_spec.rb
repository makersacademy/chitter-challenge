
feature "sign in" do
  scenario "when opening page enter info" do
    visit '/'
    click_button('Sign In')
    fill_in('email', :with => 'joecowton@hotmail.com')
    fill_in('password', :with => 'end')
    click_on('Sign In')
    expect(page).to have_content "Welcome, joecowton@hotmail.com"
  end
end

feature "tweet new" do
  scenario "when doing tweet return to tweets page" do
    sign_up
    fill_in('Tweet', with: 'this is a tweet')
    click_button('Submit')
    expect(page).to have_content "this is a tweet"
  end
end


feature 'User log in' do
  let!(:user) do
    User.create(email: 'person@example.com', username: 'user123', name: 'user', password: 'whatever2000', password_confirmation: 'whatever2000')
  end

  scenario 'as existing user' do
    sign_in(email: 'joecowton@gmail.com', password: 'end')
    expect(page).to have_content "Add tweet"
  end
end
