feature 'Post a peep' do

  let(:user) do
    User.create(username: 'user1',
                email: 'hi@email.com',
                password: 'test',
                password_confirmation: 'test')
  end
  let(:message) { 'This is my first peep!' }

  scenario 'User can post a message' do
    sign_in(user.username, user.password)
    expect { peep(message) }.to change(Peep, :count).by 1
  end

  scenario 'Only signed in users can peep' do
    expect { Peep.create(message: 'peep') }.not_to change Peep, :count
  end

  scenario 'Peep is visible when posted' do
    sign_in(user.username, user.password)
    peep(message)
    expect(page).to have_content message
  end

  scenario 'Peeps show which user they were posted by' do
    sign_in(user.username, user.password)
    peep(message)

    within 'ul#peeps' do
      expect(page).to have_content user.username
    end
  end

  scenario 'Peeps are in reverse chronological order' do
    sign_in(user.username, user.password)
    peep('oldest peep')
    peep('newest peep')

    li = page.all('li')
    expect(li[0]).to have_content 'newest peep'
    expect(li[1]).to have_content 'oldest peep'
  end

  scenario 'Peeps show the time they were posted' do
    sign_in(user.username, user.password)
    peep("Peep")
    my_peep = Peep.first(message:"Peep")
    time = my_peep.time_posted.strftime("%I:%M%p,%e %b %Y")
    
    expect(page).to have_content time
  end


end
