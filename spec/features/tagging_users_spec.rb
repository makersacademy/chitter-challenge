feature 'tagging users' do
  scenario 'i want to tag a user and have their username linked' do
    user_sign_in
    fill_in("Peep content:", with: '&AzureDiamond you are a wonderful human being')
    click_button('Post Peep!')
    new_tweet = find(:xpath, '//div[@class="peep"][1]')
    expect(new_tweet).to have_link('&AzureDiamond', href: '/users/profile/2')
  end

  it 'creates html content from peep' do
    peep = Peep.new(user_id: 1, content: "&admin &AdMiN")
    peep.save!
    peep.process_user_tags
    expect(peep.html_content).to include("<a href='/users/profile/3'><b>&</b>admin</a>")
    expect(peep.html_content).to include("<a href='/users/profile/3'><b>&</b>AdMiN</a>")
  end

end
