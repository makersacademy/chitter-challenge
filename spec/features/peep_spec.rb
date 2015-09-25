feature 'Display peeps' do

  scenario'Post a peep' do
    user = create(:user)
    password = 'squitecret1234'
    sign_in(user.email, password)
    fill_in :peep, with: 'my peep'
    click_button 'Post'
    expect(page).to have_content('my peep')
  end

end