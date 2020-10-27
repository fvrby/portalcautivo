defmodule Portalcautivo.Components_context do
  @moduledoc """
  The Components_context context.
  """

  import Ecto.Query, warn: false
  alias Portalcautivo.Repo

  alias Portalcautivo.Components_context.Components

  @doc """
  Returns the list of components.

  ## Examples

      iex> list_components()
      [%Components{}, ...]

  """
  def list_components do
    Repo.all(Components)
  end

  @doc """
  Gets a single components.

  Raises `Ecto.NoResultsError` if the Components does not exist.

  ## Examples

      iex> get_components!(123)
      %Components{}

      iex> get_components!(456)
      ** (Ecto.NoResultsError)

  """
  def get_components!(id), do: Repo.get!(Components, id)

  @doc """
  Creates a components.

  ## Examples

      iex> create_components(%{field: value})
      {:ok, %Components{}}

      iex> create_components(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_components(attrs \\ %{}) do
    %Components{}
    |> Components.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a components.

  ## Examples

      iex> update_components(components, %{field: new_value})
      {:ok, %Components{}}

      iex> update_components(components, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_components(%Components{} = components, attrs) do
    components
    |> Components.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a components.

  ## Examples

      iex> delete_components(components)
      {:ok, %Components{}}

      iex> delete_components(components)
      {:error, %Ecto.Changeset{}}

  """
  def delete_components(%Components{} = components) do
    Repo.delete(components)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking components changes.

  ## Examples

      iex> change_components(components)
      %Ecto.Changeset{data: %Components{}}

  """
  def change_components(%Components{} = components, attrs \\ %{}) do
    Components.changeset(components, attrs)
  end
end
