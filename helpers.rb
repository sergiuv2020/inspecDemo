module Helpers
  #Establishes a connection at the give url with faraday
  #return faradayConnection
  def Helpers.getFaradayConnection (url)
    newConnection= Faraday.new(:url => url) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    return newConnection
  end
end
