defmodule ScenicLiveReloadDemo do
  @moduledoc """
  Starter application using the Scenic framework.
  """

  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport_config = Application.get_env(:scenic_live_reload_demo, :viewport)

    # start the application with the viewport
    children = [
      ScenicLiveReloadDemo.Sensor.Supervisor,
      {Scenic, viewports: [main_viewport_config]},
      {ScenicLiveReload, viewports: [main_viewport_config]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
