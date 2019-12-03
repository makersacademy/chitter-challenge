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
      expect(find('.peep-created-at').text).to match(/\d{2} \w{3} \d{4} at \d{2}:\d{2}\w{2}/)
    end
  end
end
