class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def self.oldest_company 
        self.order(:founding_year).first
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end

end
