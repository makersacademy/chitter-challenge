# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Post creation time is visible' do
  scenario 'timestamp created at submission time' do
    t = Time.new(2019, 04, 31, 5, 0, 10)
    time_test = t.strftime('%Y-%m-%d %H:%M:%S')
    allow(Time).to receive(:now).and_return(time_test)
    visit('/')
    register
    fill_in 'message', with: 'Test timestamp'
    click_button 'submit'
    time = find('#posts .column_three').text
    expect(time).to eq "2019-05-01 05:00:10"
  end
end

def register
  click_button 'sign_up'
  fill_in 'user', with: 'Tester'
  fill_in 'email', with: 'test@gmail.com'
  fill_in 'password', with: 'PASSWORD'
  click_button 'register'
end