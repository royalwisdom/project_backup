class HomeController < ApplicationController

  def index
    Delayed::Job.enqueue CrawlJob.new
    @articles = Article.all
  end
  
end
