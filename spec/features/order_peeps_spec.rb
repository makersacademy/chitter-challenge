require 'orderly'
feature 'Order peeps' do
  scenario 'orders peeps in reverse chronological order' do
    visit('/peeps/post')
    fill_in 'title', with: '1'
    fill_in 'content', with: 'first peep'
    click_button 'Post peep'

    visit('/peeps/post')
    fill_in 'title', with: '2'
    fill_in 'content', with: 'second peep'
    click_button 'Post peep'
    expect('second peep').to appear_before('first peep')
  end
end
