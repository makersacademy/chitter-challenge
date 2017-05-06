feature 'log in capability' do
  scenario 'user can sign up' do
    DatabaseCleaner.clean
    sign_up
    fill_in 'password', with: 'hot7575'
    fill_in 'password_confirmation', with: 'hot7575'
    click_button 'submit'
    expect(User.count).to eq 1
    expect(page).to have_content 'Welcome hyper0009'
  end

  scenario 'user has to confirm password' do
    sign_up
    fill_in 'password', with: 'hot7575'
    fill_in 'password_confirmation', with: 'dsfsdf'
    click_button 'submit'
    expect(User.count).to eq 1
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user must enter required fields' do
    visit '/'
    fill_in 'name', with: 'Ahmed'
    fill_in 'user_name', with: 'hyper0009'
    fill_in 'email', with: nil
    fill_in 'password', with: 'hot7575'
    fill_in 'password_confirmation', with: 'hot7575'
    click_button 'submit'
    expect(User.count).to eq 1
  end

  scenario 'users email must have true format' do
    visit '/'
    fill_in 'name', with: 'Ahmed'
    fill_in 'user_name', with: 'hyper0009'
    fill_in 'email', with: 'hyssgddg@boogyman'
    fill_in 'password', with: 'hot7575'
    fill_in 'password_confirmation', with: 'hot7575'
    click_button 'submit'
    expect(User.count).to eq 1
  end

  scenario 'prevents duplicate registration' do
    sign_up
    fill_in 'password', with: 'hot7575'
    fill_in 'password_confirmation', with: 'hot7575'
    click_button 'submit'
    expect(User.count).to eq 1
    expect(page).to have_content 'This email is already registered'
  end



  #scenario 'user can log in after signing up' do
  #  visit '/'
  #  fill_in 'login_id', with: 'hyper0009'
  #  fill_in 'login_pass', with: 'hot7575'
  #  click_button 'login'
  #  expect(page).to have_content 'Welcome hyper0009'
  #end
end
