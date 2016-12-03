require 'spec_helper'

RSpec.feature 'New peep' do

  scenario "- peeps can be created" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    visit '/peeps/new'
    fill_in :content, with: 'test'
    click_button 'Send'
    expect(Peep.count).to eq 1
  end

  scenario "- fails if content is empty" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    visit '/peeps/new'
    click_button 'Send'
    expect(Peep.count).to eq 0
  end
  
end
