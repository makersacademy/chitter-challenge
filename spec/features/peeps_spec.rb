require 'orderly'

feature 'peeps' do
  scenario 'user can add a peep if logged in' do
    User.new(name: 'Dec', user_name: 'dk', email: 'dec@dec.com', password: 'pa55word').save
    visit('/log-in')
    fill_in('username', with: 'dk')
    fill_in('password', with: 'pa55word')
    click_button('log in')
    fill_in('body', with: '#waffles')
    click_button('post')
    expect(page).to have_content('#waffles')
  end

  scenario 'user cannot add a peep if not logged in' do
    visit('/peeps')
    expect(page).to_not have_content("What's up?")
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

  scenario 'date is displayed' do
    date_posted = Time.new(2020, 10, 31, 17, 20, 3)
    Peep.new(body: 'cats', created_at: date_posted).save
    visit('/peeps')
    expect(page).to have_content('Posted at 17:20 on 31/10/2020')
  end
end
