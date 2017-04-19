require_relative '../../src/PageObjects/abstract_page'
require_relative '../../src/PageObjects/new_article_page'
class ArticleIsCreatedPage <AbstractPage
  def initialize(driver)
    super(driver)
  end
end