feature 'user can sign in' do
  scenario 'User signs into site' do
    sign_up
    visit '/sessions/new'
    fill_in :email, with: 'sam@sam.sam'
    fill_in :password, with: 'sam1'
    click_on "Sign in"
    expect(page).to have_content 'Welcome to Chitter! Sam'
  end
end
