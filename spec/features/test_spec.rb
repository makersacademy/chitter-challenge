feature 'test' do
  scenario 'display working' do
    visit '/'
    expect(page).to have_content "testing testing"
  end
end
