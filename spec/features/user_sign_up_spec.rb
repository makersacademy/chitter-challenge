feature 'User Sign Up' do
  scenario 'There is a Sign Up Page' do
    visit '/users/new'
    expect(page.status_code).to be 200
    expect(page).to have_content "Sign Up"
  end
end
