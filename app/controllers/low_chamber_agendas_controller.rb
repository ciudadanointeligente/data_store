class LowChamberAgendasController < ApplicationController
  # GET /low_chamber_agendas
  # GET /low_chamber_agendas.json

  before_action :get_low_chamber_agenda#, except: [:index, :new, :create]

  def index
    @low_chamber_agendas = LowChamberAgenda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @low_chamber_agendas }
    end
  end

  # GET /low_chamber_agendas/1
  # GET /low_chamber_agendas/1.json
  def show
    # @low_chamber_agenda = LowChamberAgenda.find(params[:id])
    # @low_chamber_agenda = LowChamberAgenda.find_by(uid: params[:id])
    # get_low_chamber_agenda params[:id]

    puts 'low_chamber_agenda'
    puts @low_chamber_agenda
    puts '/low_chamber_agenda'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @low_chamber_agenda }
      format.xml { render xml: @low_chamber_agenda }
    end
  end

  # GET /low_chamber_agendas/new
  # GET /low_chamber_agendas/new.json
  def new
    @low_chamber_agenda = LowChamberAgenda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @low_chamber_agenda }
    end
  end

  # GET /low_chamber_agendas/1/edit
  def edit
    # @low_chamber_agenda = get_low_chamber_agenda
    # @low_chamber_agenda = LowChamberAgenda.find(params[:id])
    # @low_chamber_agenda = LowChamberAgenda.find(params[:id])
  end

  # POST /low_chamber_agendas
  # POST /low_chamber_agendas.json
  def create
    @low_chamber_agenda = LowChamberAgenda.new(params[:low_chamber_agenda])

    respond_to do |format|
      if @low_chamber_agenda.save
        format.html { redirect_to @low_chamber_agenda, notice: 'Low chamber agenda was successfully created.' }
        format.json { render json: @low_chamber_agenda, status: :created, location: @low_chamber_agenda }
      else
        format.html { render action: "new" }
        format.json { render json: @low_chamber_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /low_chamber_agendas/1
  # PUT /low_chamber_agendas/1.json
  def update
    # @low_chamber_agenda = LowChamberAgenda.find(params[:id])

    respond_to do |format|
      if @low_chamber_agenda.update_attributes(params[:low_chamber_agenda])
        format.html { redirect_to @low_chamber_agenda, notice: 'Low chamber agenda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @low_chamber_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /low_chamber_agendas/1
  # DELETE /low_chamber_agendas/1.json
  def destroy
    # @low_chamber_agenda = LowChamberAgenda.find(params[:id])
    @low_chamber_agenda.destroy

    respond_to do |format|
      format.html { redirect_to low_chamber_agendas_url }
      format.json { head :no_content }
    end
  end

  def get_low_chamber_agenda
    @low_chamber_agenda = LowChamberAgenda.find_by(uid: '361-110')
  end

end
