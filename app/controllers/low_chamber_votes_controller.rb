class LowChamberVotesController < ApplicationController
  # GET /low_chamber_votes
  # GET /low_chamber_votes.json

  before_action :get_low_chamber_vote#, except: [:index, :new, :create]

  def index
    @low_chamber_votes = LowChamberVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @low_chamber_votes }
    end
  end

  # GET /low_chamber_votes/1
  # GET /low_chamber_votes/1.json
  def show
    # @low_chamber_vote = LowChamberVote.find(params[:id])
    # @low_chamber_vote = LowChamberVote.find_by(uid: params[:id])
    # get_low_chamber_vote params[:id]

    puts 'low_chamber_vote'
    puts @low_chamber_vote
    puts '/low_chamber_vote'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @low_chamber_vote }
      format.xml { render xml: @low_chamber_vote }
    end
  end

  # GET /low_chamber_votes/new
  # GET /low_chamber_votes/new.json
  def new
    @low_chamber_vote = LowChamberVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @low_chamber_vote }
    end
  end

  # GET /low_chamber_votes/1/edit
  def edit
    # @low_chamber_vote = get_low_chamber_vote
    # @low_chamber_vote = LowChamberVote.find(params[:id])
    # @low_chamber_vote = LowChamberVote.find(params[:id])
  end

  # POST /low_chamber_votes
  # POST /low_chamber_votes.json
  def create
    @low_chamber_vote = LowChamberVote.new(params[:low_chamber_vote])

    respond_to do |format|
      if @low_chamber_vote.save
        format.html { redirect_to @low_chamber_vote, notice: 'Low Chamber Vote was successfully created.' }
        format.json { render json: @low_chamber_vote, status: :created, location: @low_chamber_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @low_chamber_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /low_chamber_votes/1
  # PUT /low_chamber_votes/1.json
  def update
    # @low_chamber_vote = LowChamberVote.find(params[:id])

    respond_to do |format|
      if @low_chamber_vote.update_attributes(params[:low_chamber_vote])
        format.html { redirect_to @low_chamber_vote, notice: 'Low Chamber Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @low_chamber_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /low_chamber_votes/1
  # DELETE /low_chamber_votes/1.json
  def destroy
    # @low_chamber_vote = LowChamberVote.find(params[:id])
    @low_chamber_vote.destroy

    respond_to do |format|
      format.html { redirect_to low_chamber_votes_url }
      format.json { head :no_content }
    end
  end

  def get_low_chamber_vote
    @low_chamber_vote = LowChamberVote.find_by(uid: '17215')
  end
end
