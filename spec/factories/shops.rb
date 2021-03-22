FactoryBot.define do
  factory :shop do
    name { 'shop1' }
    brand { 'shopshop' }
    address { '1-1-1 Shibuya,Tokyo' }
    start_dt { '09:00' }
    end_dt { '20:00' }
    detail { '10月にオープンしたメンズ服のお店です' }
    contact_detail { '0123456789' }
    url { 'http:' }
  end
  factory :shop2, class: Shop do
    name { 'shop2' }
    brand { 'shopshop2' }
    address { '1-1-1 Otsuka,Tokyo' }
    start_dt { '09:00' }
    end_dt { '20:00' }
    detail { '去年オープンしたベビー服のお店です' }
    contact_detail { '0901111111' }
    url { 'http:' }
  end
  factory :shop3, class: Shop do
    name { 'shop3' }
    brand { 'shopshop3' }
    address { '1-1-1 Umeda, Osaka' }
    start_dt { '10:00' }
    end_dt { '20:00' }
    detail { '古着のお店です' }
    contact_detail { '01201111111' }
  end
end
