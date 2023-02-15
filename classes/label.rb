class Label
  attr_reader :title, :color, :items

  def initialize(title, color, items = [])
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.label = self
  end
end
