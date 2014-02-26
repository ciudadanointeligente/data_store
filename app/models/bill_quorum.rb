class BillQuorum
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :num_quorum, type: Array
  field :raw_quorum, type: Array
  field :date_scraped, type: Time

  include Sunspot::Mongoid2
  searchable do
    text :uid
    text :num_quorum
    text :raw_quorum
    time :date_scraped
  end
end
