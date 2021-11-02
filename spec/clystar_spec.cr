require "./spec_helper"

include Clystar

def dec(x)
  x - 1
end

def times2(x)
  x * 2.0
end

describe Clystar do
  it "pipes methods and procs with `pipe` macro" do
    pipeline = pipe Int32,
      ->dec(Int32),
      times2,
      ->(x : Float64) { x.to_s }

    pipeline.call(3).should eq("4.0")
  end

  it "composes procs with `>>` operator" do
    composition = ->dec(Int32) >> ->times2(Int32) >> ->(x : Float64) { x.to_s }
    composition.call(3).should eq("4.0")
  end

  it "juxtaposes results from methods and procs into a tuple with `juxt` macro" do
    juxtaposition = juxt Int32,
      dec,
      ->times2(Int32),
      ->(x : Int32) { x.to_s }

    juxtaposition.call(3).should eq({2, 6.0, "3"})
  end
end
