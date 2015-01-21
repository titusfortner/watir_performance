require 'spec_helper'

describe WatirPerformance do
  context "Chrome" do

    before(:all) do
      @session = Watirmark::Session.instance
      @config = Watirmark::Configuration.instance
      @config.webdriver = :firefox
      @session.openbrowser
      Page.browser.goto SHORT_URL
      @runs = WatirPerformance::LocatorRuns.new
    end

    after(:all) do
      puts @runs.output
      @session.closebrowser
    end

    specify 'quick test' do
      element = Page.browser.element(css: /\#text_1/)
      expect(element.exists?).to be true
    end

  end
end
