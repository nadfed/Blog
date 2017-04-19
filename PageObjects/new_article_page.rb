require_relative '../../src/PageObjects/abstract_page'
require_relative '../../src/PageObjects/article_is_created_page'
require_relative '../../src/PageObjects/articles_list_page'

class NewArticlePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def enterArticleTitle (articleTitle)

    @@driver.find_element(:xpath, ".//*[@id='article_title']").send_keys articleTitle
    #@@driver.find_element(:id, 'article_title').send_keys articleTitle
  end

  def enterArticleText (articleText)
    @@driver.find_element(:xpath, ".//*[@id='article_text']").send_keys articleText
    #@@driver.find_element(:id, 'article_text').send_keys articleText
  end

  def submitArticleForm
  @@driver.find_element(:name, 'commit').click
    return ArticleIsCreatedPage.new(@@driver)
  end

  def clickBackLink
    @@driver.find_element(:link_test, 'Back').click
    return ArticlesListPage.new(@@driver)
  end
end