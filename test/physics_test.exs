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
end
