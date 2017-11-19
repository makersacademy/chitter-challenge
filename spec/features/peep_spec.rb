RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
     DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

end


feature 'message' do
  scenario 'post a message' do
    visit '/'

    expect(page.status_code).to eq 200

    fill_in 'message', with: 'test message'
    click_button 'Submit'
    expect(page).to have_content 'test message'
  end

  scenario 'message should show time' do
    visit '/'
    fill_in 'message', with: 'test message'
    click_button 'Submit'
    expect(page).to have_content Time.now
  end

end
