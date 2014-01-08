class LowChamberAgenda
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :date, type: Time
  field :legislature, type: String
  field :session, type: String
  field :bill_list, type: Array

  include Sunspot::Mongoid2
  searchable do
    text :uid
    time :date
    text :legislature
    text :session
    text :bill_list
  end
end