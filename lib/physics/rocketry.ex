defmodule Physics.Rocketry do
  @earth %{mass: 5.972e24, radius: 6.371e6}
  @mars %{mass: 6.39e23, radius: 3.4e6}
  @moon %{mass: 7.35e22, radius: 1.738e6}

  def escape_velocity(:earth), do: @earth |> escape_velocity
  def escape_velocity(:mars), do: @mars |> escape_velocity
  def escape_velocity(:moon), do: @moon |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.to_km
      |> Converter.to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * Physics.Laws.newtons_gravitational_constant * mass / radius
      |> :math.sqrt
  end
end
