feature 'Viewing peeps' do
  scenario 'User can see existing peeps on the peeps page' do
      sign_up
      create_peep
      expect(page).to have_content('Another peep!')
    end
  end
