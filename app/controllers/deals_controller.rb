class DealsController < ApplicationController
    before_action :authentication_required
    before_action :set_deal, only: [:show, :edit, :update, :destroy]

    def index
        @deals = Deal.all
    end

    def show
        #@deal = Deal.find(params[:id]) not needed with before action
    end

    def new #renders new form - no database work
        @deal = Deal.new
    end 
    
    def edit #presents the edit form
        #@deal = Deal.find(params[:id]) not needed with before action
    end

    def create #creates new record in db
        @deal = Deal.new(deal_params) #strong params
        @deal.npv = @deal.npv_func
        @deal.deal_team = DealTeam.first ##this is bad and needs to be changed

        respond_to do |format|
            if @deal.save
                format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
                format.json { render :show, status: :created, location: @deal }
            else
                raise params.inspect
                format.html { render :new }
                format.json { render json: @deal.errors, status: :unprocessable_entity }
            end 
        end 

    end

    def update #handles the db update action
        #@deal = Deal.find(params[:id])
        respond_to do |format|
        if @deal.update(deal_params) && @deal.update(npv: @deal.npv_func)#strong params
            format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
            format.json { render :show, status: :ok, location: @deal }
        else 
            format.html { render :edit }
            format.json { render json: @deal.errors, status: :unprocessable_entity }
        end 
    end
        #@deal.update(name: params[:deal][:name], entry_cash: params[:deal][:entry_cash], interim_growth: params[:deal][:interim_growth], terminal_growth: params[:deal][:terminal_growth], discount_rate: params[:deal][:discount_rate])
        
        #redirect_to deal_path(@deal)
    end

    def destroy
        @deal.destroy
        respond_to do |format|
            format.html { redirect_to deals_path, notice: 'Deal was successfully deleted.' }
            format.json { head :no_content }
        end 
    
    end 

    private 
    
    def set_deal
        @deal = Deal.find(params[:id])    
    end 

    def deal_params
        params.require(:deal).permit(:name, :entry_cash, :interim_growth, :terminal_growth, :discount_rate, :industry_id)
    end 

end