feature "sign out" do
  before(:each) do
    User.create(name: 'test', email: 'test@test.com', password: 'welcome01', password_confirmation: 'welcome01')
  end

  scenario 'sign out' do
    sign_in(email: 'test@test.com', password: 'welcome01')
    click_button 'Sign out'
    expect(page).to have_content('See you next time!')
    expect(page).not_to have_content('Welcome, test')
  end
end
