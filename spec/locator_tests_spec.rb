require 'spec_helper'

describe WatirPerformance do
  before(:all) do
    @headless = Headless.new
    @headless.start
  end

  after(:all) do
    @headless.destroy
  end

  context "Firefox" do

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
      @runs.execute(:id, 'text-1')
    end

    specify 'locate with Webdriver Finders' do
      1000.times do
        @runs.execute(:class_name, 'text-1')
        @runs.execute(:id, 'text_1')
        @runs.execute(:name, 'text1')
        @runs.execute(:tag_name, 'a')
      end
    end

    specify 'locate with CSS Finders' do
      @runs.execute(:css_id, '#text_1')
      @runs.execute(:css_class, '.text-1')
      @runs.execute(:css_tag, 'a')
      @runs.execute(:css_attribute, 'a[data-text-1]')
      @runs.execute(:css_value, "a[data-text='text1']")
    end

    specify 'locate with Watir Finders' do
      @runs.execute(:text, 'Text 1')
      @runs.execute(:href, 'long.html')
      @runs.execute(:data_text, 'text-1')
      @runs.execute(:hreflang, 'en')
    end

    specify 'locate with Regex' do
      @runs.execute(:class_name_regex, 'text-1')
      @runs.execute(:id_regex, 'text-1')
      @runs.execute(:name_regex, 'text-1')
      @runs.execute(:tag_name_regex, 'text-1')
      @runs.execute(:text_regex, /Text \d/)
      @runs.execute(:href_regex, /^long\./)
      @runs.execute(:data_text_regex, /text-\d/)
      @runs.execute(:hreflang_regex, /\w\w/)
    end

  end
end
