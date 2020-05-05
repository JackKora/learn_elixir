defmodule Hello.Guest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guests" do
    field :attending, :boolean, default: false
    field :email, :string
    field :name, :string
    field :number_of_guests, :integer

    timestamps()
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, [:name, :email, :number_of_guests, :attending])
    |> validate_required([:name, :email, :number_of_guests, :attending])
  end
end
