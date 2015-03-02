require 'spec_helper'
require './lib/server'

feature 'User adds a new peep only when signed in' do

  before(:each) do
    User.create(:email => 'test@test.com',
                :password => 'test',
                :password_confirmation => 'test',
                :name => 'test',
                :username => 'test')
    end
  
  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq(0)
    visit '/'
    sign_in('test@test.com', 'test')
    expect(page).to have_content("What's happening @test?")
    visit '/'
    add_peep('Hello')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq('Hello')
  end

  scenario "with username" do
    expect(Peep.count).to eq(0)
    visit '/'
    sign_in('test@test.com', 'test')
    expect(page).to have_content("What's happening @test?")
    visit '/'
    add_peep('Hello')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(page).to have_content('@test')
  end

  def sign_in(email, password)
    visit('sessions/new')
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button 'Sign in'
  end

  def add_peep(message)
    within('#new-peep') do
    fill_in 'message', :with => message
    click_button 'Peep'
  end
end
end
