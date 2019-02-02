RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

feature do
  scenario 'peeps are in reverse chronological order' do
    first = 'This is test peep 1'
    second = 'This is test peep 2'
    visit '/'
    fill_in 'new_peep', with: first
    click_button 'Post'
    fill_in 'new_peep', with: second
    click_button 'Post'
    expect(second).to appear_before first
  end
end
