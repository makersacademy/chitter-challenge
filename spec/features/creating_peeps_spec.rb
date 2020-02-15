feature 'creating peeps' do
  scenario 'a user can post a peep to chitter' do
    # post_time = Time.new(2019, 12, 25, 12, 0, 0, "+00:00")
    # Timecop.freeze(post_time)
    visit 'peeps/new'
    fill_in('content', with: 'This is a test peep')
    click_button('Submit')
    expect(page).to have_content 'This is a test peep'
  end
end
