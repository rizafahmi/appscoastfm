ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AppscoastFm.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AppscoastFm.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(AppscoastFm.Repo)

