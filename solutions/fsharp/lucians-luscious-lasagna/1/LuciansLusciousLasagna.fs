module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven t = expectedMinutesInOven - t

let preparationTimeInMinutes n = 2 * n

let elapsedTimeInMinutes n t = (preparationTimeInMinutes n) + t
