class Deliverymethod < ActiveHash::Base
  self.data = [
      {id: 1, name: '大型らくらくフリマ便'}, {id: 2, name: '中型らくらくフリマ便'}, {id: 3, name: '小型らくらくフリマ便'}
  ]
end