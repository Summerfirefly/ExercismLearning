# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{next_id: 1, registered: []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state[:registered] end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      %{next_id: id, registered: reg} = state
      new_reg = %Plot{plot_id: id, registered_to: register_to}
      {new_reg, %{state | next_id: id + 1, registered: [new_reg | reg]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      new_reg_list = Enum.filter(state[:registered], fn reg -> reg.plot_id != plot_id end)
      %{state | registered: new_reg_list}
    end)
  end

  def get_registration(pid, plot_id) do
    reg = Agent.get(pid, fn state ->
      Enum.find(state[:registered], fn reg -> reg.plot_id == plot_id end)
    end)
    if reg == nil, do: {:not_found, "plot is unregistered"}, else: reg
  end
end
