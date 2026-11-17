defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot(), frame_number(), opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation
  
  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, opts) when rem(frame_number, 4) == 0 do
    %DancingDots.Dot{opacity: a} = dot
    %DancingDots.Dot{dot | opacity: a / 2}
  end

  @impl DancingDots.Animation
  def handle_frame(dot, _, _), do: dot
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init(opts) do
    if Keyword.has_key?(opts, :velocity) and is_integer(opts[:velocity]) do
      {:ok, opts}
    else
      {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(opts[:velocity])}"}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, [velocity: v]) do
    %DancingDots.Dot{radius: r} = dot
    %DancingDots.Dot{dot | radius: r + v * (frame_number - 1)}
  end
end
