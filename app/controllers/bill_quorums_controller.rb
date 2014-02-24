class BillQuorumsController < ApplicationController
  # GET /bill_quorums
  # GET /bill_quorums.json

  before_action :get_bill_quorum#, except: [:index, :new, :create]

  def index
    @bill_quorums = BillQuorum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bill_quorums }
    end
  end

  # GET /bill_quorums/1
  # GET /bill_quorums/1.json
  def show
    # @bill_quorum = BillQuorum.find(params[:id])
    # @bill_quorum = BillQuorum.find_by(uid: params[:id])
    # get_bill_quorum params[:id]

    puts 'bill_quorum'
    puts @bill_quorum
    puts '/bill_quorum'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill_quorum }
      format.xml { render xml: @bill_quorum }
    end
  end

  # GET /bill_quorums/new
  # GET /bill_quorums/new.json
  def new
    @bill_quorum = BillQuorum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill_quorum }
    end
  end

  # GET /bill_quorums/1/edit
  def edit
    # @bill_quorum = get_bill_quorum
    # @bill_quorum = BillQuorum.find(params[:id])
    # @bill_quorum = BillQuorum.find(params[:id])
  end

  # POST /bill_quorums
  # POST /bill_quorums.json
  def create
    @bill_quorum = BillQuorum.new(params[:bill_quorum])

    respond_to do |format|
      if @bill_quorum.save
        format.html { redirect_to @bill_quorum, notice: 'Bill Quorum was successfully created.' }
        format.json { render json: @bill_quorum, status: :created, location: @bill_quorum }
      else
        format.html { render action: "new" }
        format.json { render json: @bill_quorum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bill_quorums/1
  # PUT /bill_quorums/1.json
  def update
    # @bill_quorum = BillQuorum.find(params[:id])

    respond_to do |format|
      if @bill_quorum.update_attributes(params[:bill_quorum])
        format.html { redirect_to @bill_quorum, notice: 'Bill Quorum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill_quorum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_quorums/1
  # DELETE /bill_quorums/1.json
  def destroy
    # @bill_quorum = BillQuorum.find(params[:id])
    @bill_quorum.destroy

    respond_to do |format|
      format.html { redirect_to bill_quorums_url }
      format.json { head :no_content }
    end
  end

  def get_bill_quorum
    @bill_quorum = BillQuorum.find_by(uid: '6189-06')
  end
end
