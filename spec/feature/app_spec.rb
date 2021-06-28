# frozen_string_literal: true

feature 'Account page' do
  scenario 'visiting the account page' do
    visit('/')
    expect(page).to have_content 'Welcome.'
  end

  # scenario 'enters next page' do
  #   visit('/')
  #   click_button('Enter')
  # end

  # scenario 'able to add in details' do
  #   visit('/')
  #   fill_in('Name', with: 'Pikachu')
  #   fill_in('Email', with: 'pika@pokeworld.universe')
  #   click_button('Sign in')

  #   expect(page).to have_content 'You are signed in Pikachu.'
  # end
end
