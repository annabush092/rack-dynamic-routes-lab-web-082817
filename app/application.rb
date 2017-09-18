

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_type = req.path.split("/items/").last
      price = get_item_price(item_type)
      if price
        resp.write price
      else
        resp.write "Item not found."
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

  def get_item_price(item_from_path)
    found = Item.items.find do |item|
      item.name == item_from_path
    end
    if found
      return found.price
    else
      return nil
    end
  end
end
