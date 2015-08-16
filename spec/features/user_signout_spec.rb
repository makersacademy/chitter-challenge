feature 'user can sign out' do
  let!(:user) { create :user }
  scenario 'sign out' do
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_content "Hello #{user.name}"
  end
end