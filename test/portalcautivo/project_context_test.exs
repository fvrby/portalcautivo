defmodule Portalcautivo.Project_contextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Project_context

  describe "projects" do
    alias Portalcautivo.Project_context.Project

    @valid_attrs %{captive_id: 42, client_id: 42, name: "some name"}
    @update_attrs %{captive_id: 43, client_id: 43, name: "some updated name"}
    @invalid_attrs %{captive_id: nil, client_id: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Project_context.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Project_context.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Project_context.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Project_context.create_project(@valid_attrs)
      assert project.captive_id == 42
      assert project.client_id == 42
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Project_context.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Project_context.update_project(project, @update_attrs)
      assert project.captive_id == 43
      assert project.client_id == 43
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Project_context.update_project(project, @invalid_attrs)
      assert project == Project_context.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Project_context.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Project_context.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Project_context.change_project(project)
    end
  end
end
