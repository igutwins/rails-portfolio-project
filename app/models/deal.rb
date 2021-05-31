class Deal < ActiveRecord::Base
    belongs_to :deal_team
    belongs_to :industry
    has_many :users, through: :deal_teams

    def npv_func
        y1 = self.entry_cash*(1+self.interim_growth/100)
        y2 = self.entry_cash*(1+self.interim_growth/100)**2
        y3 = self.entry_cash*(1+self.interim_growth/100)**3
        y4 = self.entry_cash*(1+self.interim_growth/100)**4
        y5 = self.entry_cash*(1+self.interim_growth/100)**5 + self.entry_cash*(1+self.interim_growth/100)**5/(self.discount_rate/100 - self.terminal_growth/100)
        ans = y1/(1+self.discount_rate/100)**1 + y2/(1+self.discount_rate/100)**2 + y3/(1+self.discount_rate/100)**3 + y4/(1+self.discount_rate/100)**4 + y5/(1+self.discount_rate/100)**5
    end

end 