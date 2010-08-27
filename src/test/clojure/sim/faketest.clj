(ns sim.faketest
  (:use sim.main)
  (:use clojure.test))

(deftest test-fake
  (is (= 3 (+ 2 1))))
