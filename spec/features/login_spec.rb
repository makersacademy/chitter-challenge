feature 'Signing in' do
  before(:each) do
    database_wiper
    visit('/')
  end
end
#  scenario 'Can sign in' do
#    fill_in 'username', with:
#    click_on('sign in')
#    expect('Here is the body of my beep').to appear_before('Here is the REAL body of my beeep')
#  end
#end
