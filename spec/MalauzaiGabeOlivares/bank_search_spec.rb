require "spec_helper"
require "./bank_search"

describe BankSearch do
  it "returns a correct bank search object with type bank" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "bank")
    expect(bank_search.lat).to eq("30.4284750")
    expect(bank_search.long).to eq("-97.7550500")
    expect(bank_search.type).to eq("bank")
    expect(bank_search.valid).to eq(true)
  end

  it "returns a correct bank search object with type atm" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "atm")
    expect(bank_search.lat).to eq("30.4284750")
    expect(bank_search.long).to eq("-97.7550500")
    expect(bank_search.type).to eq("atm")
    expect(bank_search.valid).to eq(true)
  end

  it "returns a correct bank search object with type all" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "ALL")
    expect(bank_search.lat).to eq("30.4284750")
    expect(bank_search.long).to eq("-97.7550500")
    expect(bank_search.type).to eq("all")
    expect(bank_search.valid).to eq(true)
  end

  it "returns a incorrect bank search object when the type is bar" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "bar")
    expect(bank_search.lat).to eq("30.4284750")
    expect(bank_search.long).to eq("-97.7550500")
    expect(bank_search.type).to eq("bar")
    expect(bank_search.valid).to eq(false)
  end

  it "returns a incorrect bank search object when the latitude is invalid" do
    bank_search = BankSearch.new("320000.535715", "-97.7550500", "bank")
    expect(bank_search.lat).to eq("320000.535715")
    expect(bank_search.long).to eq("-97.7550500")
    expect(bank_search.type).to eq("bank")
    expect(bank_search.valid).to eq(false)
  end

  it "returns a incorrect bank search object when the longitude is invalid" do
    bank_search = BankSearch.new("30.4284750", "-9227.680135", "bank")
    expect(bank_search.lat).to eq("30.4284750")
    expect(bank_search.long).to eq("-9227.680135")
    expect(bank_search.type).to eq("bank")
    expect(bank_search.valid).to eq(false)
  end

  it "successful results returns a hash that is not empty and 200 code with bank" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "bank")
    search_code = bank_search.search.values[0]
    location_count = bank_search.search.values[1].count
    expect(search_code).to eq(200)
    expect(location_count).to eq(5)
    expect(bank_search.search).not_to be_empty
  end

  it "successful results returns a hash that is not empty and 200 code with atm" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "atm")
    search_code = bank_search.search.values[0]
    location_count = bank_search.search.values[1].count
    expect(search_code).to eq(200)
    expect(location_count).to eq(5)
    expect(bank_search.search).not_to be_empty
  end

  it "successful results returns a hash that is not empty and 200 code with all" do
    bank_search = BankSearch.new("30.4284750", "-97.7550500", "all")
    search_code = bank_search.search.values[0]
    location_count = bank_search.search.values[1].count
    expect(search_code).to eq(200)
    expect(location_count).to eq(10)
    expect(bank_search.search).not_to be_empty
  end
end
