feature 'timeline' do

  scenario "display peeps" do
    visit '/'
    click_on 'Peep'
    fill_in 'message', with: "This message should appear on the Timeline"
    click_on 'Publish'

    expect(page).to have_content "This message should appear on the Timeline"
  end

end
