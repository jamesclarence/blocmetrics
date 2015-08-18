class RegisteredApplicationsController < ApplicationController
  # before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  # GET /registered_applications
  # GET /registered_applications.json
  def index
    @registered_applications = RegisteredApplication.all
  end

  # GET /registered_applications/1
  # GET /registered_applications/1.json
  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  # GET /registered_applications/new
  def new
    @registered_application = RegisteredApplication.new
  end

  # GET /registered_applications/1/edit
  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  # POST /registered_applications
  # POST /registered_applications.json
  def create
    @registered_application = RegisteredApplication.new(registered_application_params)

    respond_to do |format|
      if @registered_application.save
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully created.' }
        format.json { render :show, status: :created, location: @registered_application }
      else
        format.html { render :new }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_applications/1
  # PATCH/PUT /registered_applications/1.json
  def update
    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_applications/1
  # DELETE /registered_applications/1.json
  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    @registered_application.destroy
    respond_to do |format|
      format.html { redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

    # # Use callbacks to share common setup or constraints between actions.
    # def set_registered_application
    #   @registered_application = RegisteredApplication.find(params[:id])
    # end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def registered_application_params
    #   params[:registered_application]
    # end
end
