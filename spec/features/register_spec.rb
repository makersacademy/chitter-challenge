feature 'Users can sign up for the service' do

  it 'with valid and correct entries' do
    sign_up(name:                   'Another test',
            email:                  'test@test.com',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(1)
    expect(page).to have_content 'Hi, test'
    expect(User.first.email).to eq('test@test.com')
  end

  it 'but not with two non-identical passwords. Helpful error displayed' do
    sign_up(name:                   'Another test',
            email:                  'test@test.com',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
    expect(current_path).to eq '/user/register'
    expect(page).to have_content('Password does not match the confirmation')
  end
end

feature 'User cannot sign up' do
  it 'if they have not entered an email' do
    sign_up(name:                   'Another test',
            email:                  '',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
  end

  it 'with an invalid email' do
    sign_up(name:                   'Another test',
            email:                  'test@test.com',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
  end

  it 'if email address has previously been registered' do
    sign_up
    sign_up(name:                   'Another test',
            email:                  'test@test.com',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
    expect(page).to have_content('Email is already taken')
  end

  it 'if username has previously been registered' do
    sign_up
    sign_up(name:                   'Another test',
            email:                  'test@test.com',
            username:               'test',
            password:               'test',
            password_confirmation:  'test',
            click:                  false)
    expect{ click_button 'Sign up' }.to change{ User.all.count }.by(0)
    expect(page).to have_content('Username is already taken')
  end

end
