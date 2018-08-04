# You must *NOT* change anything in this file!

class LunExServices
  def current_price
    sleep 5
    raise "Sorry, sunspot activity today...please try again later" if rand(100) > 80
    42 + rand(17)
  end

end
