require 'spec_helper'

feature 'User posts a new peep' do

  def add_peep(post, user_name)
    fill_in :post, :with => post
    fill_in :user_name, :with => user_name
    click_button "Add peep"
  end

  scenario 'when signed in' do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Hello World!", "chitty1")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.post).to eq('Hello World!')
    expect(peep.user_name).to eq("chitty1")
  end

end