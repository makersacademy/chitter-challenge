feature 'When creating peeps' do

  let!(:user) do
    User.create(email_address: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end


  scenario 'I can make new peeps on the peeps page, after signup' do
    # As a Maker
    # So that I can let people know what I am doing
    # I want to post a message (peep) to chitter
        p $current_peeper
    sign_up
    p $current_peeper
    fill_in :peep_body, with: "I'm creeping and I'm peeping"
    p $current_peeper
    click_button 'Peep'
        p $current_peeper
        p User.all
        p user.id
        p User.last.id
        p $peep
    expect(find_by_id('peeps_list')).to have_content("I'm creeping and I'm peeping"  + ' (Harry Blackstone Copperfield Dresden - @Hoss')
    expect(page).to_not have_content('If you were signed in you could peep here')
  end

  scenario 'I cannot peep if I am not signed in' do

    visit('/peeps')
    expect(page).to_not have_button 'Peep'
    expect(page).to have_content('If you were signed in you could peep here')
  end

end
