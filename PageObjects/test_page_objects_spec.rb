require 'rspec'
require 'selenium-webdriver'
require_relative '../../src/PageObjects/home_page'
require_relative '../../src/PageObjects/articles_list_page'
require_relative '../../src/PageObjects/new_article_page'
require_relative '../../src/PageObjects/article_is_created_page'


describe 'Test CRUD and Comments of Blog Application' do

  app = nil

  before(:each) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end

  after(:each) do
    #app.quit
  end

  it 'should enter valid title, text and submit them' do
    #navigateToNewArticle
    articleCreated = app
    .navigateToAppRoot
    .navigateToArticlesListPage
    .navigateToNewArticle
    .enterArticleText('Some text')
   .enterArticleTitle('Some title')
    .submitArticleForm

    expect(articleCreated.getPageTitle).to be == 'You Have Created An Article'
  end

  it 'should not create an article with invalid title' do
    #navigateToNewArticle
    articleCreated = app
                         .navigateToAppRoot
                         .navigateToArticlesListPage
                         .navigateToNewArticle
                         .enterArticleText('Day is sunny')
                         .enterArticleTitle('Day')
                         .submitArticleForm

    expect(articleCreated.getPageTitle).to be == 'Errors occur, please, note:'
  end

  it 'should enter comment and submit it' do

    CommentIsAdded = app
                         .navigateToAppRoot
                         .navigateToArticlesListPage
                         .clickShowLink
                         .addComment('Jane', 'I like this article')


    expect(CommentIsAdded.include? 'Jane').to be == true
    expect(CommentIsAdded.include? 'I like this article').to be == true
  end

  it 'should edit an article' do
    articleEdited = app
        .navigateToAppRoot
        .navigateToArticlesListPage
        .clickEditLink
        .enterArticleText(' upd')
        .enterArticleTitle( 'upd')
        .submitArticleForm
    expect(CommentIsAdded.include? 'upd').to be == true
    expect(CommentIsAdded.include? 'upd').to be == true
  end

  it 'should show an article' do
    articleShown = app
                        .navigateToAppRoot
                        .navigateToArticlesListPage
                        .clickShowLink

    expect(articleShown.include? 'Title').to be == true
    expect(CommentIsAdded.include? 'Text').to be == true
  end

  it 'should destroy an article' do
    @@driver.navigate.to('http://localhost:3000/articles')
    articleTitle = @@driver.find_element(:xpath, 'html/body/table/tbody/tr[2]/td[2]').text
    articleDestroyed = app
                       .navigateToAppRoot
                       .navigateToArticlesListPage


    expect(articleDestroyed.include? articleTitle).to be == false
  end

  it 'should destroy a comment' do
    # authentification is switched off here
    CommentIsDestroyed = app
                         .navigateToAppRoot
                         .navigateToArticlesListPage
                         .clickShowLink
                         .addComment('Mike', 'I agree with you')
                         .destroyComment


    expect(CommentIsDestroyed.include? 'Mike').to be == false
    expect(CommentIsDestroyed.include? 'I agree with you').to be == false
  end
  end


