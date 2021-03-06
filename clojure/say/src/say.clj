(ns say
  (:require [clojure.string :as str]))

(defn say-1->9 [digit]
  (case digit
    ;;    0 "zero"
    1 "one"
    2 "two"
    3 "three"
    4 "four"
    5 "five"
    6 "six"
    7 "seven"
    8 "eight"
    9 "nine"))

(defn prefix [digit]
  (case digit
    2 "twen"
    3 "thir"
    5 "fif"
    6 "six"
    7 "seven"
    8 "eigh"
    9 "nine"))

(defn say-13-19 [num]
  (case num
    14 "fourteen"
    (str (prefix (mod num 10)) "teen")))

(defn say-20-90 [num]
  (case num
    40 "forty"
    (str (prefix (quot num 10)) "ty")))

(defn say-10->99 [num]
  (case num
    10 "ten"
    11 "eleven"
    12 "twelve"
    ;; 13 "thirteen"
    ;; 14 "fourteen"
    ;; 15 "fifteen"
    ;; 16 "sixteen"
    ;; 17 "seventeen"
    ;; 18 "eighteen"
    ;; 19 "nineteen"
    ;; 20 "twenty"
    ;; 30 "thirty"
    ;; 40 "forty"
    ;; 50 "fifty"
    ;; 60 "sixty"
    ;; 70 "seventy"
    ;; 80 "eighty"
    ;; 90 "ninety"
    (cond
      (< num 20)           (say-13-19 num)
      (zero? (mod num 10)) (say-20-90 num)
      :else                (str (say-10->99 (* 10 (quot num 10)))
                                "-"
                                (say-1->9 (rem num 10))))))

(defn say-1->99 [num]
  (if (< num 10)
    (say-1->9 num)
    (say-10->99 num)))

(defn say-1->999 [num]
  (if (< num 100)
    (say-1->99 num)
    (let [hundred-part (str (say-1->9 (quot num 100)) " hundred")]
     (if (zero? (mod num 100))
       hundred-part
       (str hundred-part " " #_" and " (say-1->99 (rem num 100)))))))

#_(defn vector-1->9 [num]
  (vector (say-1->9 num)))

#_(defn vector-1->99 [num]
  (vector (say-1->99 num)))

#_(defn vector-1->999 [num]
  (if (< num 100)
    (say-1->99 num)
    (let [hundred-part (str (say-1->9 (quot num 100)) " hundred")]
      (if (zero? (mod num 100))
        [hundred-part]
        [hundred-part (say-1->99 (rem num 100))]))))

(def scale->word
  {1 ""
   1000 "thousand"
   1000000 "million"
   1000000000 "billion"
   1000000000000 "trillion"})

(defn to-chunks [num]
  (loop [res    {}
         scale  1
         number num]
    (cond
      (zero? number)  res
      (>= number 1000) (recur (assoc res (scale->word scale) (rem number 1000))
                              (* 1000 scale)
                              (quot number 1000))
      :else (recur (assoc res (scale->word scale) number)
                   scale
                   0))))

(defn breaking [num]
  (if-not (< num 999999999999)
    (throw (IllegalArgumentException.)))
  (->> num
       to-chunks
       reverse
       (filter (fn [[k v]] (not (zero? v))))
       (into {})))

#_(defn say-and-1->99 [num]
  (str "and " (say-1->99 num)))

(defn say-and-1->999 [num]
  (str #_"and " (say-1->999 num)))

(defn say-tail [chunks]
  (cond
    (and (> (count chunks) 1) (contains? chunks "")) (let [say (say-1->999 (get chunks ""))]
                                                       (if (re-seq #"and" say)
                                                         (say-1->999 (get chunks ""))
                                                         (say-and-1->999 (get chunks ""))))
    (contains? chunks "") (say-1->999 (get chunks ""))
    :else ""))

(defn drop-last-if-contains-empty [chunks]
  (if (contains? chunks "")
    (dissoc chunks "")
    chunks))

(defn has-tail? [chunks]
  (contains? chunks ""))

(defn compose [chunks]
  (let [head (vec (flatten (map (fn [[k v]] [(say-1->999 v) k]) (drop-last-if-contains-empty chunks))))]
    (str/join
     " "
     (if (has-tail? chunks)
       (conj head (say-tail chunks))
       head))))

(defn number [num] ;; <- arglist goes here
  ;; your code goes here
  (cond
    (< num 0) (throw (IllegalArgumentException.))
    (zero? num) "zero"
    :else (compose (breaking num))))

#_(do
  (prn (say-1->999 14))
  (prn (say-1->999 50))
  (prn (say-1->999 98))
  (prn (say-1->999 100))
  (prn (say-1->999 101))
  (prn (say-1->999 120))
  (prn (say-1->999 900))
  (prn (say-1->999 999)))

#_(do
  (prn (to-chunks 14))
  (prn (to-chunks 100))
  (prn (to-chunks 101))
  (prn (to-chunks 140))
  (prn (to-chunks 999))
  (prn (to-chunks 1000))
  (prn (to-chunks 1001))
  (prn (to-chunks 1011))
  (prn (to-chunks 1101))
  (prn (to-chunks 9999))
  (prn (to-chunks 10009))
  (prn (to-chunks 19999))
  (prn (to-chunks 1010009))
  (prn (to-chunks 1102009)))
