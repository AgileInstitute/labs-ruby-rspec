# You must *NOT* change anything in this file!

class LunexServices
  def current_price(ticker_symbol)
    sleep 5
    raise "Sorry, sunspot activity today...please try again later" if rand(100) > 80
    42 + rand(17)
  end

end
