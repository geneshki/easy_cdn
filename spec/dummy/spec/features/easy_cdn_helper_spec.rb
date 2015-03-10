require 'spec_helper'
describe "the easy_cdn tag inclusion", type: :feature do
  it 'adds links to head' do
    visit '/'

  end

  it 'adds scripts to bottom of body' do
    visit '/'
  end
end
