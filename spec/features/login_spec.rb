feature 'Login' do
  scenario 'button appears on top of page' do
    visit('/')
    expect(page).to have_button('Login')
  end

  scenario 'clicking on button leads to /users/login' do
    visit('/')
    find('#register-form').find('#login').click
    expect(current_path).to eq('/user/login')
  end

  scenario '/users/login contains login form' do
    visit('/')
    find('#register-form').find('#login').click
    expect(page).to have_css('#login')
  end

  scenario 'register form contains elements' do
    visit('/')
    find('#register-form').find('#login').click
    ['#user', '#password'].each do |element|
      expect(page).to have_css(element)
    end
  end

  scenario 'flashes login sucesful' do
    register
    logout
    login
    expect(page).to have_content('Login successful!')
  end

  scenario 'flashes login unsuccesful if password wrong' do
    register
    logout
    login_wrong
    expect(page).to have_content('Sorry login unsuccessful!')
  end

  scenario 'flashes login unsuccesful if not registered' do
    login
    expect(page).to have_content('Sorry login unsuccessful!')
  end
end
