module CarsAssemble

let successRate (speed: int): float =
    if speed = 0 then
        0.0
    elif speed = 9 then
        0.8
    elif speed = 10 then
        0.77
    elif speed > 4 then
        0.9
    else
        1.0

let productionRatePerHour (speed: int): float =
    (float (221 * speed)) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int (productionRatePerHour speed / 60.0)
