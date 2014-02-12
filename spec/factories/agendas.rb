# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agenda do
    uid "MyString"
    date "2014-02-12 15:44:03"
    chamber "MyString"
    legislature "MyString"
    session "MyString"
    bill_list ""
    date_scraped "2014-02-12 15:44:03"
  end
end
