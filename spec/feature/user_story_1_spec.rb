feature 'POST A PEEP' do

  scenario 'there is a landing page' do
    visit '/'
    expect(page).to have_content ('Welcome to Chitter!')
  end

  scenario 'landing page has an Enter button' do
    visit '/'
    expect(page).to have_button ('Enter')
  end

  scenario 'there is a main page' do
    visit '/'
    click_button('Enter')
    expect(page).to have_content("Let's peep")
  end

  scenario 'main page has a text field' do
    visit '/'
    click_button('Enter')
    expect(page).to have_field('message')
  end

  scenario 'main page has a send button' do
    visit '/'
    click_button('Enter')
    expect(page).to have_button('send')
  end

  scenario 'send adds a message to chitter' do
    visit '/'
    click_button('Enter')
    fill_in('message', :with => 'Hello World!')
    click_button('send')
    expect(page).to have_content('Hello World!')
  end
end
