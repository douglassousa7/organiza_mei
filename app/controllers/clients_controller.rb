class ClientsController < ApplicationController
  before_action :authenticate_user!  # Garante que o usuário está logado
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = current_user.clients
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = current_user.clients.build
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = current_user.clients.build(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Cliente criado com sucesso." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Cliente atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy!

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Cliente removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Busca apenas clientes do usuário atual
    def set_client
      @client = current_user.clients.find(params[:id])
    end

    # Parâmetros permitidos
    def client_params
      params.require(:client).permit(:name, :email, :phone, :address, :notes)
    end
end
