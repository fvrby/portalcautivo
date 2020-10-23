defmodule Portalcautivo.Captive_Context do
  @moduledoc """
  The Captive_Context context.
  """

  import Ecto.Query, warn: false
  alias Portalcautivo.Repo

  alias Portalcautivo.Captive_Context.Captive

  @doc """
  Returns the list of captives.

  ## Examples

      iex> list_captives()
      [%Captive{}, ...]

  """
  def list_captives do
    Repo.all(Captive)
  end

  @doc """
  Gets a single captive.

  Raises `Ecto.NoResultsError` if the Captive does not exist.

  ## Examples

      iex> get_captive!(123)
      %Captive{}

      iex> get_captive!(456)
      ** (Ecto.NoResultsError)

  """
  def get_captive!(id), do: Repo.get!(Captive, id)

  @doc """
  Creates a captive.

  ## Examples

      iex> create_captive(%{field: value})
      {:ok, %Captive{}}

      iex> create_captive(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_captive(attrs \\ %{}) do
    %Captive{}
    |> Captive.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a captive.

  ## Examples

      iex> update_captive(captive, %{field: new_value})
      {:ok, %Captive{}}

      iex> update_captive(captive, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_captive(%Captive{} = captive, attrs) do
    captive
    |> Captive.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a captive.

  ## Examples

      iex> delete_captive(captive)
      {:ok, %Captive{}}

      iex> delete_captive(captive)
      {:error, %Ecto.Changeset{}}

  """
  def delete_captive(%Captive{} = captive) do
    Repo.delete(captive)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking captive changes.

  ## Examples

      iex> change_captive(captive)
      %Ecto.Changeset{data: %Captive{}}

  """
  def change_captive(%Captive{} = captive, attrs \\ %{}) do
    Captive.changeset(captive, attrs)
  end
end
