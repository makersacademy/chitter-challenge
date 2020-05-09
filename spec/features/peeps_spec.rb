require 'orderly'

feature 'peeps' do
  scenario 'user can add a peep' do
    visit('/peeps')
    fill_in('body', with: '#waffles')
    click_button('post')
    expect(page).to have_content('#waffles')
  end

  scenario 'user can see peeps in chronological order' do
    Peep.new(body: 'cats', created_at: Time.now).save
    Peep.new(body: 'pancakes', created_at: Time.now + 3600).save
    Peep.new(body: 'feelings', created_at: Time.now - 2000).save

    visit('/peeps')

    element_1 = find_by_id('feelings')
    element_2 = find_by_id('cats')
    element_3 = find_by_id('pancakes')

    expect(element_3).to appear_before(element_2)
    expect(element_2).to appear_before(element_1)
  end
end
