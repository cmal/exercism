(ns isbn-verifier
  (:require [clojure.string :as str])
  (:use [clojure.repl]))

(defn str-index [s]
  (map vector (iterate inc 0) s))

(defn char->int [char]
  (- (int char) 48))

(defn isbn? [isbn]
  (let [isbn (str/replace isbn #"-" "")]
    (and
     (= 10 (count isbn))
     (some? (re-seq #"[0-9]{9}[0-9X]" isbn))
     (let [tail   (last isbn)
           heads  (drop-last isbn)
           serial (cons
                   (if (= \X tail) 10 (char->int tail))
                   (for [[index c] (str-index heads)]
                     (* (- 10 index) (char->int c))))]
       (-> (apply + serial)
           (mod 11)
           zero?)))))
