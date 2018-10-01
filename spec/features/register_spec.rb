feature 'Register' do
  scenario 'button appears on top of page' do
    visit('/')
    expect(page).to have_button('Register')
  end

  scenario 'clicking on button leads to /users/new' do
    visit('/')
    find('#register-form').find('#register').click
    expect(current_path).to eq('/user/register')
  end

  scenario '/users/new contains register form' do
    visit('/')
    find('#register-form').find('#register').click
    expect(page).to have_css('#register')
  end

  scenario 'register form contains elements' do
    visit('/')
    find('#register-form').find('#register').click
    ['#name', '#user', '#email', '#password'].each do |element|
      expect(page).to have_css(element)
    end
  end

  scenario 'flashes registration succesful' do
    register
    expect(page).to have_content('Registration successful! You are now logged in!')
  end

  scenario 'flashes registration unsuccesful if using same user/email' do
    register
    logout
    register_same_user
    expect(page).to have_content('Sorry user/email already taken!')
  end
end
