# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_quorum do
    uid "MyString"
    quorum ""
    abstract "MyString"
    date_scraped "2014-02-24 17:31:26"
  end
end
