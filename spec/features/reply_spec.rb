feature 'Adding tags' do

  def sign_in(user)
    visit'/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

  def test_peep(peep)
    click_link 'Make peep'
    fill_in :message, with: peep
    click_button 'Peep'
  end

  scenario 'I can add a reply to peep' do
    user = create(:user)
    sign_in(user)
    test_peep('Reply to me')
    click_link 'Reply'
    p current_path
    fill_in :message, with: 'OK'
    click_button "reply"
    expect(page).to have_content 'anon1 OK'
  end

end
