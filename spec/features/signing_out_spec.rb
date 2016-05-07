feature 'Sign Out' do

  before(:each) do
    User.create(username: 'Megatron',
                email: 'megatron@decepticons.cyb',
                password: 'optimussucks',
                password_confirmation: 'optimussucks')
  end


  scenario 'user can sign out after signing in' do
    sign_in
    click_button 'Sign Out'
    expect(page).to have_content('Till next time Megatron')
    expect(page).not_to have_content('Welcome Megatron')
  end

end