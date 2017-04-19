require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/PageObjects/home_page'

class AbstractPage

  @@driver = nil

  def initialize (driver)
    @@driver = driver
  end

  def navigateToAppRoot
    @@driver.navigate.to('http://localhost:3000')
    return HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def getPageTitle
    return @@driver.find_element(:id, 'heading').text
  end


end