(ns anagram)

(defn word->mp [word]
  (reduce (fn [res c]
            (if (contains? res c)
              (update res c inc)
              (assoc res c 1)))
          nil
          word))

(defn anagrams-for [s v] ;; <- arglist goes here
  ;; your code goes here
  (let [s (.toLowerCase s)
        target-mp (word->mp s)]
    (filter
     (fn [w]
       (let [w (.toLowerCase w)]
        (and
         (not= s w)
         (= target-mp
            (word->mp w)))))
     v)))
