feature 'Peeps' do

  context 'Viewing peeps' do
    xscenario 'I can see existing peeps on the peeps page' do
      Peep.create(body: 'First peep, ek!', time_posted: Time.now)
      visit '/'
      expect(page.status_code).to eq 200
      expect(page).to have_content('First peep, ek!')
    end
  end

    xcontext 'Posting peeps' do
      scenario 'I cannot post a peep if I am not logged in' do
        visit '/'
        expect(page).to have_content "Sign in"
      end

      xscenario 'I can post a peep if I am logged in' do
        sign_up
        fill_in 'body', with: 'I like peeping!'
        click_button 'Post peep!'
        expect(page).to have_content('I like peeping!')
      end

    end

  end
