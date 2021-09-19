describe 'User Interface', type: :feature do

  before do
    visit('/')
  end
  
  context 'Check page layout' do

    it 'has navbar' do 
      expect(page).to have_content("Welcome To Chitter")
    end

  end

  context 'I want to post a message (peep) to chitter' do

    it 'checks form submits' do
      sign_up
      fill_in('post-message', with: 'Party')
      click_button('Post')
    end

    it 'confirms data added was correct' do
      user = PGDatabase.con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", ['admin', 'admin@admin.com' , 'password']).first
      instance = PGDatabase.create_message(user_id: user["id"], message:'test').first
      check_stored = select_all_from_message(id: instance.id) 

      expect(instance).to be_a Message
      expect(instance.id).to eq check_stored['id']
      expect(instance.message).to eq 'test'
    end

  end

  context 'I want to see all peeps in reverse chronological order' do

    before do
      sign_up
    end

    it 'displays dummy data' do
      visit('/home')
      expect(page).to have_content("Lovely Stuff")
      expect(page).to have_content("Lovely Stuff 2")
    end

    it 'checks order' do
      section = find(".message", match: :first)
      expect(section).to have_text('Lovely Stuff 3')
    end

  end

  context 'I want to sign up for Chitter' do

    it 'checks buttons' do
      click_button('Sign Up')
      visit('/')
      click_button('Sign In')
    end

    it 'can signup' do
      visit('/')
      click_button('Sign Up')
      fill_in('username', with: 'username')
      fill_in('email', with: 'username@gmail.com')
      fill_in('password', with: 'password')
      click_button('Sign up')
      expect(page).to have_content "username"
    end

  end

  context 'I want to log in to Chitter' do

    it 'logs in' do
      User.add(username: 'login', email: 'test@example.com', password: 'password123')
      visit('/users/signin')
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Sign in')
    end

    it 'wrong username' do
      # User.add(username: 'login', email: 'test@example.com', password: 'password123')
      visit('/users/signin')
      fill_in(:email, with: 'wrongemail@example.com')
      fill_in(:password, with: 'password123')
      click_button('Sign in')
      expect(page).to have_content 'Incorrect email or password - Please try again'
    end

    it 'wrong password' do
      User.add(username: 'login', email: 'test@example.com', password: 'password123')
      visit('/users/signin')
      fill_in(:email, with: 'wrongemail@example.com')
      fill_in(:password, with: 'password124')
      click_button('Sign in')
      expect(page).to have_content 'Incorrect email or password - Please try again'
    end

  end

  context 'I want to log out' do

    it 'log out' do
      sign_up
      click_button('Logout')
      expect(page).to have_content 'Welcome To Chitter'
    end

  end

  context 'I want to be able to reply to peoples messages' do

    it 'replies' do
      PGDatabase.con.exec("TRUNCATE message, users, reply;")
      sign_up
      user =  PGDatabase.create_user(username: 'username', email: 'email', password: 'dd')
      PGDatabase.create_message(user_id: user["id"], message:'test').first
      visit('/home')
      fill_in(:reply, with: 'This is a reply')
      click_button("Reply")
    end

  end

end
