require 'pg'

feature 'Main Page /chitter' do
  scenario 'I want to see all peeps in chitter in reverse chronological order' do
  #   connection = PG.connect(dbname: 'chitter_test')
  #   connection.exec("INSERT INTO peeps (peep) VALUES ('I am the first peep');")
  #   connection.exec("INSERT INTO peeps (peep) VALUES ('I am the second peep');")

  # Refactor
    Chitter.post_peep(peep: 'I am the first peep', post_time: '12:00', post_date: '2020-03-14')
    Chitter.post_peep(peep: 'I am the second peep', post_time: '12:00', post_date: '2020-03-14')

    visit('/chitter')

    # Test the reverse chronological order
    expect(page.find('li:nth-child(1)')).to have_content 'I am the second peep'
    expect(page.find('li:nth-child(2)')).to have_content 'I am the first peep'
  end

  scenario 'I want to see the time and date of post' do
    Chitter.post_peep(peep: 'You can see the time and date', post_time: '12:00', post_date: '2020-03-14')

    visit('/chitter')
    expect(page).to have_content '12:00'
    expect(page).to have_content '2020-03-14'
  end

  scenario 'I want to see a sign up button that takes me to a form' do
    visit('/chitter')
    expect(page).to have_link('Sign Up', href: '/chitter/sign_up')
  end
end

feature 'Page Post_Peep' do
  scenario 'I can post a peep in chitter' do
    Chitter.post_peep(peep: 'I am a posted peep', post_time: '12:00', post_date: '2020-03-14')

    visit('/chitter/post_peep')
    fill_in 'peep', with: 'I am a posted peep'
    click_button 'submit'
    expect(page).to have_content 'I am a posted peep'
    expect(page).to have_content '12:00'
    expect(page).to have_content '2020-03-14'
  end

  feature 'Page Sign_Up' do
    scenario 'I want to sign up for chitter' do
      visit('/chitter/sign_up')
      fill_in 'name', with: 'Evaristo'
      fill_in 'username', with: 'SuperCactus'
      fill_in 'email', with: 'evaristo@supercactus.com'
      fill_in 'password', with: 'itsasecret'
      click_button 'submit'
      expect(page).to have_content 'Hello SuperCactus'
    end
  end

  feature 'Page User' do
    scenario 'I want to see a welcome username message' do
      # hardcoded
    end

    scenario 'I want to see a post peep button that takes me to the form' do
      visit('/chitter/user')
      expect(page).to have_link('Post Peep', href: '/chitter/post_peep')
    end

    scenario 'I want to see all the peeps' do
      Chitter.post_peep(peep: 'I am the first peep', post_time: '12:00', post_date: '2020-03-14')
      Chitter.post_peep(peep: 'I am the second peep', post_time: '12:00', post_date: '2020-03-14')

      visit('/chitter/user')

      expect(page).to have_content 'I am the first peep'
      expect(page).to have_content 'I am the second peep'
    end
  end
end
