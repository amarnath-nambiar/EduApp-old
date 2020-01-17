class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :update, :destroy]
  before_action :authorize_request, except: :create

  # GET /agents
  def index
    @agents = Agent.all

    render json: @agents
  end

  # GET /agents/1
  def show
    if @current_user.id == @agent.id
      render json: @agent
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end

  end

  # POST /agents
  def create

    puts agent_params
    @agent = Agent.new(agent_params)

    if @agent.save
      render json: @agent, status: :created, location: @agent
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agents/1
  def update
    if @agent.update(agent_params)
      render json: @agent
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agents/1
  def destroy
    @agent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Agent not found' }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def agent_params
      params.permit(:first_name,:last_name,:email,:phone,:alt_phone,:about,:image_url,:password,:password_confirmation)
    end
end
