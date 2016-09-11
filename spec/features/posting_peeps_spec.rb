require 'spec_helper'

feature 'posting a peep' do

  let!(:test_user) do
    User.create(username: 'Alfie' , email: 'alfie@gmail.com',
                password: 'coding', password_confirmation: 'coding')
    # Peep.create(username: 'Alfie', comment: 'This is my first peep')
  end

  scenario 'visiting post a peep' do
    visit '/sessions/new'
    fill_in('email', with: 'alfie@gmail.com')
    fill_in('password', with: 'coding')
    click_button 'Sign in'
    click_button 'Post a peep!'
    expect(page).to have_content('Compose your peep:')
    #will want a test that checks that the username has come up
  end

  scenario 'peep is posted to feed timeline' do
    visit '/sessions/new'
    fill_in('email', with: 'alfie@gmail.com')
    fill_in('password', with: 'coding')
    click_button 'Sign in'
    click_button 'Post a peep!'
    fill_in('textbox', with: 'This is my first peep')
    click_button 'Post!'
    expect(page).to have_content("This is my first peep")
  end

  scenario 'peep is actually saved to correct user' do
    visit '/sessions/new'
    fill_in('email', with: 'alfie@gmail.com')
    fill_in('password', with: 'coding')
    click_button 'Sign in'
    click_button 'Post a peep!'
    fill_in('textbox', with: 'This is my first peep')
    expect{click_button 'Post!'}.to change(Peep, :count).by(1)
  end

end
