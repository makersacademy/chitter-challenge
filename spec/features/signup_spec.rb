feature 'sign up' do
  scenario 'user visits sign up page and can sign up' do
    sign_up('timmy', 'timmy@hello.com')
    expect(page).to have_content('Hello, timmy!')
  end

  scenario 'wrong confirmation password does not create new user' do
    expect { sign_up_password_mismatch }.to change { User.all.count }.by(0)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end


  scenario 'user must enter an email address when signing up' do
    sign_up('timmy', nil)
    expect(page.current_path).to eq '/users'
  end

  scenario 'user must enter a correctly formatted email address when signing up' do
    sign_up('timmy', 'timmy123')
    expect(page.current_path).to eq '/users'
  end

  scenario 'user cannot sign up with an already registered email address' do
    sign_up('timmy', 'timmy@hello.com')
    sign_up('timmy2', 'timmy@hello.com')
    expect(page.current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'user cannot sign up with an already taken username' do
    sign_up('timmy', 'timmy@hello.com')
    sign_up('timmy', 'bob@hello.com')
    expect(page.current_path).to eq '/users'
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'user has peeps associated with them' do
    sign_up('timmy', 'timmy@hello.com')
    post_peep('Hi there!')
    post_peep('Hello!')
    post_peep('My third peep!')
    expect(User.first.peeps.map(&:text)).to include('Hi there!', 'Hello!', 'My third peep!')
  end
end
