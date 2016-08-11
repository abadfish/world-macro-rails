require 'json'
class News

  def initialize(news_source)
    @url = "https://newsapi.org/v1/articles?source=#{news_source}&sortBy=top&apiKey=91cf8a822e4245a7a289affac3da132c"
  end

  def get_titles
    response = HTTParty.get(@url)
    articles = response["articles"]
    titles = articles.collect { |a| a.values[2] }
    links = articles.collect { |a| a.values[3] }
    h = {}
    titles.each.with_index(0) do |k, i|
      h[k] = links[i]
    end
    h
  end

  def update_titles
    @titles.each do |title|
      top_news = news.get_titles
      title.update(titles: titles)
    end
  end

end
