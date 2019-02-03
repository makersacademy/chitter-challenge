feature 'display of peeps' do

  let(:first) { 'This is test peep 1'}
  let(:second) { 'This is test peep 2'}

  scenario 'peeps are in reverse chronological order' do
    submit_a_peep first
    submit_a_peep second
    expect(second).to appear_before first
  end

  scenario 'peeps display their time of posting' do
    now = Time.new
    submit_a_peep first
    expect(page.body).to (have_content "#{now.strftime('at %H:%M(:%S) on %b%e')}")
      .or (have_content "#{(now - 1).strftime('at %H:%M(:%S) on %b%e')}")
  end

  scenario 'peeps display the displayname of the maker who posted them' do
    submit_a_peep first
    expect(page).to have_content 'Default Account'
  end
end
