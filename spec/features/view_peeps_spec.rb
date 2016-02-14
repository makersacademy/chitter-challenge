require 'web_helper'

feature "Viewing peeps" do

  scenario 'I can see peeps on the home page' do
    Peep.create(message: 'Hello, chitter world')
    user_signup
    click_button 'Sign up'
    expect(page).to have_content( 'Hello, chitter world')
  end

end
