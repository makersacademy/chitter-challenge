# frozen_string_literal: true

feature 'Post new peep' do
  scenario 'User inputs peep message and clicks "Post"' do
    visit '/peeps/post'
    within('#post_peep_form') do
      fill_in 'peep_message', with: 'I ate a plum!'
      click_on 'Post'
    end

    # user is redirected to /peeps
    within('.peeps') do
      expect(page).to have_content('I ate a plum!')
    end
  end
end
