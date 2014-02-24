class BillQuorum
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :quorum, type: Array
  field :abstract, type: String
  field :date_scraped, type: Time

  include Sunspot::Mongoid2
  searchable do
    text :uid
    text :quorum
    text :abstract
    time :date_scraped
  end
end
