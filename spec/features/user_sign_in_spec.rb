feature 'User sign in' do

  scenario 'I am welcomed after signing in' do
    visit '/'
    user = create :user
    sign_in_as(user)
    expect(page).to have_content("dbatten")
  end

end