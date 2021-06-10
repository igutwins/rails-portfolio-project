class DealsController < ApplicationController
    before_action :authentication_required
    before_action :set_deal, only: [:show, :edit, :update, :destroy]

    def index
        if is_managing_director
            @alldeals = Deal.all
        end 
        @deals = current_user.deals
        @user = current_user
    end

    def show
    end

    def alpha
        if is_managing_director
            @alldeals = Deal.all.alpha
        end 
        @deals = current_user.deals.alpha
        @user = current_user
        render :index
    end 

    def new 
        @deal = Deal.new
        @dt = DealTeam.new
        @dtu = DealTeamsUser.new
    end 
    
    def edit 
    end

    def create #creates new record in db
        @dt = DealTeam.new
        @dt.name = params[:deal_team][:name]
        @dt.save
        @deal = Deal.new(deal_params) #strong params
        @deal.deal_team = @dt
        DealTeamsUser.create(:deal_team => @dt, :user => current_user)
        params[:deal][:id].each do |x|
            if x != "" 
                y = DealTeamsUser.new
                y.deal_team = @dt
                y.user = User.find(x)
                y.save
            end 
        end
        @deal.npv = @deal.npv_func

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

    def update 
        respond_to do |format|
        if @deal.update(deal_params) && @deal.update(npv: @deal.npv_func)
            format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
            format.json { render :show, status: :ok, location: @deal }
        else 
            format.html { render :edit }
            format.json { render json: @deal.errors, status: :unprocessable_entity }
        end 
    end

    end

    def destroy
        @deal.destroy
        respond_to do |format|
            format.html { redirect_to user_deals_path, notice: 'Deal was successfully deleted.' }
            format.json { head :no_content }
        end 
    
    end 

    private 
    
    def set_deal
        @deal = Deal.find(params[:id])    
    end 

    def deal_params
        params.require(:deal).permit(:name, :entry_cash, :interim_growth, :terminal_growth, :discount_rate, :industry_id, deal_teams_attributes: [:name])
    end 


end