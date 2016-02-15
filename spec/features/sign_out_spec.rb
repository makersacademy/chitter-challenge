feature "SIGN OUT" do

  before(:each) do
    User.create(name: 'johnson',
                username: 'mr_johnson',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario '-> users can sign out while signed in' do
    sign_in(username: 'mr_johnson', password: 'secret1234')
    click_button 'Sign out'
    expect(page).to have_current_path('/')
    expect(page).to have_content('goodbye!')
  end

end
