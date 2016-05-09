feature 'Peeps' do

  let(:user) do
    User.create(name: 'Sity',
                username: 'sitypop',
                email: 'sity@ilovefalafel.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  context 'Viewing peeps' do
    scenario 'I can see existing peeps on the peeps page when I ' do
      Peep.create(body: 'First peep, ek!', time_posted: Time.now, user_id: user.id)
      visit '/peeps'
      expect(page).to have_content('First peep, ek!')
    end
  end

    context 'Posting peeps' do
      scenario 'I cannot post a peep if I am not logged in' do
        visit '/'
        expect(page).to have_button "Sign in"
      end

      scenario 'I can post a peep if I am logged in' do
        sign_up
        click_button 'fancy a peep?'
        fill_in :body, with: 'I like peeping!'
        click_button 'Peep me!'
        expect(page).to have_content('I like peeping!')
      end

    end

  end
