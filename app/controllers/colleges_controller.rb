class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :update, :destroy]

  # GET /colleges
  def index
    @colleges = College.all

    render json: @colleges
  end

  # GET /colleges/1
  def show
    render json: @college
  end

  # POST /colleges
  def create
    @college = College.new(college_params)

    if @college.save
      render json: @college, status: :created, location: @college
    else
      render json: @college.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colleges/1
  def update
    if @college.update(college_params)
      render json: @college
    else
      render json: @college.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colleges/1
  def destroy
    @college.destroy
  end

  #search for colleges and courses
  def search_colleges_and_courses
    keywords = params[:keyword].to_s.split
    colleges = College.where("full_name ilike '%#{keywords[0]}%'").select("id,full_name,city,country,about")
    courses = Course.where("courses.full_name ilike '%#{keywords[0]}%'").joins(:college).select("courses.id,courses.full_name, colleges.full_name as collge_name,colleges.id as college_id,colleges.city,colleges.country,courses.about")
    render json: {colleges: colleges, courses: courses}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def college_params
      params.require(:college).permit(:agent_id, :full_name, :address, :city, :country, :code, :about, :description,
                                      :website, :archived, )
    end
end
