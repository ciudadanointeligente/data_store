class Agenda
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :date, type: Time
  field :chamber, type: String
  field :legislature, type: String
  field :session, type: String
  field :bill_list, type: Array
  field :date_scraped, type: Time

  include Sunspot::Mongoid2
  searchable do
    text :uid
    time :date
    text :chamber
    text :legislature
    text :session
    text :bill_list
    time :date_scraped
  end
end
