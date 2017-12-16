feature 'Users' do

  scenario 'users can sign up' do
    signup
    expect(User.count).to eq 1
    send_peep('Hey, its Joe!')
    expect(page).to have_content 'Hey, its Joe!'
    expect(page).to have_content '[JBloggy(joe bloggs)'
  end

  context 'Users must sign up correctly:' do

    scenario 'user cannot signup when password confirmation fails' do
      signup(password: 'jim')
      expect(current_path).to eq '/signup'
      expect(page).to have_content 'Password does not match the confirmation'
      expect(User.count).to eq 0
    end

    scenario 'user cannot sign up without an email address' do
      signup(email: nil)
      expect(page).to have_content 'Email must not be blank'
      expect(User.count).to eq 0
    end

    scenario 'user cannot sign up with an invalid email address' do
      signup(email: 'invalid')
      expect(page).to have_content 'Email has an invalid format'
      expect(User.count).to eq 0
    end

    scenario 'user cannot sign up with an email address which is already registered' do
      2.times { signup }
      expect(page).to have_content 'Email is already taken'
      expect(User.count).to eq 1
    end

    scenario 'user cannot sign up with no name' do
      signup(name: nil)
      expect(page).to have_content 'Name must not be blank'
      expect(User.count).to eq 0
    end

    scenario 'user cannot sign up with no username' do
      signup(username: nil)
      expect(page).to have_content 'Username must not be blank'
      expect(User.count).to eq 0
    end

    scenario 'user cannot sign up with a username which is already taken' do
      signup
      signup(email: 'jimbob@hotmail.co.uk')
      expect(page).to have_content 'Username is already taken'
      expect(User.count).to eq 1
    end

  end

end
