feature 'Peeeeeps' do


  scenario 'without being logged in i can see peeps' do
    visit('/chitter')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="content"]')).to have_content('haha, does that look funny to you?')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="username"][1]')).to have_content('AzureDiamond')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="display-name"][1]')).to have_content('AD')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="created-at"][1]')).to have_content('2019-03-14 02:05:09')

    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="content"]')).to have_content('Bring Sally up: a thread /2')
    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="username"][1]')).to have_content('user1')
    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="display-name"][1]')).to have_content('Sally')
  end

  scenario 'after logging in i can see peeps and create a peep' do
    user_sign_in
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="content"]')).to have_content('haha, does that look funny to you?')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="username"][1]')).to have_content('AzureDiamond')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="display-name"][1]')).to have_content('AD')

    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="content"]')).to have_content('Bring Sally up: a thread /2')
    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="username"][1]')).to have_content('user1')
    expect(find(:xpath, '//div[@class="peep"][5]//div[@class="display-name"][1]')).to have_content('Sally')

    fill_in("Peep content:", with: 'admin')
    click_button('Post Peep!')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="content"]')).to have_content('admin')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="username"][1]')).to have_content('admin')
    expect(find(:xpath, '//div[@class="peep"][1]//div[@class="display-name"][1]')).to have_content('admin')

    expect(find(:xpath, '//div[@class="peep"][2]//div[@class="content"]')).to have_content('haha, does that look funny to you?')
    expect(find(:xpath, '//div[@class="peep"][2]//div[@class="username"][1]')).to have_content('AzureDiamond')
    expect(find(:xpath, '//div[@class="peep"][2]//div[@class="display-name"][1]')).to have_content('AD')

  end

  scenario 'after logging in i can reply to a peep' do
    user_sign_in
    first('.reply-button').click
    fill_in("Peep content:", with: 'this is a reply')
    click_button('Post Peep!')
    expect(page).to have_content('this is a reply')
  end

end
