(ns bob
  (:require [clojure.string :as str]))

(defn response-for [s] ;; <- arglist goes here
  ;; your code goes here
  (cond
    (and (re-seq #"\?$" s)
         (re-seq #"(?!^)[A-Z]+" s)
         (not (re-seq #"[a-z]" s))) "Calm down, I know what I'm doing!"
    (and (re-seq #"!$" s)
         (not (re-seq #"Let" s))) "Whoa, chill out!"
    (and (re-seq #"(?!^)[A-Z]+" s)
         (not (re-seq #"[a-z]" s))) "Whoa, chill out!"
    (re-seq #"\?$" s) "Sure."
    (str/blank? s) "Fine. Be that way!"
    :else "Whatever."))
