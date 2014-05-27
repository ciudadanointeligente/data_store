legislative-middleware
======================

Chilean parliamentary monitoring middleware.

##Install

Make sure you have ruby 2.0 and bundler installed. If not visit
https://rvm.io/rvm/install  and http://bundler.io/

Make sure you have mongodb installed
if not follow instructions at http://docs.mongodb.org/manual/tutorial/

clone the legislative-middleware project
```
git clone git@github.com:ciudadanointeligente/legislative-middleware.git
```

go to the legislative-middleware project folder install gems
```
bundle install
```

create all config files, and modify according to server
```
cp config.ru.example config.ru
cp config/sunspot.yml.example config/sunspot.yml
cp config/mongoid.yml.example config/mongoid.yml
cp config/hateoas.yml.example config/hateoas.yml
```

start solr for search indexing
```
bundle exec rake sunspot:solr:start
```

make sure solr is running. Type the following url in your browser:
```
http://localhost:8983
```

run the service:
```
bundle exec rails s
```
visit http://localhost:3000 to see the middleware running

##Usage
###GET bill
* /bills/id.json => bill by id in json format
* /bills/id.xml => bill by id in xml format
* /bills/new => create a new bill by filling in a form
* /bills/id/edit => not working

###GET search
* /bills/search.json?q=term => search for "term" in all fields
* /bills/search.json?title=hello|hola&tags=world => search for bills with title similar to "hello" or "hola" and with the tag "world"

###POST
* /bills => creates new bill

###PUT
* /bills/id => modifies bill

###DELETE
* /bills/id => deletes bill

##ROAR usage (the nice way)
For info of how ROAR works go to https://github.com/apotonick/roar
Essentially, you can work on your application as if you had local objects, when they're really in another server

requrie gems "billit_representers" and "roar" in your local project, or add them to your gemfile
```
gem 'billit_representers'
gem 'roar'
```

###Bills
extend your local model. Example model:
```
require 'roar/representer/feature/client'
require 'billit_representers/representers/bill_representer'

class Bill
  include Roar::Representer::Feature::HttpVerbs

  def initialize(*)
    extend Billit::BillRepresenter
    extend Roar::Representer::Feature::Client
    # transport_engine = Roar::Representer::Transport::Faraday
    @persisted = true if @persisted.nil?
  end
end
```

GET bill
```
bill = Bill.new
bill.get('http://billit.ciudadanointeligente.org/bills/1-07', 'application/json')
```

POST (create new bill)
```
bill = Bill.new
bill.uid = '0-00'
bill.title = 'new title'
bill.post('http://billit.ciudadanointeligente.org/bills')
```

PUT (modify existing bill)
```
bill = Bill.new
bill.get('http://billit.ciudadanointeligente.org/bills/0-00', 'application/json')
bill.tags.push('tag')
bill.put('http://billit.ciudadanointeligente.org/bills/0-00', 'application/json')
```

###Bill Collections
extend your local page model. Example model:
```
require 'billit_representers/representers/bill_collection_page_representer'

class BillCollectionPage < OpenStruct
  include Roar::Representer::Feature::HttpVerbs

  def initialize
    extend Billit::BillCollectionPageRepresenter
    extend Roar::Representer::Feature::Client
    transport_engine = Roar::Representer::Transport::Faraday
  end

  def self
    links[:self].href if links[:self]
  end

  def next
    links[:next].href if links[:next]
  end

  def previous
    links[:previous].href if links[:previous]
  end
end
```

GET search
```
bill_page = BillCollectionPage.new
bill_page.get('http://billit.ciudadanointeligente.org/bills/search?q=term', 'application/json')
#bill array
bill_array = bill_page.bills
#next page
bill_next_page = BillCollectionPage.new
bill_next_page.get(bill_page.next, 'application/json')
```

### Reindexing
If you add information, like bills, through the post or put method, it gets automatically reindexed. If you add them manually or through the database the indexing has to be done manually. This can be done by executing the rails console
```
bundle exec rails console
```
and then executing the reindex method on your model name, for instance:
```
Bill.reindex
```

For small servers, on which the previous method gets killed for lack of memory, the following rake task can be executed
```
bundle exec rake sunspot:solr:reindex
```
This process is much slower.
