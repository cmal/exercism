(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [s]
  (loop [current nil
         counter 0
         sub-s s
         res ""]
    (if (empty? sub-s)
      (str res
           (when-not (zero? counter)
             (if (= 1 counter)
               current
               (str counter current))))
      (let [char (first sub-s)]
       (if (= char current)
         (recur char
                (inc counter)
                (rest sub-s)
                res)
         (recur char
                1
                (rest sub-s)
                (str res
                     (when-not (zero? counter)
                       (if (= 1 counter)
                         current
                        (str counter current))))))))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [s]
  (let [groups (re-seq #"(\d+)?[ 0-9a-zA-z]" s)]
    (str/join
     (for [[group cnt] groups]
       (if (nil? cnt)
         group
         (let [cnt (read-string cnt)
               char (last group)]
           (str/join (repeat cnt char))))))))
