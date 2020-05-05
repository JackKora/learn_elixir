defmodule Hello.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :name, :string
      add :email, :string
      add :number_of_guests, :integer
      add :attending, :boolean, default: false, null: false

      timestamps()
    end

  end
end
