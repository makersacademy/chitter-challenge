feature 'Post message' do
  let(:time) { Time.new }
  let(:hour) { "#{'0' if time.hour < 10}#{time.hour}" }
  let(:min) { "#{'0' if time.min < 10}#{time.min}" }
  let(:sec) { "#{'0' if time.sec < 10}#{time.sec}" }
  let(:time_string) { "#{hour}:#{min}:#{sec}" }

  scenario 'posts a message' do
    visit('/')
    fill_in 'message', with: 'my first peep!'
    click_button 'peep'
    expect(page).to have_current_path('/')
    expect(page).to have_content 'my first peep!'
  end

  scenario 'shows latest posted message first' do
    visit('/')
    fill_in 'message', with: 'first message'
    click_button 'peep'
    fill_in 'message', with: 'second message'
    click_button 'peep'
    first_index = page.body.index('first message')
    second_index = page.body.index('second message')
    expect(first_index).to be > second_index
  end

  scenario 'shows time of posted message' do
    visit('/')
    fill_in 'message', with: 'timed message'
    click_button 'peep'
    expect(page).to have_content(time_string)
  end
end
