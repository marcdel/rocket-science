defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct" do
    ev = Physics.Rocketry.escape_velocity(:earth)
    assert ev == 11.2
  end

  test "escape velocity of mars is correct" do
    ev = Physics.Rocketry.escape_velocity(:mars)
    assert ev == 5.0
  end

  test "escape velocity of moon is correct" do
    ev = Physics.Rocketry.escape_velocity(:moon)
    assert ev == 2.4
  end

  test "escape velocity of planet X is correct" do
    planet_x = %{mass: 4.0e22, radius: 6.21e6}
    ev = planet_x |> Physics.Rocketry.escape_velocity
    assert ev == 0.9
  end

  test "orbital speed is correct" do
    speed = 100 |> Physics.Rocketry.orbital_speed
    assert speed == 0
  end

  test "orbital acceleration is correct" do
    acceleration = 100 |> Physics.Rocketry.orbital_acceleration
    assert acceleration == 0
  end

  test "orbial term is correct" do
    term = 100 |> Physics.Rocketry.orbital_term
    assert term == 0
  end

  test "Orbital acceleration for earth at 100km" do
    orbital_acc = Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.515619587729839
  end

  test "Orbital term for 100km above earth" do
    term = Physics.Rocketry.orbital_term(100)
    assert (term > 4) && (term < 5) #crap fix this!
  end

  test "Converter.to_light_seconds works" do
    ls2 = {:miles, 1000} |> Converter.to_light_seconds(precision: 10)
    assert 0.00536819 == ls2
  end

  test "ConverterTwo.to_light_seconds works" do
    ls2 = {:miles, 1000} |> ConverterTwo.to_light_seconds(precision: 10)
    assert 0.00536819 == ls2
  end

  test "ConverterTwo.to_light_seconds works with default value" do
    ls2 = {:miles, 1000} |> ConverterTwo.to_light_seconds
    assert 0.00537 == ls2
  end

  test "to_light_seconds converters return same result" do
    ls1 = {:miles, 1000} |> Converter.to_light_seconds(precision: 10)
    ls2 = {:miles, 1000} |> ConverterTwo.to_light_seconds(precision: 10)
    assert ls1 == ls2
  end

  test "3600 seconds in 1 hour" do
    hours = 3600 |> Converter.seconds_to_hours
    assert hours == 1
  end

  test "7200 seconds in 2 hours" do
    hours = 7200 |> Converter.seconds_to_hours
    assert hours == 2
  end

 test "1800 seconds in 0.5 hour" do
    hours = 1800 |> Converter.seconds_to_hours
    assert hours == 0.5
  end
end
