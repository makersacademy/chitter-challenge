feature 'login' do
  scenario 'user can login to chitter' do
    signup
    login
    expect(page).to have_content "Joe Bloggs"
  end
end
