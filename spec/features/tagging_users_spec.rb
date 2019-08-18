feature 'tagging users' do
  scenario 'i want to tag a user and have their username linked' do
    user_sign_in
    fill_in( "Peep content:" ,with: '&AzureDiamond you are a wonderful human being' )
    click_button('Post Peep!')
    new_tweet = find(:xpath ,'//div[@class="peep"][1]')
    expect(new_tweet).to have_link('&AzureDiamond',href: '/users/profile/2')
  end


end