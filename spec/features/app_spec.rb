feature "Peeps page displays all peeps" do
  scenario "Go to peeps page and view peeps in reverse chronological order" do
    Peep.create(maker: 'Example1', body: 'first')
    Peep.create(maker: 'Example2', body: 'second')
    visit('/peeps')
    expect(page.status_code).to eq 200
    expect('second').to appear_before('first')
  end
end

feature "Submit peep" do
  scenario "Fill in the form to send the peep and display it" do
    visit('/peeps')
    fill_in('new_peep', with: 'Hello World')
    click_button 'Post'
    expect(page).to have_content('Hello World')
  end
end
