;;; hello-world-test.el --- Tests for Hello World (exercism)

;;; Commentary:
;; Common test data version: 1.1.0 be3ae66

;;; Code:

(load-file "hello-world.el")


(ert-deftest init-test ()
  (should (= (+ 1 2) 3)))

(ert-deftest init-test-1 ()
  :expected-result :failed
  (should (= (+ 1 2) 4)))


(ert-deftest test-divide-by-zero ()
  (should-error (/ 1 0)
                :type 'arith-error))

(ert-deftest hello-world-test ()
  (should (equal (hello) "Hello, World!")))

(provide 'hello-world-test)

;;; hello-world-test.el ends here
