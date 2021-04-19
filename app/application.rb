require 'pry'
class Application
  @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        search = req.path.split('/')[-1]
        item_names = @@items.map {|i| i.name}
        if item_names.include?(search)
          x = @@items.find{|i| i.name == search}
          [200, {'Content-Type' => 'text/plain'}, ["#{x.price}"]]
        else
          [400, {'Content-Type' => 'text/plain'}, ["Item not found"]]
        end
      else
        [404, {'Content-Type' => 'text/plain'}, ["Route not found" ]]
      end
    end

end