class NewsController < ApplicationController

  def index
    @news = News.all
  end



# build a nested view
