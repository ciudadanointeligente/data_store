class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :uid
  validates_uniqueness_of :uid

  field :uid, type: String
  field :chamber, type: String
  field :date, type: String
  field :type_content, type: String
  field :type_code, type: String
  field :result_content, type: String
  field :result_code, type: String
  field :quorum_content, type: String
  field :quorum_code, type: String
  field :session_id, type: String
  field :session_number, type: String
  field :session_date, type: String
  field :session_type_content, type: String
  field :session_type_code, type: String
  field :bill_id, type: String
  field :article, type: String
  field :procedure_content, type: String
  field :procedure_code, type: String
  field :report_content, type: String
  field :report_code, type: String
  field :total_affirmative, type: String
  field :total_negative, type: String
  field :total_abstentions, type: String
  field :total_dispensed, type: String
  field :date_scraped, type: Time

  include Sunspot::Mongoid2
  searchable do
    text :uid
    text :bill_id
    time :date_scraped
  end
end
