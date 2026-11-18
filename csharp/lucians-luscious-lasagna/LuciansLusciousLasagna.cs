class Lasagna
{
    public int ExpectedMinutesInOven() => 40;

    public int RemainingMinutesInOven(int actual_minutes) => ExpectedMinutesInOven() - actual_minutes;

    public int PreparationTimeInMinutes(int layers) => 2 * layers;

    public int ElapsedTimeInMinutes(int layers, int actual_minutes) => PreparationTimeInMinutes(layers) + actual_minutes;
}
