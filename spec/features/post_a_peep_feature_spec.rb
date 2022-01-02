require_relative '../web_helpers.rb'
require_relative '../database_helpers.rb'

feature 'Post a peep' do
  context 'User is not logged in' do
    scenario 'User cannot post a peep' do
      visit('/')
      expect(page).not_to have_button('Write a Peep')
    end

    scenario 'User can still see peeps posted' do
      add_user_to_DB()
      add_five_peeps_to_DB()
      visit('/')

      expect(page).to have_content('Johnny S')

      expect(page).to have_content('Hey')
      expect(page).to have_content('Hi')
      expect(page).to have_content('Hello')
      expect(page).to have_content('Yo')
      expect(page).to have_content('Good day')
    end
  end

  context 'User is logged in' do
    before do
      add_user_and_log_in()
    end

    scenario 'The user can see a textarea and a post button' do
      expect(page).to have_field('peep_input')
      expect(page).to have_button('Post Peep')
    end

    scenario 'The user can post a peep and see it in the feed' do
      peep_body = 'Hello Chitter!, this is a test peep.'
      post_a_peep(peep_body)
      expect(page).to have_content(peep_body)
    end
  end
end