(ns armstrong-numbers
  )

(defn armstrong? [n]
  (let [digits (map #(- (int %) 48) (.toString n))
        cnt (count digits)]
    (= n (int (apply + (map #(Math/pow % cnt) digits))))))
