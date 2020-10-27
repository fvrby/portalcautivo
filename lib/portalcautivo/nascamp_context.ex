defmodule Portalcautivo.Nascamp_context do
  @moduledoc """
  The Nascamp_context context.
  """

  import Ecto.Query, warn: false
  alias Portalcautivo.Repo

  alias Portalcautivo.Nascamp_context.Nascamp

  @doc """
  Returns the list of nascamp.

  ## Examples

      iex> list_nascamp()
      [%Nascamp{}, ...]

  """
  def list_nascamp do
    Repo.all(Nascamp)
  end

  @doc """
  Gets a single nascamp.

  Raises `Ecto.NoResultsError` if the Nascamp does not exist.

  ## Examples

      iex> get_nascamp!(123)
      %Nascamp{}

      iex> get_nascamp!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nascamp!(id), do: Repo.get!(Nascamp, id)

  @doc """
  Creates a nascamp.

  ## Examples

      iex> create_nascamp(%{field: value})
      {:ok, %Nascamp{}}

      iex> create_nascamp(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nascamp(attrs \\ %{}) do
    %Nascamp{}
    |> Nascamp.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nascamp.

  ## Examples

      iex> update_nascamp(nascamp, %{field: new_value})
      {:ok, %Nascamp{}}

      iex> update_nascamp(nascamp, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nascamp(%Nascamp{} = nascamp, attrs) do
    nascamp
    |> Nascamp.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nascamp.

  ## Examples

      iex> delete_nascamp(nascamp)
      {:ok, %Nascamp{}}

      iex> delete_nascamp(nascamp)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nascamp(%Nascamp{} = nascamp) do
    Repo.delete(nascamp)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nascamp changes.

  ## Examples

      iex> change_nascamp(nascamp)
      %Ecto.Changeset{data: %Nascamp{}}

  """
  def change_nascamp(%Nascamp{} = nascamp, attrs \\ %{}) do
    Nascamp.changeset(nascamp, attrs)
  end
end
