class AddCommentPage < AbstractPage
  def initialize(driver)
    super(driver)
  end

  def addComment(commenter, comment)
   @@driver.find_element(:id, 'comment_commenter').send_keys commenter
   @@driver.find_element(:id, 'comment_body').send_keys comment
   @@driver.find_element(:name, 'commit').click
    return AddCommentPage.new(@@driver)
  end

  def destroyComment
    @@driver.find_element(:link_test, 'Destroy Comment').click
    alertBox =@@driver.switch_to.alert
    puts alertBox.text
    alertBox.accept
    return AddCommentPage.new(@@driver)
  end

  def EditArticle
    @@driver.find_element(:link_test, 'Back').click
    return EditArticlePage.new(@@driver)
  end

  def clickBackLink
    @@driver.find_element(:link_test, 'Back').click
    return ArticlesListPage.new(@@driver)
  end
end