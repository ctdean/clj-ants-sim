;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ant sim ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Copyright (c) Rich Hickey. All rights reserved.
;   The use and distribution terms for this software are covered by the
;   Common Public License 1.0 (http://opensource.org/licenses/cpl.php)
;   which can be found in the file CPL.TXT at the root of this distribution.
;   By using this software in any fashion, you are agreeing to be bound by
;   the terms of this license.
;   You must not remove this notice, or any other, from this software.

;;; Modified to use as an example on how to build a Clojure project
;;; using buildr
;;;
;;; Chris Dean

(ns sim.main
  (:use sim.ants)
  (:use clojure.contrib.math))

(defn -main []
  (printf "Starting ants simulation\n")
  (let [start (System/currentTimeMillis)
        _ (create-frame)
        ants (setup)]
    (send-off animator animation)
    (dorun (map #(send-off % behave) ants))
    (send-off evaporator evaporation)

    (let [dur (- (System/currentTimeMillis) start)]
      (printf "Started ants simulation in %s seconds\n" 
              (round (/ dur 1000.0))))))


