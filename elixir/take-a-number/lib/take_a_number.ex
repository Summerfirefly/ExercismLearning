defmodule TakeANumber do
  def start() do
    spawn(TakeANumber, :task_loop, [0])
  end

  def task_loop(last_num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_num)
        task_loop(last_num)
      {:take_a_number, sender_pid} ->
        send(sender_pid, last_num + 1)
        task_loop(last_num + 1)
      :stop -> :ok
      _ -> task_loop(last_num)
    end
  end
end
