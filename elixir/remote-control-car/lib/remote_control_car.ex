defmodule RemoteControlCar do
  @enforce_keys :nickname
  defstruct [
    :battery_percentage,
    :distance_driven_in_meters,
    :nickname
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: nickname
    }
  end

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar) do
    %RemoteControlCar{distance_driven_in_meters: d} = remote_car
    "#{d} meters"
  end

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    %RemoteControlCar{battery_percentage: b} = remote_car
    case b do
      0 -> "Battery empty"
      _ -> "Battery at #{b}%"
    end
  end

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar) do
    %RemoteControlCar{distance_driven_in_meters: d, battery_percentage: b} = remote_car
    if b > 0 do
      %RemoteControlCar{remote_car | distance_driven_in_meters: d + 20, battery_percentage: b - 1}
    else
      remote_car
    end
  end
end
