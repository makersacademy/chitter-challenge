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

feature 'Feature: view peep by id' do
  scenario 'user views peep by id' do
    populate_peeps(10)
    visit('/peeps/7')
    expect(page.first(:xpath, '//div[@class="peep"]')).to have_content '6'
  end

  scenario 'user views non-existent peep by id' do
    populate_peeps(10)
    visit('/peeps/11')
    expect(page.status_code).to be 404
  end
end

feature 'Feature: view peep by user handle' do
  scenario 'user views other user who exists' do
    populate_peeps(10)
    click_button('Logout')
    sign_up(handle: 'other', email: 'otherguy@domain.com')
    peep(content: 'a peep')
    visit('/peeps/users/2')
    expect(page.first(:xpath, '//div[@class="peep"]')).to have_content 'a peep'
  end

  scenario 'user views non-existent peep by id' do
    visit('/peeps/users/11')
    expect(page.status_code).to be 404
  end
end

feature 'Feature: view peep by hashtag' do
  scenario 'user views hashtag which exists' do
    populate_peeps(10)
    peep(content: 'a #hashtag')
    visit('/tags/1')
    expect(page.first(:xpath, '//div[@class="peep"]'))
      .to have_content 'a #hashtag'
  end

  scenario 'user views non-existent peep by id' do
    visit('/tags/100')
    expect(page.status_code).to be 404
  end
end
