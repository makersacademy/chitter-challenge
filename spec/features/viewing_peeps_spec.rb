def populate_peeps(number)
  sign_up
  number.times do |n| 
    Peep.create(content: n.to_s, created_at: Time.now + n, user_id: 1)
  end
  visit('/peeps')
end

feature 'Feature: viewing peeps' do
  scenario 'peeps appear in reverse chronological order' do
    populate_peeps(5)
    expect(page.first(:xpath, '//div[@class="peep"]')).to have_content '4'
  end

  scenario 'maximum number of peeps shown is 20' do
    populate_peeps(100)
    expect(page.all(:xpath, '//div[@class="peep"]').count).to eq 20
  end
end

