(ns word-count
  (:require [clojure.string :as str])
  (:use [clojure.repl]))

(defn word-count [s] ;; <- arglist goes here
  ;; your code goes here

  (let [words (as-> s $
                (str/replace $ #"[!:&@%^,$]" "")
               (str/split $ #" +"))]
    (reduce (fn [res word]
              (let [word (.toLowerCase word)]
               (if (contains? res word)
                 (update res word inc)
                 (assoc res word 1))))
            nil
            words)))
