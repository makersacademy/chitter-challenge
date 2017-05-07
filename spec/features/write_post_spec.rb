feature 'Write a post' do

  let!(:user) do
    User.create(name: 'Robert',
                username: 'robbo',
                email: 'robert@robert.com',
                password: 'password',
                password_confirmation: 'password')
    end

    scenario 'I can write a new post' do
      sign_in(email: user.email,password: user.password)
      write_post
      within 'ul#posts' do
        expect(page).to have_content "I'm a new Peep!"
      end
    end


end
