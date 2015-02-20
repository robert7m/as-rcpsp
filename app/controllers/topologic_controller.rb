class TopologicController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  # GET /procedure_procedures
  # GET /procedure_procedures.json
  def index
    @procedure_procedures = Topologic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procedure_procedures }
    end
  end

  # GET /procedure_procedures/1
  # GET /procedure_procedures/1.json
  def show
    @procedure_procedure = Topologic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @procedure_procedure }
    end
  end

  # GET /procedure_procedures/new
  # GET /procedure_procedures/new.json
  def new
    @procedure_procedure = Topologic.new
  #  @procedure_procedure.build_from_procedure
  #  @procedure_procedure.build_to_procedure


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @procedure_procedure }
    end
  end

  # GET /procedure_procedures/1/edit
  def edit
    @procedure_procedure = Topologic.find(params[:id])
  end

  # POST /procedure_procedures
  # POST /procedure_procedures.json
  def create
    @procedure_procedure = Topologic.new(params[:procedure_procedure])
    respond_to do |format|
      if @procedure_procedure.save
        format.html { redirect_to @procedure_procedure, notice: 'Vorgang wurde erfolgreich angelegt!' }
        format.json { render json: @procedure_procedure, status: :created, location: @procedure_procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @procedure_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /procedure_procedures/1
  # PUT /procedure_procedures/1.json
  def update
    @procedure_procedure = Topologic.find(params[:id])

    respond_to do |format|
      if @procedure_procedure.update_attributes(params[:procedure_procedure])
        format.html { redirect_to @procedure_procedure, notice: 'Vorgang wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @procedure_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_procedures/1
  # DELETE /procedure_procedures/1.json
  def destroy
    @procedure_procedure = Topologic.find(params[:id])
    @procedure_procedure.destroy

    respond_to do |format|
      format.html { redirect_to procedure_procedures_url }
      format.json { head :no_content }
    end
  end
end


private

def signed_in_user
  unless signed_in?
    store_location
    redirect_to signin_path, notice: "Bitte melden Sie sich an."
  end
end