feature 'new maker signup' do

  scenario 'a new maker can sign up with a username, email and password' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'sally@dogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'sallywag'
  end

  scenario 'password and confirmation password must match' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'sally@dogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'silly1'
    click_button 'sign up'
    expect(page).to have_content 'oops'
  end

  scenario 'password is encrypted' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'sally@dogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    maker = Maker.first
    expect(BCrypt::Password.new(maker.password_digest)).to eq 'sally1'
  end

  scenario 'email must be unique' do
    Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
    visit '/makers/sign_up'
    fill_in 'username', with: 'newsally'
    fill_in 'email', with: 'sally@dogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'oops'
  end

  scenario 'username must be unique' do
    Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'othersally@dogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'oops'
  end

  scenario 'email address must be valid' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'email', with: 'dogsdogsdogs.com'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'oops'
  end

  scenario 'all fields are required' do
    visit '/makers/sign_up'
    fill_in 'username', with: 'sallywag'
    fill_in 'password', with: 'sally1'
    fill_in 'confirm_password', with: 'sally1'
    click_button 'sign up'
    expect(page).to have_content 'oops'
  end

end
