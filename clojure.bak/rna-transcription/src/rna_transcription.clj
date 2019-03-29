(ns rna-transcription
  (:require [clojure.string :as str]))

(defn complement-dna [char]
  (assert (contains? #{\G \C \T \A} char))
  (case char
    \G \C
    \C \G
    \T \A
    \A \U))

(defn to-rna [dna]
  (str/join
   (map complement-dna dna)))
