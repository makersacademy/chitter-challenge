feature 'post peeps' do

  subject(:user)      { described_class   }
  let(:full_name)     { "Ryan"            }
  let(:email)         { 'ryan@ryan.com'   }
  let(:username)      { 'ryan'            }
  let(:password)      { 'password'        }
  let(:password2)     { 'password2'       }
  let(:full_name2)    { "Ryan2"           }
  let(:email2)        { 'ryan@ryan.com'   }
  let(:username2)     { 'ryan'            }
  let(:peep_content1) { "first"           }
  let(:peep_content2) { "second"          }
  let(:tag_content)   { "tag"             }
  let(:reply_content) { "reply"           }
  let(:search_word)   { "first"           }

  let(:expected_date) { DateTime.now      }

  before  { Timecop.freeze }
  after   { Timecop.return }

  before do
    sign_up(email: email, full_name: full_name, username: username)
  end

  scenario 'Signed in user can post a peep that shows full name and usernme' do
    expect(page).to have_content("Peeps")
    post_peep(peep_content: peep_content1)
    within ".peep" do
      expect(page).to have_content username
      expect(page).to have_content full_name
      expect(page).to have_content peep_content1
    end
  end

  scenario 'Displays peeps in revere chronological order' do
      post_peep(peep_content: peep_content1)
      Timecop.travel(DateTime.now + 1) do
        post_peep(peep_content: peep_content2)
      end
      expect(page.all(".peep-content").map(&:text)).to eq [peep_content2, peep_content1]
  end

  scenario 'I can filter peeps by tag' do
    post_peep(peep_content: peep_content1, tags: tag_content)
    within ".peep" do
      click_on tag_content
    end
    expect(page).to have_content peep_content1
  end

  scenario 'User can see the time a peep was created' do
    post_peep(peep_content: peep_content2)
    within(".peep") do
      expect(page).to have_content DateTime.now.strftime("%c")
    end
  end

  scenario 'Sends email when tagged in a peep' do
    include Mail::Matchers
    Mail::TestMailer.deliveries.clear
    post_peep(peep_content: peep_content1, tags: tag_content)
    expect(Mail::TestMailer.deliveries.length).to eq 1
    expect(Mail::TestMailer.deliveries.last.to).to eq [email]
  end

  scenario 'I cannot post a peep when not logged in' do
    click_on 'Log out'
    visit('/peeps/new')
    expect(page).not_to have_content "Post"
  end

  scenario 'I can search for peeps containing chosen words' do
    post_peep(peep_content: peep_content1)
    post_peep(peep_content: peep_content2)
    fill_in 'search', with: peep_content1
    click_on 'Search'
      expect(page.all(".peep-content")).to have_content peep_content1
      expect(page.all(".peep-content")).not_to have_content peep_content2
  end

  scenario 'Signed in users can delete peeps they posted' do
    post_peep(peep_content: peep_content1)
    within ".peep" do
      click_on 'Delete'
    end
    expect(page).not_to have_content peep_content1
  end

  scenario 'Signed in users can reply to a peep' do
    post_peep(peep_content: peep_content1)
    within ".peep" do
      click_on 'Reply'
    end
    fill_in 'content', with: reply_content
    click_on "Reply"
    expect(page).to have_content reply_content
  end

end
