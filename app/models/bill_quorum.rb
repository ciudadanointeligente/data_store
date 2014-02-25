class BillQuorum
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :quorum, type: Array
  field :raw_quorum, type: String
  field :date_scraped, type: Time

  include Sunspot::Mongoid2
  searchable do
    text :uid
    text :quorum
    text :raw_quorum
    time :date_scraped
  end
end
