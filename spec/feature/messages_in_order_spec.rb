feature 'viewing a message' do

  before do
    @example_time = Time.new
    @formatted_time = @example_time.strftime "%k:%M" 
    allow(Time).to receive(:new) {@example_time}
  end

  scenario 'user views the messages newest first' do
    visit '/messages/new'
    fill_in 'message', with: 'hello chitter'
    click_on 'add'
    visit '/messages/new'
    fill_in 'message', with: 'hi there'
    click_on 'add'
    visit '/messages'
    expect(page).to have_content 'hi there' 
    # expect(page).to have_content @formatted_time
  end
end