require_relative 'web_helper'

feature 'User adds a new peep' do
  scenario 'when browsing the homepage' do
    User.create(email: 'bo@bo.com',
                password: 'bo',
                password_confirmation: 'bo')
    login('bo@bo.com', 'bo')
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep('Amazing!!')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq('Amazing!!')
  end

  def add_peep(peep)
    within('#new-peep') do
      fill_in 'peep', with: peep
    end
    click_button 'PEEP ME!'
  end
end
