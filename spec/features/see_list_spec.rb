require 'web_helpers'

feature 'sign in' do
  scenario 'user visits peep page and sees the list of peeps' do
    clear_table
    sign_in
    fill_in :content, with: 'This is the peep content'
    click_button 'Post Peep'
    sleep(1)
    fill_in :content, with: 'This is also peep content'
    click_button 'Post Peep'
    sleep(1)
    fill_in :content, with: 'This is my most recent peep'
    click_button 'Post Peep'
    expect(page).to have_content 'This is my most recent peep'
    expect(page).to have_content 'This is also peep content'
  end
end