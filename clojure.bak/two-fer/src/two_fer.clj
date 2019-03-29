(ns two-fer)

(defn two-fer
  ([]
   (two-fer "you"))
  ([x]
   (str "One for " x ", one for me.")))
