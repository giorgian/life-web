module GamesHelper
  def game_size(game)
    "#{game.width}x#{game.height}"
  end

  def game_cell(cell)
    class_name = cell ? "alive" : "dead"
    content = cell ? '*' : '·'
    content_tag("div", content, class: "board-cell " + class_name )
  end
end
