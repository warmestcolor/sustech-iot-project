defmodule Iot.Report do
  @moduledoc """
  The Report context.
  """

  import Ecto.Query, warn: false
  alias Iot.Repo

  alias Iot.Report.Loca

  @doc """
  Returns the list of report_locas.

  ## Examples

      iex> list_report_locas()
      [%Loca{}, ...]

  """
  def list_report_locas do
    Repo.all(Loca)
  end

  @doc """
  Gets a single loca.

  Raises `Ecto.NoResultsError` if the Loca does not exist.

  ## Examples

      iex> get_loca!(123)
      %Loca{}

      iex> get_loca!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loca!(id), do: Repo.get!(Loca, id)

  @doc """
  Creates a loca.

  ## Examples

      iex> create_loca(%{field: value})
      {:ok, %Loca{}}

      iex> create_loca(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loca(attrs \\ %{}) do
    %Loca{}
    |> Loca.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loca.

  ## Examples

      iex> update_loca(loca, %{field: new_value})
      {:ok, %Loca{}}

      iex> update_loca(loca, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loca(%Loca{} = loca, attrs) do
    loca
    |> Loca.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loca.

  ## Examples

      iex> delete_loca(loca)
      {:ok, %Loca{}}

      iex> delete_loca(loca)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loca(%Loca{} = loca) do
    Repo.delete(loca)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loca changes.

  ## Examples

      iex> change_loca(loca)
      %Ecto.Changeset{source: %Loca{}}

  """
  def change_loca(%Loca{} = loca) do
    Loca.changeset(loca, %{})
  end
end
