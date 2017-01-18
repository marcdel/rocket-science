defmodule Converter do
  def to_nearest_tenth(val) do
    Float.ceil val, 1
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_light_seconds({:miles, miles}, precision: precision) do
    (miles * 5.36819e-6) |> round_to
  end

  def to_light_seconds({:meters, meters}, precision: precision) do
    (meters * 3.335638620368e-9) |> round_to
  end

  def round_to(val, precision \\ 5) when is_float(val) do
    Float.round(val, precision)
  end
end

defmodule ConverterTwo do
  def to_light_seconds({unit, val}, precision: precision) do 
    case unit do 
      :miles -> from_miles(val)
      :meters -> from_meters(val)
      :feet -> from_feet(val)
      :inches -> from_inches(val)
    end |> round_to(precision)
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9
  defp from_feet(val), do: val * 1.016702651488166404e-9
  defp from_inches(val), do: val * 8.472522095734715723e-11

  defp round_to(val, precision), do: Float.round(val, precision)
end

defmodule Physics.Rocketry do
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.to_km
      |> Converter.to_nearest_tenth
  end

  defp rounded_to_nearest_tenth(val) do
    Float.ceil val, 1
  end

  defp convert_to_km(val) do
    val / 1000
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius
      |> :math.sqrt
  end
end