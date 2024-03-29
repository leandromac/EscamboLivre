class Order < ActiveRecord::Base

  enum status: [:requested, :waiting, :analysing, :paid, :avaliable,
    :dispute, :returned, :canceled, :debited, :temporary_retention]

  belongs_to :ad
  belongs_to :buyer, class_name: "Member"
end
