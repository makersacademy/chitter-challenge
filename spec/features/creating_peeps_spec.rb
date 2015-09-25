feature 'Creating links' do

  scenario 'Attempts to peep without a login fail' do
    visit 'peeps/new'
    fill_in 'message',   with: 'my message'
    click_button 'Peep Peep!'
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('To Peep You Must Be a Peeper! Please Sign In And Be One Step Closer To Being Complete!')
  end


  scenario 'I can create a new peep and then view it' do
    sign_up
    visit '/peeps/new'
    fill_in 'message',   with: 'my message'
    click_button 'Peep Peep!'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('my message')
    end
  end


  def sign_up
    visit '/users/new'
    fill_in :email,    with: 'retesh@example.com'
    fill_in :password, with: 'retesh'
    fill_in :username, with: 'rets'
    click_button 'Sign up'
  end

end