require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

@browser = ENV['BROWSER'] #env environment variable


    Capybara.register_driver :selenium do |app|

    if @browser.eql?('chrome')
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
  
    elsif @browser.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)

    elsif @browser.eql?('ie')  
        Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)

    elsif @browser.eql?('headless') #selenium server
        Capybara.javascript_driver = :selenium
        Capybara.run_server = false

        caps = Selenium::WebDriver::Remote::Capabilities.chrome(  #chrome config
            'chromeOptions'=> {
            'args'=> ['--no-default-browser-check'] #don't ask if you want to set it as your default browser
            }
        )
    #Capybara.register_driver :selenium do |app|
            Capybara::Selenium::Driver.new(app, browser: :remote, 
            url: 'http://selenium_server:4444/wd/hub',  #set selenium server url
            desired_capabilities: caps    #chrome config
            )
        end   
    end

    Capybara.configure do |config|
        config.default_driver = :selenium
        config.app_host = 'http://automationpractice.com/index.php'
        config.default_max_wait_time = 5
    end