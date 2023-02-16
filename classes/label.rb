class Label
  attr_reader :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  #  custom method that @returns a hash of the attributes to be merged in the save_labels_data method.
  def to_custom_hash
    {
      'Title' => title,
      'Color' => color
    }
  end
end
