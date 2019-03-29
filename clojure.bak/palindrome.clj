(ns palindrome)

(defn palindrome? [s]
 (loop [res     true
        head 0
        tail    (dec (count s))]
   (if-not res
     false
     (if (>= head tail)
       true
       (recur
        (= (get s head) (get s tail))
        (inc head)
        (dec tail))))))
