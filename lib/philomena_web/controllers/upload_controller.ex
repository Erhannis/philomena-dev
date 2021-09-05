defmodule PhilomenaWeb.UploadController do
  use PhilomenaWeb, :controller

  alias Philomena.Images
  alias Philomena.Images.Upload

  def index(conn, _params) do
    uploads = Images.list_uploads()
    render(conn, "index.html", uploads: uploads)
  end

  def new(conn, _params) do
    changeset = Images.change_upload(%Upload{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"upload" => upload_params}) do
    case Images.create_upload(upload_params) do
      {:ok, upload} ->
        conn
        |> put_flash(:info, "Upload created successfully.")
        |> redirect(to: Routes.upload_path(conn, :show, upload))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    upload = Images.get_upload!(id)
    render(conn, "show.html", upload: upload)
  end

  def edit(conn, %{"id" => id}) do
    upload = Images.get_upload!(id)
    changeset = Images.change_upload(upload)
    render(conn, "edit.html", upload: upload, changeset: changeset)
  end

  def update(conn, %{"id" => id, "upload" => upload_params}) do
    upload = Images.get_upload!(id)

    case Images.update_upload(upload, upload_params) do
      {:ok, upload} ->
        conn
        |> put_flash(:info, "Upload updated successfully.")
        |> redirect(to: Routes.upload_path(conn, :show, upload))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", upload: upload, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    upload = Images.get_upload!(id)
    {:ok, _upload} = Images.delete_upload(upload)

    conn
    |> put_flash(:info, "Upload deleted successfully.")
    |> redirect(to: Routes.upload_path(conn, :index))
  end
end
