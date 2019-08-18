feature 'each user has a page' do

  scenario 'click a user name and see their tweets' do
    visit('/chitter')
    # Click user name
    find(:xpath, '//div[@class="peep"][1]//div[@class="username"][1]').first(:link).click
    expect(current_path).to eq("/users/profile/2")
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="content"]')).to have_content('haha, does that look funny to you?')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="username"][1]')).to have_content('AzureDiamond')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="display-name"][1]')).to have_content('AD')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="created-at"][1]')).to have_content('2019-03-14 02:05:09')
    expect(page).not_to have_content('Bring Sally up: a thread /2')
  end

end
