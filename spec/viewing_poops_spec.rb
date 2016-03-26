require 'spec_helper'

feature 'Viewing poops' do

  scenario 'I can see existing poops on the poops page' do
    Poop.create(poop_msg: 'This is my very first poop')
    visit '/poops/index'
    expect(page).to have_content('first poop')
    end
 end

