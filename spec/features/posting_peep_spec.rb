feature 'User posts a peep' do

  let!(:user) do
    User.create(email: 'kluczynskib@gmail.com',
                name: 'Bart',
                username: 'bartklu',
                password: '12345',
                password_confirmation: '12345')
  end

    scenario 'posting a peep when logged in' do
        log_in(email: user.email, password: user.password)
        visit('/peeps/new')
        fill_in :title, with: 'titleokay'
        fill_in :body, with: 'this is a nice peep'
        click_button 'Peep!'
        expect(page).to have_content 'titleokay'
    end


      scenario 'seeing the username and the name of the user' do
          log_in(email: user.email, password: user.password)
          visit('/peeps/new')
          fill_in :title, with: 'titleokay'
          fill_in :body, with: 'this is a nice peep'
          click_button 'Peep!'
          expect(page).to have_content 'Written by: '
          expect(page).to have_content '@bartklu'

      end

  scenario 'seeing the time when the peep has been published' do
    @time_now = Time.now
    allow(Time).to receive(:now).and_return('21:00')
      log_in(email: user.email, password: user.password)
      visit('/peeps/new')
      fill_in :title, with: 'titleokay'
      fill_in :body, with: 'this is a nice peep'
      click_button 'Peep!'
      visit('/peeps')
      expect(page).to have_content '21:00'

  end


    def log_in(email:, password:)
      visit '/sessions/new'
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log in'
    end


end
