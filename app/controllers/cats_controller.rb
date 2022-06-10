class CatsController < ApplicationController
  def index
    cats = get_cats
    @cats = JSON.parse(cats)
  end

  private

  def request_api(url)
    URI.open(url,
      'Content-Type' => 'application/json').read
  end

  def get_cats
    request_api(
      "https://api.thecatapi.com/v1/images/search?api_key=#{ENV['CAT_API_KEY']}"
    )
  end
end
