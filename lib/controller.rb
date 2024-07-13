require_relative 'gossip'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params['author'], params['content'])
    gossip.save_as_csv
  end

  def index_gossips
    gossips = Gossip.index_gossip_csv
    @view.index_gossips(gossips)
  end

  def destroy_gossip
    index = @view.destroy_gossip
    Gossip.destroy(index)
  end
end
