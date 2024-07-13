require_relative 'gossip'
require_relative 'view'
class Controller # rubocop:disable Style/Documentation
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params['author'], params['content'])
    gossip.save_as_csv
  end
end
