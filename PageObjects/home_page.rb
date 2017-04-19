require_relative '../../src/PageObjects/abstract_page'
require_relative '../../src/PageObjects/articles_list_page'
class HomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def navigateToArticlesListPage
    @@driver.find_element(:link_text, 'My Blog').click
    #@@driver.find_element(:xpath, 'html/body/a').click
    puts 'button My Blog is clicked'

    return ArticlesListPage.new(@@driver)

  end
end