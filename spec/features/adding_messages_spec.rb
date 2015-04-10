require './spec/spec_helper'

feature 'user adds a new chat' do
  scenario 'when on the homepage' do
    expect(Message.count).to eq(0)
    visit '/'
    add_message('this is new')
    expect(Message.count).to eq(1)
    message = Message.first
    expect(message.memo).to eq('this is new')
  end

  def add_message(memo)
    visit '/'
    within('#new-message') do
      fill_in 'memo', with: memo
      click_button 'chat!'
    end
  end
end
