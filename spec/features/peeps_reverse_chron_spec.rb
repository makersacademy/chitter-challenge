# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'so that users can see what others are saying' do
  scenario 'all peeps are in reverse chronological order' do
    visit '/'
    sign_up
    visit ('/post-peep')
    fill_in 'peep_content', with: "First peep!"
    click_button ('Post peep')

    visit ('/post-peep')
    fill_in 'peep_content', with: "Second peep!"
    click_button ('Post peep')

    visit '/homepage'
    expect("Second peep!").to appear_before("First peep!")
  end
end
