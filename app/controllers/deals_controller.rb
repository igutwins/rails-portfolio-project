class DealsController < ActionController::Base

    def index
        @deals = Deal.all
    end

    def show
        @deal = Deal.find(params[:id])
    end

    def new #renders new form - no database work
        @deal = Deal.new
    end 

    def create #creates new record in db
        @deal = Deal.new(post_params) #strong params
        #@deal.name = params[:deal][:name]
        #@deal.entry_cash = params[:deal][:entry_cash]
        #@deal.interim_growth = params[:deal][:interim_growth]
        #@deal.terminal_growth = params[:deal][:terminal_growth]
        #@deal.discount_rate = params[:deal][:discount_rate]
        @deal.npv = @deal.npv_func
        @deal.save
        redirect_to deal_path(@deal)
    end

    def edit #presents the edit form
        @deal = Deal.find(params[:id])
    end 

    def update #handles the db update action
        @deal = Deal.find(params[:id])
        @deal.update(post_params) #strong params
        #@deal.update(name: params[:deal][:name], entry_cash: params[:deal][:entry_cash], interim_growth: params[:deal][:interim_growth], terminal_growth: params[:deal][:terminal_growth], discount_rate: params[:deal][:discount_rate])
        @deal.update(npv: @deal.npv_func)
        redirect_to deal_path(@deal)
    end

    private 

    def post_params
        params.require(:deal).permit(:name, :entry_cash, :interim_growth, :terminal_growth, :discount_rate)
    end 

end