module BooksHelper
  def image_from_amazon(amazon_id)
    image_tag "http://images.amazon.com/image/P/#{amazon_id}.01.ZTZZZZZZ.jpg"
  end
end
