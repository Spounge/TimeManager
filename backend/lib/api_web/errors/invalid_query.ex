defmodule ApiWeb.Errors.InvalidQuery do
  defexception [:message, plug_status: 400]
end
