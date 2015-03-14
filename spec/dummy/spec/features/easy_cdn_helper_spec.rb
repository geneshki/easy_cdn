require 'spec_helper'
describe "in test env the easy_cdn tag inclusion", type: :feature do
  before(:all) do
    EasyCdn::EasyCdnHelper::ENVIRONMENT.env=ENV["RAILS_ENV"]
  end
  it 'adds local resources as links to head' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/test.css"][test="hash"]', visible: false)
  end
  it 'does not crash if the :cdn key is not specified in the config' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/test.css"][test="hash"]', visible: false)
  end
  it 'generates link to the appropriate path' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/subdir/test.css"][test="hash"]', visible: false)
  end

  it 'adds local resources as scripts to bottom of body' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/test.js"][test="jshash"]', visible: false)
  end
  it 'does not crash if the :cdn key is not specified in the config' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/test.js"][test="jshash"]', visible: false)
  end
  it 'generates script tag with src pointing to the appropriate path' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/subdir/test.js"][test="jshash"]', visible: false)
  end
end
describe "in dev env the easy_cdn tag inclusion", type: :feature do
  before(:all) do
    EasyCdn::EasyCdnHelper::ENVIRONMENT.env="development"
  end
  it 'adds local resources as links to head' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/test.css"][test="hash"]', visible: false)
  end
  it 'does not crash if the :cdn key is not specified in the config' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/test.css"][test="hash"]', visible: false)
  end
  it 'generates link to the appropriate path' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/subdir/test.css"][test="hash"]', visible: false)
  end

  it 'adds local resources as scripts to bottom of body' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/test.js"][test="jshash"]', visible: false)
  end
  it 'does not crash if the :cdn key is not specified in the config' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/test.js"][test="jshash"]', visible: false)
  end
  it 'generates script tag with src pointing to the appropriate path' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/subdir/test.js"][test="jshash"]', visible: false)
  end
end
describe "in prod env the easy_cdn tag inclusion", type: :feature do
  before(:all) do
    EasyCdn::EasyCdnHelper::ENVIRONMENT.env="production"
  end
  it 'adds public resources as links to head' do
    visit '/'
    expect(page).to have_selector('link[href="//test/cdn/1.0.0/test.min.css"][test="hash"]', visible: false)
  end
  it 'fallbacks to local resources if :cdn config key is not set' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/nocdn_test.css"][test="hash"]', visible: false)
  end
  it 'fallbacks to local resources if :cdn config key is not set but uses subdirectory' do
    visit '/'
    expect(page).to have_selector('link[href="/assets/no_cdn_subdir/test.css"][test="hash"]', visible: false)
  end

  it 'adds public resources as scripts to bottom of body' do
    visit '/'
    expect(page).to have_selector('script[src="//test/cdn/1.0.0/test.min.js"][test="jshash"]', visible: false)
  end
  it 'fallbacks to local resources if :cdn config key is not set' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/no_cdn_test.js"][test="jshash"]', visible: false)
  end
  it 'fallbacks to local resources if :cdn config key is not set and uses configured subdirectory' do
    visit '/'
    expect(page).to have_selector('script[src="/assets/no_cdn_dir/no_cdn_test.js"][test="jshash"]', visible: false)
  end
end
