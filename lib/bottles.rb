class Bottles
  def song
    verses(99, 0)
  end

  def verses(top, bottom)
    (bottom..top).to_a.reverse.map { |n| verse(n) }.join("\n")
  end

  def verse(n)
    <<~VERSE
    #{bottle_text(n, cap: true)} of beer on the wall, #{bottle_text(n)} of beer.
    #{take_text(n)}, #{bottle_text(next_n(n))} of beer on the wall.
    VERSE
  end

  def next_n(n)
    n > 0 ? n-1 : 99 
  end

  def take_text(n)
    case n
    when 0
      "Go to the store and buy some more"
    else
      "Take #{n == 1 ? 'it' : 'one' } down and pass it around"
    end
  end

  def bottle_text(n, cap: false)
    case n
    when 0 
      "#{cap ? 'N' : 'n'}o more bottles"
    when 1
      "1 bottle"
    else
      "#{n} bottles"
    end      
  end
end
