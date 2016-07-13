class TradeData

  def initialize
    @url = "https://www.quandl.com/api/v3/datasets/CME/"
    @ext = '.json'
    @query = '?api_key=8-NySVHAesx9F-w-sG5h'
  end

  def get_current_price(product)
    match = product.match(/\d/)
    product1 = match.pre_match + '201' + match[0]
    uri = @url + product1 + @ext + @query
    response = HTTParty.get(uri)
    h = {}
    keys = response["dataset"]["column_names"]
    values = response["dataset"]["data"][0]
    keys.each.with_index(0) do |k, i|
      h[k] = values[i]
    end
    h["Last"]
  end


end
