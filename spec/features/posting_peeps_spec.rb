require 'timecop'

feature 'posting peeps' do
  scenario 'the user can post a peep and see it on the screen' do
    visit '/peeps/post'
    fill_in :message, with: 'Hello world'
    click_button 'Post'
    expect(page).to have_content 'Hello world'
  end
end

feature 'listing peeps' do
  scenario 'user can see peeps in reverse chronological order' do
    time = Time.now
    Timecop.freeze(time) do
      Peep.create(message: 'number 1', time: time)
      Peep.create(message: 'number 2', time: time)
      visit '/peeps'
    end
    expect(page).to have_content("number 2 Posted at: #{(time.strftime("%Y-%m-%d %k:%M"))} number 1 Posted at: #{(time.strftime("%Y-%m-%d %k:%M"))}")
  end
end

  feature 'time of peep' do
    scenario 'user can see the time a peep was posted' do
      time = Time.now
      Timecop.freeze(time) do
        Peep.create(message: 'hello', time: time)
        visit '/peeps'
      end
      expect(page).to have_content("hello Posted at: #{(time.strftime("%Y-%m-%d %k:%M"))}")
    end
  end
