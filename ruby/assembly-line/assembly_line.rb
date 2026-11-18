class AssemblyLine
  BASE_SPEED = 221
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * BASE_SPEED * success_rate(@speed)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  def success_rate(speed)
    if speed == 10
      0.77
    elsif speed == 9
      0.8
    elsif speed >= 5
      0.9
    else
      1.0
    end
  end
end
