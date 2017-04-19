require_relative '../../src/PageObjects/abstract_page'
require_relative '../../src/PageObjects/new_article_page'
require_relative '../../src/PageObjects/home_page'

class ArticlesListPage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def navigateToNewArticle
    @@driver.find_element(:link_text, 'New article').click
   # @@driver.find_element(:xpath, 'html/body/a').click
    puts 'button  New Article is clicked'
    #@@driver.navigate.to('localhost:3000/articles/new')
    return NewArticlePage.new(@@driver)

  end

  def clickEditLink
    @@driver.find_element(:xpath, 'html/body/table/tbody/tr[2]/td[4]/a').click
    return EditArticlePage.new(@@driver)
  end

  def clickShowLink
    @@driver.find_element(:xpath, 'html/body/table/tbody/tr[2]/td[3]/a').click
    return AddCommentPage.new(@@driver)

  end

  def clickAcceptDestroyLink
    @@driver.find_element(:xpath, 'html/body/table/tbody/tr[2]/td[5]/a').click
    alertBox = @driver.switch_to.alert
    puts alertBox.text
    alertBox.accept
return ArticlesListPage.new(@@driver)
  end

  def clickDismissDestroyLink
    @@driver.find_element(:xpath, 'html/body/table/tbody/tr[2]/td[5]/a').click
    alertBox = @driver.switch_to.alert
    alertBox.dismiss
    return ArticlesListPage.new(@@driver)
  end
end