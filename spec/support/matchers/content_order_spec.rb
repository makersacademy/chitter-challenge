# Helper method by jmondo
# http://launchware.com/articles/acceptance-testing-asserting-sort-order

RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end
