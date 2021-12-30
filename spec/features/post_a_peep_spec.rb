require_relative '../web_helpers.rb'

feature 'Post a peep' do
  context 'User is not logged in' do
    scenario 'User cannot post a peep' do
      visit('/')
      expect(page).not_to have_button('Write a Peep')
    end
  end

  context 'User is logged in' do
    scenario 'The user can see a textarea and a post button' do
      add_user_and_log_in()
      expect(page).to have_field('peep_input')
      expect(page).to have_button('Post Peep')
    end

    scenario 'The user can post a peep and see it in the field' do
      
    end
  end
end