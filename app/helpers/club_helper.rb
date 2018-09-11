module ClubHelper

  def num_to_phone(num)
    "#{ num[0..1] }-#{ num[2..3] }-#{ num[4..5] }-#{ num[6..7] }-#{ num[8..9] }"
  end

end
